package com.sp.myPage;

import java.util.List;
import java.util.Map;

public interface WishlistService {
	public int dataCount1 (int userIdx) throws Exception;
	public int dataCount2 (int userIdx) throws Exception;
	public int dataCount3 (int userIdx) throws Exception;
	public List<Wishlist> listdhWish(Map<String, Object> map) throws Exception;
	public List<Wishlist> listdtWish(Map<String, Object> map) throws Exception;
	public List<Wishlist> listdtrWish(Map<String, Object> map) throws Exception;
}
