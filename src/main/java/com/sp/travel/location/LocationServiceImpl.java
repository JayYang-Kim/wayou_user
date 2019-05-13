package com.sp.travel.location;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.location.locationService")
public class LocationServiceImpl implements LocationService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Location> listLocation() throws Exception {
		List<Location> list = null;
		
		try {
			list = dao.selectList("travel.location.listLocation"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Location> recommendLocation() throws Exception {
		List<Location> list = null;
		
		try {
			list = dao.selectList("travel.location.recommendLocation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Location readLocation(int locCode) throws Exception {
		Location dto = null;
		
		try {
			dto = dao.selectOne("travel.location.readLocation", locCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Location> recommendLandmak(int locCode) throws Exception {
		List<Location> list = null;
		
		try {
			list = dao.selectList("travel.location.recommendLandmark", locCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Location> recommendWorkspace(int locCode) throws Exception {
		List<Location> list = null;
		
		try {
			list = dao.selectList("travel.location.recommendWorkspace", locCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(int locCode) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.location.replyCount", locCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<Location> replyList(Map<String, Object> map) throws Exception {
		List<Location> list = null;
		
		try {
			list = dao.selectList("travel.location.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyInsert(Location dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("travel.location.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int replyDelete(int replyCode) throws Exception {
		int result = 0;
		
		try {
			result = dao.deleteData("travel.location.deleteReply", replyCode);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}
}
