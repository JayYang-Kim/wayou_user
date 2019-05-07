package com.sp.travel.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.main.mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Main> recommendLocation() throws Exception {
		List<Main> list = null;
		
		try {
			list = dao.selectList("travel.main.recommendLocation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Main> recommendLandmak() throws Exception {
		List<Main> list = null;
		
		try {
			list = dao.selectList("travel.main.recommendLandmark");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Main> recommendWorkspace() throws Exception {
		List<Main> list = null;
		
		try {
			list = dao.selectList("travel.main.recommendWorkspace");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
