package com.sp.hevent;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("hevent.eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Override
	public List<HEvent> eventList(Map<String, Object> map) {
		List<HEvent> list = null;
		try {
			list = sqlsession.selectList("hotelEvent.eventList", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int articleCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("hotelEvent.articleCount",map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public HEvent eventArticle(int eventNum) {
		HEvent event = null;
		try {
			event = sqlsession.selectOne("hotelEvent.eventArticle",eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return event;
	}


	@Override
	public List<HEventReply> eventReplys(Map<String, Object> map) {
		List<HEventReply> list = null;
		try {
			list = sqlsession.selectList("hotelEvent.eventReplys", map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int replyCount(int eventNum) {
		int result = 0;
		try {
			result = sqlsession.selectOne("hotelEvent.replyCount", eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public void insertReply(HEventReply reply) {
		try {
			sqlsession.insert("hotelEvent.insertReply",reply);
		}catch (Exception e) {
			logger.error(e.toString());
		}
	}

	@Override
	public void updateReply(HEventReply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(HEventReply reply) {
		try {
			sqlsession.delete("hotellEvent.deleteReply",reply);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		
	}

	@Override
	public void updateHitCount(int eventNum) {
		try {
			sqlsession.selectList("hotelEvent.updateHitCount",eventNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
	}

}
