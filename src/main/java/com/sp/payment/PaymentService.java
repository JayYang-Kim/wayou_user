package com.sp.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("payment.paymentService")
public class PaymentService {
	@Autowired
	private CommonDAO dao;
	
	public Payment payInfo(int userIdx) {
		Payment dto = null;
		
		try {
			Payment pgStoreInfo = dao.selectOne("payment.selectStoreCode");
			
			dto = dao.selectOne("payment.selectUserInfo", userIdx);
			dto.setPgIdentCode(pgStoreInfo.getPgIdentCode());
			dto.setStoreCode(pgStoreInfo.getStoreCode());
			dto.setStoreName(pgStoreInfo.getStoreName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
