package com.sp.travel.location;

import java.util.List;

public interface LocationService {
	public List<Location> listLocation() throws Exception;
	public List<Location> recommendLocation() throws Exception;
	
	public Location readLocation(int locCode) throws Exception;
	public List<Location> recommendLandmak(int locCode) throws Exception;
	public List<Location> recommendWorkspace(int locCode) throws Exception;
}
