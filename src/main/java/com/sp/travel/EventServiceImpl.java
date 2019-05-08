package com.sp.travel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("travel.eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Override
	public List<Event> eventList(Map<String, Object> map) {
		List<Event> list = null;
		try {
			list = sqlsession.selectList("travelEvent.eventList", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int articleCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("travelEvent.articleCount",map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public Event eventArticle(int eventCode) {
		Event event = null;
		try {
			event = sqlsession.selectOne("travelEvent.eventArticle",eventCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return event;
	}

	@Override
	public List<EventFile> eventFiles(int eventCode) {
		List<EventFile> list = null;
		try {
			list = sqlsession.selectList("travelEvent.eventFiles",eventCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public List<EventReply> eventReplys(Map<String, Object> map) {
		List<EventReply> list = null;
		try {
			list = sqlsession.selectList("travelEvent.eventReplys", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int replyCount(int eventCode) {
		int result = 0;
		try {
			result = sqlsession.selectOne("travelEvent.replyCount", eventCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public void insertReply(EventReply reply) {
		try {
			sqlsession.insert("travelEvent.insertReply",reply);
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
			sqlsession.delete("travelEvent.deleteReply",reply);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		
	}

	@Override
	public void updateHitCount(int eventCode) {
		try {
			sqlsession.selectList("travelEvent.updateHitCount",eventCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
	}

}
