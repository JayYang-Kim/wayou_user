package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.QnAboardService")
public class QnABoardServiceImpl implements QnABoardService{
	@Autowired
	private CommonDAO dao;
	@Override
	public int insertBoard(QnABoard dto) {
		int result=0;
		try {
			result=dao.insertData("tqna.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<QnABoard> listBoard(Map<String, Object> map) {
		List<QnABoard> list = null;
		
		try {
			list=dao.selectList("tqna.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("tqna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public QnABoard readBoard(int num) {
		QnABoard dto = null;
		
		try {
			dto=dao.selectOne("tqna.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		try {
			result=dao.updateData("tqna.updateHitCount", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int updateBoard(QnABoard dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


}
