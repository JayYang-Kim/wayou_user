package com.sp.hqna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sp.common.dao.CommonDAO;

@Service("hqna.hqnaService")
public class HanaServiceImpl implements HqnaService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertHqna(Hqna dto) {
		int result=0;
		
		try {
			result=dao.insertData("hqna.insertHqna", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Hqna> listHqna(Map<String, Object> map) {
		List<Hqna> list=null; 
		
		try {
			list=dao.selectList("hqna.listHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("hqna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		try {
			result=dao.selectOne("hqna.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Hqna readHqna(int num) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.RedaHqna", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Hqna preReadHqna(Map<String, Object> map) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.preReadHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Hqna nextReadHqna(Map<String, Object> map) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.nextReadHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateHqna(Hqna dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHqna(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
