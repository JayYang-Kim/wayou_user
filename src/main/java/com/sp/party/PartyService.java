package com.sp.party;

import java.util.List;
import java.util.Map;

public interface PartyService {
	public int insertParty(Party dto);
	public List<Party> listParty(Map<String, Object> map);
	public List<Party> listPartyNew();
	public int dataCount(Map<String, Object> map);
	public Party readParty(int num);
	public Party preReadParty(Map<String, Object> map);
	public Party nextReadParty(Map<String, Object> map);
	public int updateParty(Party dto);
	public int deleteParty(int num, int userIdx);
	
	/*public int insertBoardLike(Map<String, Object> map);
	public int boardLikeCount(int num);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public int insertReplyLike(Map<String, Object> map);
	public Map<String, Object> replyLikeCount(Map<String, Object> map);*/
}
