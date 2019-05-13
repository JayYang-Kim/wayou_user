package com.sp.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Notice> mainNoticeList() throws Exception {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("tmain.mainNoticeList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<QnABoard> mainQnAList() throws Exception {
		List<QnABoard> list = null;
		
		try {
			list = dao.selectList("tmain.mainQnAList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Event> mainEventList() throws Exception {
		List<Event> list = null;
		
		try {
			list = dao.selectList("tmain.mainEventList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
