package com.sp.party;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("party.joinPartyService")
public class JoinPartyServiceImpl implements JoinPartyService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertJoinParty(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("party.insertJoinParty", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int dataCountJoinParty(int num) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("party.dataCountJoinParty", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<JoinParty> listJoinParty(Map<String, Object> map) throws Exception {
		List<JoinParty> list = null;
		
		try {
			list = dao.selectList("party.listJoinParty", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateJoinParty_accept(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.updateData("party.updateJoinParty_accept", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int updateJoinParty_refuse(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.updateData("party.updateJoinParty_refuse", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int updateJoinParty_delete(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.updateData("party.updateJoinParty_delete", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

}
