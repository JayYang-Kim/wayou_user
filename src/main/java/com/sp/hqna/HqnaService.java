package com.sp.hqna;

import java.util.List;
import java.util.Map;

public interface HqnaService {
	public int insertHqna(Hqna dto);
	public List<Hqna> listHqna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int updateHitCount(int qnaCode);
	
	public Hqna readHqna(int qnaCode);
	public Hqna preReadHqna(Map<String, Object> map);
	public Hqna nextReadHqna(Map<String, Object> map);
	
	public int updateHqna(Hqna dto);
	
	public int deleteHqna(int qnaCode);
	
	public List<Reply> listReply(Map<String, Object>map);
	
	public List<Hfaq> HfaqlistBoard(Map<String, Object> map);
	public int HfaqdataCount(Map<String, Object> map);
	public Hfaq HfaqreadBoard(int num);
	
}
