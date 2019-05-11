package com.sp.travel.location;

import java.util.List;
import java.util.Map;

public interface LocationService {
	public List<Location> listLocation() throws Exception;
	public List<Location> recommendLocation() throws Exception;
	
	public Location readLocation(int locCode) throws Exception;
	public List<Location> recommendLandmak(int locCode) throws Exception;
	public List<Location> recommendWorkspace(int locCode) throws Exception;
	
	public int replyCount(int locCode) throws Exception;
	public List<Location> replyList(Map<String, Object> map) throws Exception;
	public int replyInsert(Location dto) throws Exception;
	public int replyDelete(int replyCode) throws Exception;
}
