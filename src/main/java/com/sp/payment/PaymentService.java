package com.sp.payment;

import java.util.List;
import java.util.Map;

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
	
	public Payment readWish_dt (Payment dto) {
		
		try {
			dto=dao.selectOne("payment.readWish_dt", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public Payment readWish_dh (Payment dto) {
		
		try {
			dto=dao.selectOne("payment.readWish_dh", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<Payment> readWishA_dt (int userIdx) {
		List<Payment> list_dt = null;
		try {
			list_dt=dao.selectList("payment.readWishA_dt", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list_dt;
	}
	public List<Payment> readWishA_dh (int userIdx) {
		List<Payment> list_dh = null;
		try {
			list_dh=dao.selectList("payment.readWishA_dh", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list_dh;
	}
	
	public int insertOrder_wish (Payment dto) {
		int result=0;
		
		try {
			result=dao.insertData("payment.insertOrder_wish", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertOrder_wishDh (Payment dh) {
		int result=0;
		
		try {
			result=dao.insertData("payment.insertOrder_wishDh", dh);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int insertOrder_wishDt (Payment dt) {
		int result=0;
		
		try {
			result=dao.insertData("payment.insertOrder_wishDt", dt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Payment readOrderM (int userIdx) {
		Payment dto = null;
		try {
			dto=dao.selectOne("payment.readOrderM", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int insertPayment_pay (Payment dto){
		int result=0;
		try {
			result=dao.insertData("payment.insertPayment_pay", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteOrder (Payment dto){
		int result=0;
		try {
			result=dao.deleteData("payment.deleteOrder_dh", dto);
			result=dao.deleteData("payment.deleteOrder_dt", dto);
			result=dao.deleteData("payment.deleteOrder", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteWishdt(int wishCode) throws Exception {
		int result=0;
		try {
			dao.deleteData("payment.deleteWishdt", wishCode);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}

	public int deleteWishdh(int wishCode) throws Exception {
		int result=0;
		try {
			dao.deleteData("payment.deleteWishdh", wishCode);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}
	
	public int deleteWish(int wishCode) throws Exception {
		int result=0;
		try {
			dao.deleteData("payment.deleteWish", wishCode);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int checkOrder(int userIdx) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("payment.checkOrder", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int checkDepart (int orderCode) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("payment.checkDepart", orderCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Payment resultOrder (int userIdx) throws Exception{
		Payment dto = new Payment();
		try {
			dto=dao.selectOne("payment.resultOrder", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public Payment resultOrder1 (int roomCode) throws Exception{
		Payment dto = new Payment();
		try {
			dto=dao.selectOne("payment.resultOrder1", roomCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<Payment> readWishCount (int userIdx) throws Exception{
		List<Payment> list = null;
		try {
			list=dao.selectList("payment.readWishCount", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int createOrderCode (Payment ex) throws Exception{
		int result=0;
		try {
			result=dao.insertData("payment.createOrderCode", ex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateOrderTotalMoney (Payment ex) throws Exception{
		int result=0;
		try {
			result=dao.updateData("payment.updateOrderTotalMoney", ex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteWishAll (Payment ex) throws Exception{
		int result=0;
		try {
			result=dao.deleteData("payment.deleteWishAll", ex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Payment> checkWishCode (int userIdx) throws Exception{
		List<Payment> list = null;
		try {
			list=dao.selectList("payment.checkWishCode", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
