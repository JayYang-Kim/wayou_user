package com.sp.hotel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.hevent.HEvent;
import com.sp.hnotice.HNotice;
import com.sp.hqna.Hqna;

@Service("hotel.hotelmainservice")
public class HotelMainServiceImpl implements HotelMainService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<HNotice> hotelMainNoticeList() throws Exception {
		List<HNotice> list=null;
		
		try {
			list=dao.selectList("hotelmain.HotelMainNoticeList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<Hqna> hotelMainQnaList() throws Exception {
		List<Hqna> list=null;
		
		try {
			list=dao.selectList("hotelmain.HotelMainQnAList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<HEvent> hotelMainEventList() throws Exception {
		List<HEvent> list=null;
		
		try {
			list=dao.selectList("hotelmain.HotelMainEventList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public List<Hotel> hotelMainRanking() throws Exception {
		List<Hotel> list=null;
		
		try {
			list=dao.selectList("hotelmain.HotelRanking");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

}
