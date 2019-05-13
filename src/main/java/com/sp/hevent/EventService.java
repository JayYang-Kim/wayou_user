package com.sp.hevent;

import java.util.List;
import java.util.Map;

public interface EventService {
	
	//리스트 처리
	public List<HEvent> eventList(Map<String,Object> map);
	public int articleCount(Map<String,Object> map);
	
	//상세 처리
	public HEvent eventArticle(int eventNum);
	public void updateHitCount(int eventNum);
	
	//댓글 처리
	public List<HEventReply> eventReplys(Map<String, Object> map);
	public int replyCount(int eventNum);
	public void insertReply(HEventReply reply);
	public void updateReply(HEventReply reply);
	public void deleteReply(HEventReply reply);

}
