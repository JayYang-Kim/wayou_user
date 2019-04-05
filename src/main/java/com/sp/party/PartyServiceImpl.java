package com.sp.party;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("party.partyService")
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertParty(Party dto) {
		int result = 0;
		
		try {
			result = dao.insertData("party.partyInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Party> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Party readParty(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Party preReadParty(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Party nextReadParty(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateParty(Party dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteParty(int num, int userIdx) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
