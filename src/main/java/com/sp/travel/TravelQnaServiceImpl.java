package com.sp.travel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.ticket.QnABoard;

@Service("travel.travelQnaService")
public class TravelQnaServiceImpl implements TravelQnaService{
	@Autowired
	private CommonDAO dao;
	@Override
	public int insertBoard(QnABoard dto) {
		int result=0;
		try {
			result=dao.insertData("travelQna.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<QnABoard> listBoard(Map<String, Object> map) {
		List<QnABoard> list = null;
		
		try {
			list=dao.selectList("travelQna.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("travelQna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public QnABoard readBoard(int num) {
		QnABoard dto = null;
		
		try {
			dto=dao.selectOne("travelQna.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		try {
			result=dao.updateData("travelQna.updateHitCount", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int updateBoard(QnABoard dto) {
		int result=0;
		
		try {
			result=dao.updateData("travelQna.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result=0;
		
		try {
			result=dao.deleteData("travelQna.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int readHitCount(int num) {
		int result=0;
		
		try {
			result=dao.selectOne("travelQna.readHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
