package com.sp.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.member.SessionInfo;

@RestController("payment.paymentController")
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payInfo")
	public Map<String, Object> pgInfo(@RequestParam int userIdx) {
		
		Payment dto = paymentService.payInfo(userIdx);
		
		Map<String, Object> model = new HashMap<>();
		model.put("payInfo", dto);
		
		return model;
	}
	
	@RequestMapping(value="/payment/orderMenu", method=RequestMethod.GET)
	public String orderMenu(
			@RequestParam int amount,
			@RequestParam int price,
			@RequestParam int totalprice,
			@RequestParam int WishCode,
			@RequestParam int dataType,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Payment dto = new Payment();
		dto=paymentService.payInfo(info.getUserIdx());
		dto.setAmount(amount);
		dto.setPrice(totalprice);
		dto.setTotalMoney(totalprice);
		dto.setOdCode(WishCode);
		dto.setDataType(dataType);
		
		model.addAttribute("dto",dto);
		
		
		return "";
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
