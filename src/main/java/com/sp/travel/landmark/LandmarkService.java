package com.sp.travel.landmark;

import java.util.List;
import java.util.Map;

public interface LandmarkService {
	public int countLandmark(int locCode) throws Exception;
	public List<Landmark> listLandmark(Map<String, Object> map) throws Exception;
	public Landmark readLandmark(Map<String, Object> map) throws Exception;
	public List<Landmark> landmarkFiles(int landCode) throws Exception;
	
	public int replyCount(int landCode) throws Exception;
	public List<Landmark> replyList(Map<String, Object> map) throws Exception;
	public int replyInsert(Landmark dto) throws Exception;
	public int replyDelete(int replyNum) throws Exception;
}
