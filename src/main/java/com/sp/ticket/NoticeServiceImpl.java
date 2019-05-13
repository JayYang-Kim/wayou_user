package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ticket.noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSession sqlsession;
	
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Override
	public List<Notice> list(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list = sqlsession.selectList("ticketNotice.noticeList", map);
		}catch(Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int noticeCount(Map<String, Object> map) {
		int result =0;
		try {
			result = sqlsession.selectOne("ticketNotice.noticeCount",map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public Notice readNotice(int noticeNum) {
		Notice notice = null;
		try {
			notice = sqlsession.selectOne("ticketNotice.readNotice",noticeNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return notice;
	}


	@Override
	public void updateHitCount(int noticeNum) {
		try {
			sqlsession.update("ticketNotice.updateHitCount", noticeNum);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		
	}
	
}
