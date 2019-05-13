package com.sp.ticket;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	//리스트
	public List<Notice> list(Map<String,Object> map);
	public int noticeCount(Map<String,Object> map);
	
	//상세
	public Notice readNotice(int noticeNum);
	public void updateHitCount(int noticeNum);

}
