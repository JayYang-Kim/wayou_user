package com.sp.hnotice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	//리스트
	public List<HNotice> list(Map<String,Object> map);
	public int noticeCount(Map<String,Object> map);
	
	//상세
	public HNotice readNotice(int noticeNum);
	public void updateHitCount(int noticeNum);

}
