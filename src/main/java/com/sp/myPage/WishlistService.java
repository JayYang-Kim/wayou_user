package com.sp.myPage;

import java.util.List;
import java.util.Map;

public interface WishlistService {
	public int dataCount (int userIdx) throws Exception;
	public List<Wishlist> listdhWish(Map<String, Object> map) throws Exception;
	public List<Wishlist> listdtWish(Map<String, Object> map) throws Exception;
	public int deleteWishdh (int wishCode) throws Exception;
	public int deleteWishdt	(int wishCode) throws Exception;
	public int updateWishdh (Map<String, Object> map) throws Exception;
	public int updateWishdt	(Map<String, Object> map) throws Exception;
}
