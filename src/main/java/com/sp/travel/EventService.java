package com.sp.travel;

import java.util.List;
import java.util.Map;

public interface EventService {
	
	//리스트 처리
	public List<Event> eventList(Map<String,Object> map);
	public int articleCount(Map<String,Object> map);
	
	//상세 처리
	public Event eventArticle(int eventCode);
	public List<EventFile> eventFiles(int eventCode);
	public void updateHitCount(int eventCode);
	
	//댓글 처리
	public List<EventReply> eventReplys(Map<String, Object> map);
	public int replyCount(int eventCode);
	public void insertReply(EventReply reply);
	public void updateReply(EventReply reply);
	public void deleteReply(EventReply reply);

}
