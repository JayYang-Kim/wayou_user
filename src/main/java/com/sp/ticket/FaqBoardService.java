package com.sp.ticket;

import java.util.List;
import java.util.Map;

public interface FaqBoardService {
	public List<FaqBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public FaqBoard readBoard(int num);
}
