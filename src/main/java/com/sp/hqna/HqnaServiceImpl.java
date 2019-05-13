package com.sp.hqna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("hqna.hqnaService")
public class HqnaServiceImpl implements HqnaService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertHqna(Hqna dto) {
		int result=0;
		
		try {
			result=dao.insertData("hqna.insertHqna", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Hqna> listHqna(Map<String, Object> map) {
		List<Hqna> list=null; 
		
		try {
			list=dao.selectList("hqna.listHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("hqna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateHitCount(int qnaCode) {
		int result=0;
		
		try {
			result=dao.updateData("hqna.updateHitCount", qnaCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Hqna readHqna(int qnaCode) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.readHqna", qnaCode);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Hqna preReadHqna(Map<String, Object> map) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.preReadHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Hqna nextReadHqna(Map<String, Object> map) {
		Hqna dto=null;
		
		try {
			dto=dao.selectOne("hqna.nextReadHqna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateHqna(Hqna dto) {
		int result=0;
		
		try {
			dao.updateData("hqna.updateHqna", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteHqna(int qnaCode) {
		int result=0;
		
		try {
			
			dao.deleteData("hqna.deleteHqna", qnaCode);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		
		try {
			list=dao.selectList("hqna.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Hfaq> HfaqlistBoard(Map<String, Object> map) {
		List<Hfaq> list=null;
		
		try {
			list=dao.selectList("hqna.HfaqlistBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int HfaqdataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("hqna.HfaqdataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	@Override
	public Hfaq HfaqreadBoard(int num) {
		Hfaq dto = null;
		
		try {
			dto=dao.selectOne("hqna.HfaqreadBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
