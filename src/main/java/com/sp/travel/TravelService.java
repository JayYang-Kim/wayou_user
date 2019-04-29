package com.sp.travel;

import java.util.List;
import java.util.Map;

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

	public Location getLocation(int locCode) {
		Location dto = null;
		try {
			dto = dao.selectOne("workspace.basicInfo", locCode);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int insertWorkspace(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("workspace.insertWorkspace", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Landmark> landList(Map<String,Object> map) {
		List<Landmark> list = null;
		try {
			list = dao.selectList("workspace.listLandmark", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return list;
	}

	public List<Landmark> landListByTag(Map<String, Object> map) {
		List<Landmark> list = null;
		try {
			list = dao.selectList("workspace.listLandmarkByTag", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int currentWorkSeqNum() {
		int result = 0;
		try {
			result = dao.selectOne("workspace.currentWorkSeqNum");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Landmark> landListByDay(Map<String, Object> map) {
		List<Landmark> list = null;
		try {
			if((Integer)map.get("day")==0) {
				list = dao.selectList("workspace.landListAllDay", map);
				return list;
			}
			list = dao.selectList("workspace.landListByDay", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int currentWorkDetailSeqNum() {
		int result =0;
		try {
			result = dao.selectOne("workspace.currentWorkDetailSeqNum");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertWorkDetail(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.insertData("workspace.insertWorkDetail",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertWorkLand(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.insertData("workspace.insertWorkLand",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteWorkLand(int seqNum) {
		try {
			dao.insertData("workspace.deleteWorkLand",seqNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int isDetailExist(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("workspace.isDetailExist",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getDetailCode(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int seqNum=0;
		try {
			seqNum = dao.selectOne("workspace.getDetailCode",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return seqNum;
	}
	
	

	public int myDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("workspace.myDataCount",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Workspace> myList(Map<String, Object> map) {
		List<Workspace> list = null;
		try {
			list = dao.selectList("workspace.myList",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Workspace> list(Map<String, Object> map) {
		List<Workspace> list = null;
		try {
			list = dao.selectList("workspace.list",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<LocCategory> locationCategory(int userIdx){
		List<LocCategory> list = null;
		try {
			list = dao.selectList("workspace.locationCategory",userIdx);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<LocCategory> locationCategory(Map<String,Object> map){
		List<LocCategory> list = null;
		try {
			list = dao.selectList("workspace.locationCategory2",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Workspace readWorkspace(Map<String, Object> map) {
		Workspace result=null;
		try {
			result = dao.selectOne("workspace.readWorkspace",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<WorkLand> readWorkLand(Map<String, Object> map) {
		List<WorkLand> list = null;
		try {
			list = dao.selectList("workspace.readWorkLand",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countWorkDetail(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("workspace.countWorkDetail",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void updateWorkLandDetail(WorkLand workland) {
		try {
			dao.updateData("workspace.updateWorkLandDetail",workland);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public WorkLand selectWorkLandBM(int worklandCode) {
		WorkLand workland = null;
		try {
			workland = dao.selectOne("workspace.selectWorkLandBM", worklandCode);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return workland;
	}

	public void updateBudgetByDay(Map<String,Object> map) {
		try {
			dao.updateData("workspace.updateBudgetByDay",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int selectTotBudget(int workCode) {
		int result=0;
		try {
			result = dao.selectOne("workspace.selectTotBudget",workCode);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int readOnlyWorkspace(int workCode) {
		int result=0;
		try {
			result = dao.selectOne("workspace.readOnlyWorkspace",workCode);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("workspace.dataCount",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
