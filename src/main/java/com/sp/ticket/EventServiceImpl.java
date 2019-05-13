package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ticket.eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Override
	public List<Event> eventList(Map<String, Object> map) {
		List<Event> list = null;
		try {
			list = sqlsession.selectList("ticketEvent.eventList", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int articleCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("ticketEvent.articleCount",map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public Event eventArticle(int eventNum) {
		Event event = null;
		try {
			event = sqlsession.selectOne("ticketEvent.eventArticle",eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return event;
	}


	@Override
	public List<EventReply> eventReplys(Map<String, Object> map) {
		List<EventReply> list = null;
		try {
			list = sqlsession.selectList("ticketEvent.eventReplys", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int replyCount(int eventNum) {
		int result = 0;
		try {
			result = sqlsession.selectOne("ticketEvent.replyCount", eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public void insertReply(EventReply reply) {
		try {
			sqlsession.insert("ticketEvent.insertReply",reply);
		}catch (Exception e) {
			logger.error(e.toString());
		}
	}

	@Override
	public void updateReply(EventReply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(EventReply reply) {
		try {
			sqlsession.delete("ticketEvent.deleteReply",reply);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		
	}

	@Override
	public void updateHitCount(int eventNum) {
		try {
			sqlsession.selectList("ticketEvent.updateHitCount",eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
	}

}
