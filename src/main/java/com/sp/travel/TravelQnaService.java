package com.sp.travel;

import java.util.List;
import java.util.Map;

import com.sp.ticket.QnABoard;

public interface TravelQnaService {
	public int insertBoard(QnABoard dto);
	public List<QnABoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public QnABoard readBoard(int num);
	public int updateHitCount(int num);
	public int updateBoard(QnABoard dto);
	public int deleteBoard(int num);
	public int readHitCount(int num);
	
}
