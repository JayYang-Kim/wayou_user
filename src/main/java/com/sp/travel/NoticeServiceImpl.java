package com.sp.travel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;

@Service("travel.noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Override
	public List<Notice> list(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list = sqlsession.selectList("travelNotice.noticeList", map);
		}catch(Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public int noticeCount(Map<String, Object> map) {
		int result =0;
		try {
			result = sqlsession.selectOne("travelNotice.noticeCount",map);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	@Override
	public Notice readNotice(int notiCode) {
		Notice notice = null;
		try {
			notice = sqlsession.selectOne("travelNotice.readNotice",notiCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return notice;
	}

	@Override
	public void downloadFile(HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeFile> readFiles(int notiCode) {
		List<NoticeFile> list = null;
		
		try {
			list = sqlsession.selectList("travelNotice.readFiles",notiCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		return list;
	}

	@Override
	public void updateHitCount(int notiCode) {
		try {
			sqlsession.update("travelNotice.updateHitCount", notiCode);
		}catch (Exception e) {
			logger.error(e.toString());
		}
		
	}
	
}
