package com.sp.hqna;

import java.util.List;
import java.util.Map;

public interface HqnaService {
	public int insertHqna(Hqna dto) throws Exception;
	public List<Hqna> listHqna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int updateHitCount(int qnacode);
	public Hqna readHqna(int qnacode);
	public Hqna preReadHqna(Map<String, Object> map);
	public Hqna nextReadHqna(Map<String, Object> map);
	public int updateHqna(Hqna dto);
	public int deleteHqna(int qnacode);
	
	public List<Reply> listReply(Map<String, Object> map);
}
