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
	public List<Wishlist> listdhWish(Map<String, Object> map) throws Exception {
		List<Wishlist> listdh = dao.selectList("wish.listWishdh",map);
		return listdh;
	}

	@Override
	public List<Wishlist> listdtWish(Map<String, Object> map) throws Exception {
		List<Wishlist> listdt = dao.selectList("wish.listWishdt",map);
		return listdt;
	}

	@Override
	public List<Wishlist> listdtrWish(Map<String, Object> map) throws Exception {
		List<Wishlist> listdtr = dao.selectList("wish.listWishdtr",map);
		return listdtr;
	}

}
