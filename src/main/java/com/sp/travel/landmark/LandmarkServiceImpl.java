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
	
}
