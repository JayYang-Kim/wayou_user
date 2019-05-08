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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventFile> eventFiles(int eventCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventReply> eventReplys(int eventCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(int eventCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReply(EventReply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReply(EventReply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(EventReply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHitCount(int eventCode) {
		// TODO Auto-generated method stub
		
	}

}
