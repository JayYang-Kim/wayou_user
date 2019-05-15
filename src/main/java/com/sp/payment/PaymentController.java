package com.sp.payment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.hotel.Hotel;
import com.sp.member.SessionInfo;
import com.sp.ticket.Ticket;
import com.sp.ticket.TicketService;

@Controller("payment.paymentController")
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value="/payInfo")
	@ResponseBody
	public Map<String, Object> pgInfo(@RequestParam int userIdx) {
		
		Payment dto = paymentService.payInfo(userIdx);
		
		Map<String, Object> model = new HashMap<>();
		model.put("payInfo", dto);
		
		return model;
	}
	
	@RequestMapping(value="/payment/orderMenu", method=RequestMethod.GET)
	public String orderMenu(
			@RequestParam int wishCode,
			@RequestParam int departCode,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Payment dto1 = new Payment();
		dto1.setUserIdx(info.getUserIdx());
		dto1.setWishCode(wishCode);
		dto1.setDepartCode(departCode);
		int mode=0;

		Payment dto = paymentService.payInfo(info.getUserIdx());
		model.addAttribute("dto",dto);
		if(departCode==1) {
			dto1=paymentService.readWish_dt(dto1);
			dto1.setTotalMoney(dto1.getAmount()*dto1.getPrice());
			mode=1;
		}
		if(departCode==2) {
			dto1=paymentService.readWish_dh(dto1);
			dto1.setTotalMoney(dto1.getAmount()*dto1.getPrice());
			mode=2;
		}
		model.addAttribute("amount",dto1.getTotalMoney());
		model.addAttribute("mode", mode);
		model.addAttribute("dto1",dto1);
		return ".payment.order";
		
	}
	
	@RequestMapping(value="/payment/AllorderMenu", method=RequestMethod.GET)
	public String AllorderMenu(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int userIdx=info.getUserIdx();
		int totalprice =0;
		int mode=3;
		Payment dto = paymentService.payInfo(userIdx);
		List<Payment> list_dt=paymentService.readWishA_dt(userIdx);
		for(Payment d : list_dt) {
			totalprice+=d.getAmount()*d.getPrice();
		}
		List<Payment> list_dh=paymentService.readWishA_dh(userIdx);
		for(Payment d : list_dh) {
			totalprice+=d.getAmount()*d.getPrice();
		}


		model.addAttribute("amount",totalprice);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", mode);
		model.addAttribute("list_dh",list_dh);
		model.addAttribute("list_dt",list_dt);
		model.addAttribute("totalMoney", totalprice);
		
		return ".payment.order";
	}
	
	@RequestMapping(value="/payment/insertPayment_wish", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertPayment(
			@RequestParam int wishCode,
			@RequestParam int mode,
			@RequestParam (defaultValue="부재시 경비실")String memo,
			@RequestParam String impCode,
			@RequestParam String paymethod,
			@RequestParam String status,
			HttpSession session
			) throws Exception{		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		int userIdx = info.getUserIdx();
		Payment dto = new Payment();
		dto.setWishCode(wishCode);
		dto.setUserIdx(userIdx);
		if(mode==2) {
			dto=paymentService.readWish_dh(dto);
			dto.setTotalMoney(dto.getAmount()*dto.getPrice());
			dto.setMemo(memo);
			paymentService.insertOrder_wish(dto);
		}
		if(mode==1) {
			dto=paymentService.readWish_dt(dto);
			dto.setTotalMoney(dto.getAmount()*dto.getPrice());
			dto.setMemo(memo);
			paymentService.insertOrder_wish(dto);
		}
		
		dto=paymentService.readOrderM(userIdx);
		
		if(mode==2) {
			Payment dh = new Payment();
			int orderCode=dto.getOrderCode();
			dh=paymentService.readWish_dh(dto);
			dh.setOrderCode(orderCode);
			paymentService.insertOrder_wishDh(dh);
		}
		if(mode==1) {
			Payment dt = new Payment();
			int orderCode=dto.getOrderCode();
			dt=paymentService.readWish_dt(dto);
			dt.setOrderCode(orderCode);
			paymentService.insertOrder_wishDt(dt);
		}
		
		dto=paymentService.readOrderM(userIdx);
		
		dto.setImpCode(impCode);
		dto.setPaymethod(paymethod);
		dto.setStatus(status);
		
		int result =paymentService.insertPayment_pay(dto);
		if(result==1) {
			if(mode==2) {
				paymentService.deleteWishdh(wishCode);
			}else if (mode==1) {
				paymentService.deleteWishdt(wishCode);
			}
			paymentService.deleteWish(wishCode);
		}
		
		model.put("status", "성공");
		return model;
	}
	
	@RequestMapping(value="/payment/insertPayment_wishA", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertPaymentA(
			@RequestParam int mode,
			@RequestParam (defaultValue="부재시 경비실")String memo,
			@RequestParam String impCode,
			@RequestParam String paymethod,
			@RequestParam String status,
			HttpSession session
			) throws Exception{		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		Payment ex = new Payment();
		int userIdx = info.getUserIdx();
		ex.setUserIdx(info.getUserIdx());
		ex.setUserName(info.getUserName());
		ex.setMemo(memo);
		
		paymentService.createOrderCode(ex);
		int orderCode = paymentService.checkOrder(userIdx);
		ex.setOrderCode(orderCode);
		ex.setImpCode(impCode);
		ex.setPaymethod(paymethod);
		ex.setStatus(status);
		
		int result =paymentService.insertPayment_pay(ex);
		
		int totalMoney=0;
		List<Payment> list = paymentService.readWishCount(userIdx);
		for(int i =0; i<list.size(); i++) {
			
			for(Payment dto : list) {
				if(dto.getDepartCode()==2) {
					dto.setUserIdx(userIdx);
					dto=paymentService.readWish_dh(dto);
					dto.setTotalMoney(dto.getAmount()*dto.getPrice());
					totalMoney+=dto.getTotalMoney();
					dto.setOrderCode(orderCode);
					paymentService.insertOrder_wishDh(dto);
				}else if(dto.getDepartCode()==1) {
					dto.setUserIdx(userIdx);
					dto=paymentService.readWish_dt(dto);
					dto.setTotalMoney(dto.getAmount()*dto.getPrice());
					totalMoney+=dto.getTotalMoney();
					dto.setOrderCode(orderCode);
					paymentService.insertOrder_wishDt(dto);
				}
			}
			ex.setTotalMoney(totalMoney);
			paymentService.updateOrderTotalMoney(ex);
			
			List<Payment> list1 = null;
			list1=paymentService.checkWishCode(userIdx);
			for(Payment dto : list1) {
				if(dto.getDepartCode()==1) {
					paymentService.deleteWishdt(dto.getWishCode());
				}
				else if(dto.getDepartCode()==2) {
					paymentService.deleteWishdh(dto.getWishCode());
				}
			}
			paymentService.deleteWishAll(ex);
			model.put("status","전체 주문 성공");
		}
		
		return model;
	}
	@RequestMapping(value="/payment/complete")
	public String paymentComplete(
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		/*int userIdx=info.getUserIdx();
		int orderCode = paymentService.checkOrder(userIdx);
		int result=paymentService.checkDepart(orderCode);
		Payment dto= new Payment();
		if(result!=0) {
			dto=paymentService.resultOrder(userIdx);
			int roomCode = dto.getProductCode();
			Payment dto1 = paymentService.resultOrder1(roomCode);
			dto.sethName(dto1.gethName());
			dto.setRoomNum(dto1.getRoomNum());
			model.addAttribute("dto", dto);
		}*/
		
		return ".payment.complete";
	}
	
	@RequestMapping(value="/payment/history")
	public String paymentHistory() throws Exception {
		return ".payment.history";
	}
	
	@RequestMapping(value="/payment/directOrder/{sort}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> toOrderPage(
			@PathVariable(value="sort") String sort,
			@RequestParam(value="buyList", required=false) String buyList,
			Model model) throws Exception{

		
		Map<String,Object> map = new HashMap<>();
		int totalprice =0;
		int mode=3;
		List<Ticket> ticketList = new ArrayList<>();
		List<Hotel> hotelList = new ArrayList<>();
		JSONArray array = new JSONArray(buyList);
		
		System.out.println("-----------buyList-----------");
		System.out.println(array);
		System.out.println(array.length());
		if(sort.equals("ticket")) {
			
			Ticket ticket = new Ticket();
			for(int i=0; i<array.length(); i++) {
				JSONObject object = array.getJSONObject(i);
				try {
					System.out.println(object.getInt("code")+"/"+object.getInt("buyCount")+"/"+object.getInt("price"));
					ticket = ticketService.readTicketDetail(object.getInt("code"));
					ticket.setBuyCount(object.getInt("buyCount"));
					totalprice += ticket.getPrice()*ticket.getBuyCount();
					ticketList.add(ticket);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}else {
			Hotel hotel = new Hotel();
			for(int i=0; i<array.length(); i++) {
				JSONObject object = array.getJSONObject(i);
			}
		}
		//아임포트 결제 완료하면 order_seq => tb_pay_master => order_master => order_dt
		
		map.put("amount",totalprice);
		map.put("sort", sort);
		map.put("list_dt", ticketList);
		map.put("mode", mode);
		map.put("totalMoney", totalprice);
		
		return map;
	}
	
}
