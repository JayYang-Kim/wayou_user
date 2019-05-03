package com.sp.travel.party;

import java.util.List;
import java.util.Map;

public interface JoinPartyService {
	public int insertJoinParty(Map<String, Object> map) throws Exception;
	public int dataCountJoinParty(int num) throws Exception;
	public List<JoinParty> listJoinParty(Map<String, Object> map) throws Exception;
	public int updateJoinParty_accept(Map<String, Object> map) throws Exception;
	public int updateJoinParty_refuse(Map<String, Object> map) throws Exception;
	public int updateJoinParty_delete(Map<String, Object> map) throws Exception;
}
