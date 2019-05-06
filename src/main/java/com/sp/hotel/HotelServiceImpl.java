package com.sp.hotel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("hotel.hotelService")
public class HotelServiceImpl implements HotelService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Hotel> listHotel(Map<String, Object> map) {
		List<Hotel> list=null;
		
		try {
			list=dao.selectList("hotel.listHotel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("hotel.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Hotel> readHotel(int hotelCode) {
		List<Hotel> dto=null;
		
		try {
			dto=dao.selectList("hotel.readHotel", hotelCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int detailCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("hotel.detailCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Hotel readHotelMax(int hotelCode) {
		Hotel maxdto=null;
		
		try {
			maxdto=dao.selectOne("hotel.readHotelMax", hotelCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maxdto;
	}

	@Override
	public int insertReview(Review dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reviewDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
