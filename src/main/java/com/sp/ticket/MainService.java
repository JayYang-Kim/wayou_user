package com.sp.ticket;

import java.util.List;

public interface MainService {
	public List<Notice> mainNoticeList() throws Exception;
	public List<QnABoard> mainQnAList() throws Exception;
	public List<Event> mainEventList() throws Exception;
}
