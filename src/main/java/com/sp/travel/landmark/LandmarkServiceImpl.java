package com.sp.travel.landmark;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.landmark.landmarkService")
public class LandmarkServiceImpl implements LandmarkService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int countLandmark(int locCode) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.landmark.countLandmark", locCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Landmark> listLandmark(Map<String, Object> map) throws Exception {
		List<Landmark> list = null;
		
		try {
			list = dao.selectList("travel.landmark.listLandmark", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Landmark readLandmark(Map<String, Object> map) throws Exception {
		Landmark dto = null;
		
		try {
			dto = dao.selectOne("travel.landmark.readLandmark", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Landmark> landmarkFiles(int landCode) throws Exception {
		List<Landmark> list = null;
		
		try {
			list = dao.selectList("travel.landmark.landmarkFiles", landCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(int landCode) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("travel.landmark.replyCount", landCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Landmark> replyList(Map<String, Object> map) throws Exception {
		List<Landmark> list = null;
		
		try {
			list = dao.selectList("travel.landmark.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyInsert(Landmark dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("travel.landmark.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}

	@Override
	public int replyDelete(int replyNum) throws Exception {
		int result = 0;
		
		try {
			result = dao.deleteData("travel.landmark.deleteReply", replyNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}
}
