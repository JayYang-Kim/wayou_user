package com.sp.travel.main;

import java.util.List;

public interface MainService {
	public List<Main> recommendLocation() throws Exception;
	public List<Main> recommendLandmak() throws Exception;
	public List<Main> recommendWorkspace() throws Exception;
}
