package com.sp.hotel;

import java.util.List;

import com.sp.hevent.HEvent;
import com.sp.hnotice.HNotice;
import com.sp.hqna.Hqna;

public interface HotelMainService {
		public List<HNotice> hotelMainNoticeList() throws Exception;
		public List<Hqna> hotelMainQnaList() throws Exception;
		public List<HEvent> hotelMainEventList() throws Exception;
		public List<Hotel> hotelMainRanking() throws Exception;
}
