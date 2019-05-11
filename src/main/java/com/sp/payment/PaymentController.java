package com.sp.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.sp.member.SessionInfo;

@Controller("payment.paymentController")
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payInfo")
	@ResponseBody
	public Map<String, Object> pgInfo(@RequestParam int userIdx) {
		
		Payment dto = paymentService.payInfo(userIdx);
		
		Map<String, Object> model = new HashMap<>();
		model.put("payInfo", dto);
		
		return model;
	}
	
	@RequestMapping(value="/payment/complete")
	public String paymentComplete() throws Exception {
		return ".payment.complete";
	}
	
	@RequestMapping(value="/payment/history")
	public String paymentHistory() throws Exception {
		return ".payment.history";
	}
	
	@RequestMapping(value="/payment/orderMenu", method=RequestMethod.GET)
	public String orderMenu(
			@RequestParam int wishCode,
			@RequestParam int dataType,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Payment dto = new Payment();
		dto.setUserIdx(info.getUserIdx());
		dto.setWishCode(wishCode);
		dto.setDataType(dataType);
		
		model.addAttribute("dto",dto);
		if(dataType==2) {
			dto=paymentService.readOrder_dt(dto);
		}
		if(dataType==1) {
			dto=paymentService.readOrder_dh(dto);
		}
		
		model.addAttribute("dto",dto);
		return ".payment.order";
	}
	@RequestMapping(value="/payment/AllorderMenu", method=RequestMethod.GET)
	public String AllorderMenu(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Payment dto = new Payment();
		dto.setUserIdx(info.getUserIdx());
		
			dto=paymentService.readOrder_dt(dto);
		
		model.addAttribute("dto",dto);
		return ".payment.order";
	}
	
	@RequestMapping(value="/payment/orderMenu", method=RequestMethod.POST)
	public String insertOrder(
			Payment dto
			) throws Exception{
		
		paymentService.insertOrder(dto);
		
		return "";
	}
	
	@RequestMapping(value="/payment/insertPayment", method=RequestMethod.POST)
	public Map<String, Object> insertPayment(
			Payment rsp
			) throws Exception{		
		Map<String, Object> model = new HashMap<>();
		String state="true";
		int result=paymentService.insertOrder(rsp);
		
		if(result==0) {
			state="false";
		}
		
		model.put("state", state);
		return model;
	}
}
