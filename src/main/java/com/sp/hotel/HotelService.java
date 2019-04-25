package com.sp.hotel;

import java.util.List;
import java.util.Map;

public interface HotelService {
	public List<Hotel> listHotel(Map<String , Object>map);
	public int dataCount(Map<String, Object> map);

}
