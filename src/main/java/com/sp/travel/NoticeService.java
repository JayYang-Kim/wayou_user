package com.sp.travel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface NoticeService {
	
	//리스트
	public List<Notice> list(Map<String,Object> map);
	public int noticeCount(Map<String,Object> map);
	
	//상세
	public Notice readNotice(int noticeCode);
	public void downloadFile(HttpServletResponse resp);
	public List<NoticeFile> readFiles(int notiCode);
	public void updateHitCount(int notiCode);

}
