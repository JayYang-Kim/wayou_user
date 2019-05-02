package com.sp.travel.party;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.party.partyService")
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertParty(Party dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("travel.party.partyInsert", dto);
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
			list = dao.selectList("travel.party.listParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Party> listPartyNew() throws Exception {
		List<Party> list = null;
		
		try {
			list = dao.selectList("travel.party.listPartyNew");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.party.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Party readParty(int num) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("travel.party.detailParty", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Party preReadParty(Map<String, Object> map) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("travel.party.preReadParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Party nextReadParty(Map<String, Object> map) throws Exception {
		Party dto = null;
		
		try {
			dto = dao.selectOne("travel.party.nextReadParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateParty(Party dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.updateData("travel.party.updateParty", dto);
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
			dao.deleteData("travel.party.deleteJoinParty", num);
			dao.deleteData("travel.party.deleteParty", num);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int myParty_dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.party.myParty_dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int attendParty_dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.party.attendParty_dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Party> myListParty(Map<String, Object> map) throws Exception {
		List<Party> list = null;
		
		try {
			list = dao.selectList("travel.party.myListParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Party> attendListParty(Map<String, Object> map) throws Exception {
		List<Party> list = null;
		
		try {
			list = dao.selectList("travel.party.attendListParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
