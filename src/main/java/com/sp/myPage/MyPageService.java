package com.sp.myPage;

import com.sp.member.User;

public interface MyPageService {
	public String checkPwd(int userIdx) throws Exception;
	public User readUser(int userIdx) throws Exception;
	public int updateUser(User dto) throws Exception;
	public int deleteUser (int userIdx) throws Exception;
};
