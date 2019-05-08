package com.sp.travel.location;

import java.util.List;

public interface LocationService {
	public List<Location> listLocation() throws Exception;
	public List<Location> recommendLocation() throws Exception;
}
