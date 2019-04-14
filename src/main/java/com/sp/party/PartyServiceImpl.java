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
	public int insertParty(Party dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("party.partyInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public List<Party> listParty(Map<String, Object> map) throws Exception {
		List<Party> list = null;
		
		try {
			list = dao.selectList("party.listParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Party> listPartyNew() throws Exception {
		List<Party> list = null;
		
		try {
			list = dao.selectList("party.listPartyNew");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("party.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Party readParty(int num) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("party.detailParty", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Party preReadParty(Map<String, Object> map) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("party.preReadParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Party nextReadParty(Map<String, Object> map) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("party.nextReadParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateParty(Party dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.updateData("party.updateParty", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public int deleteParty(int num) throws Exception {
		int result = 0;
		
		try {
			dao.deleteData("party.deleteJoinParty", num);
			dao.deleteData("party.deleteParty", num);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}
}
