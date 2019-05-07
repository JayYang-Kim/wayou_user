package com.sp.travel.location;

import java.util.List;

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

}
