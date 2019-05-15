package com.sp.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.ticket.QnABoard;

@Service("myPage.myPageQnaService")
public class MyPageQnaServiceImpl implements MyPageQnaService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<QnABoard> listBoard(Map<String, Object> map) {
		List<QnABoard> list = null;
		
		try {
			list=dao.selectList("myPage.question.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("myPage.question.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public QnABoard readBoard(int num) {
		QnABoard dto = null;
		
		try {
			dto=dao.selectOne("myPage.question.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		try {
			result=dao.updateData("myPage.question.updateHitCount", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int updateBoard(QnABoard dto) {
		int result=0;
		
		try {
			result=dao.updateData("myPage.question.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result=0;
		
		try {
			result=dao.deleteData("myPage.question.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int readHitCount(int num) {
		int result=0;
		
		try {
			result=dao.selectOne("myPage.question.readHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
