package com.sp.travel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.travelService")
public class TravelService {
	
	@Autowired
	private CommonDAO dao;
	
	public List<Location> locList(String name){
		List<Location> list = null;
			try {
				list = dao.selectList("workspace.listLocation", name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}
}
