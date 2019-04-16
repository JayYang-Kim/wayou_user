package com.sp.party;

import java.util.List;
import java.util.Map;

public interface PartyService {
	public int insertParty(Party dto) throws Exception;
	public List<Party> listParty(Map<String, Object> map) throws Exception;
	public List<Party> listPartyNew() throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public Party readParty(int num) throws Exception;
	public Party preReadParty(Map<String, Object> map) throws Exception;
	public Party nextReadParty(Map<String, Object> map) throws Exception;
	public int updateParty(Party dto) throws Exception;
	public int deleteParty(int num) throws Exception;
	
	public List<Party> myListParty(Map<String, Object> map) throws Exception;
	public int myParty_dataCount(Map<String, Object> map) throws Exception;
	public List<Party> attendListParty(Map<String, Object> map) throws Exception;
	public int attendParty_dataCount(Map<String, Object> map) throws Exception;
}
