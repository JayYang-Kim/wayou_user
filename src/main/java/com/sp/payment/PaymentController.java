package com.sp.payment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/payment/order")
	public String payment() throws Exception {
		return ".payment.order";
	}
	
	@RequestMapping(value="/payment/complete")
	public String paymentComplete() throws Exception {
		return ".payment.complete";
	}
	
	@RequestMapping(value="/payment/history")
	public String paymentHistory() throws Exception {
		return ".payment.history";
	}
}
