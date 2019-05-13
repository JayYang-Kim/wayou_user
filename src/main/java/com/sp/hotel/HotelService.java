package com.sp.hotel;

import java.util.List;
import java.util.Map;

public interface HotelService {
	public List<Hotel> listHotel(Map<String , Object>map);
	public int dataCount(Map<String, Object> map);
	
	public List<Hotel> readHotel(Map<String , Object>map);
	public int detailCount(Map<String, Object>map);
	public Hotel readHotelMax(int hotelCode);
	
	public int insertReview(Review dto);
	public int reviewDataCount(Map <String, Object> map);
	public List<Review> listReview(Map <String, Object> map);
	
	public int insertReserveHotel(Hotel dto);
	
}
