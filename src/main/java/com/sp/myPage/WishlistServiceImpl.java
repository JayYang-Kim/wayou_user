package com.sp.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("wishlistService")
public class WishlistServiceImpl implements WishlistService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount1(int userIdx) throws Exception {
		int dataCount1=0;
		try {		
			dataCount1 = dao.selectOne("wish.dataCount1", userIdx);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount1;
	}
	
	@Override
	public int dataCount2(int userIdx) throws Exception {
		int dataCount2=0;
		try {		
			dataCount2 = dao.selectOne("wish.dataCount2", userIdx);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount2;
	}
	
	@Override
	public int dataCount3(int userIdx) throws Exception {
		int dataCount3=0;
		try {		
			dataCount3 = dao.selectOne("wish.dataCount3", userIdx);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount3;
	}


	@Override
	public List<Wishlist> list1Wish(Map<String, Object> map) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish1",map);
		return list;
	}

	@Override
	public List<Wishlist> list2Wish(Map<String, Object> map) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish2",map);
		return list;
	}

	@Override
	public List<Wishlist> list3Wish(Map<String, Object> map) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish3",map);
		return list;
	}

}
