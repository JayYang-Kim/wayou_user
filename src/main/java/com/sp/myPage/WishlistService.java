package com.sp.myPage;

import java.util.List;

public interface WishlistService {
	public int dataCount1 (int userIdx) throws Exception;
	public int dataCount2 (int userIdx) throws Exception;
	public int dataCount3 (int userIdx) throws Exception;
	public List<Wishlist> list1Wish(int userIdx) throws Exception;
	public List<Wishlist> list2Wish(int userIdx) throws Exception;
	public List<Wishlist> list3Wish(int userIdx) throws Exception;
}
