package com.sp.hqna;

import java.util.List;
import java.util.Map;

public interface HqnaService {
	public int insertHqna(Hqna dto);
	public List<Hqna> listHqna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int updateHitCount(int num);
	public Hqna readHqna(int num);
	public Hqna preReadHqna(Map<String, Object> map);
	public Hqna nextReadHqna(Map<String, Object> map);
	public int updateHqna(Hqna dto);
	public int deleteHqna(int num);
}
