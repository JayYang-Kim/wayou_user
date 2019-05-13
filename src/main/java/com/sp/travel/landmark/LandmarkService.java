package com.sp.travel.landmark;

import java.util.List;
import java.util.Map;

public interface LandmarkService {
	public int countLandmark(int locCode) throws Exception;
	public List<Landmark> listLandmark(Map<String, Object> map) throws Exception;
}
