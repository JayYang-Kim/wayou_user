package com.sp.payment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
