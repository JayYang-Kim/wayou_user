package com.sp.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("wishlistService")
public class WishlistServiceImpl implements WishlistService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount1(int userIdx) throws Exception {
		int dataCount1 = dao.selectOne("wish.dataCount1", userIdx);		
		return dataCount1;
	}
	
	@Override
	public int dataCount2(int userIdx) throws Exception {
		int dataCount2 = dao.selectOne("wish.dataCount2", userIdx);		
		return dataCount2;
	}
	
	@Override
	public int dataCount3(int userIdx) throws Exception {
		int dataCount3 = dao.selectOne("wish.dataCount3", userIdx);		
		return dataCount3;
	}


	@Override
	public List<Wishlist> list1Wish(int userIdx) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish1",userIdx);
		return list;
	}

	@Override
	public List<Wishlist> list2Wish(int userIdx) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish2",userIdx);
		return list;
	}

	@Override
	public List<Wishlist> list3Wish(int userIdx) throws Exception {
		List<Wishlist> list = dao.selectList("wish.listWish3",userIdx);
		return list;
	}

}
