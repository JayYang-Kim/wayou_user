package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.FaqBoardService")
public class FaqBoardServiceImpl implements FaqBoardService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<FaqBoard> listBoard(Map<String, Object> map) {
		List<FaqBoard> list = null;
		
		try {
			list=dao.selectList("tfaq.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("tfaq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public FaqBoard readBoard(int num) {
		FaqBoard dto = null;
		
		try {
			dto=dao.selectOne("tfaq.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	


}
