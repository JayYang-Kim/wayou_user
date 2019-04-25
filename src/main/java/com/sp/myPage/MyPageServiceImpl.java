package com.sp.myPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.member.User;

@Service("myPage.myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CommonDAO dao;

	@Override
	public String checkPwd(int userIdx) throws Exception {
		String userPwd=null;
		try {
			userPwd = dao.selectOne("myPage.checkPwd", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userPwd;
	}

	@Override
	public User readUser(int userIdx) throws Exception {
		User dto = null;
		
		try {
			dto = dao.selectOne("myPage.readUser", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateUser(User dto) throws Exception {
		int result = 0;
		
		try {
			result=dao.updateData("myPage.updateUser", dto);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUser(int userIdx) throws Exception {
		int result=0;
		try {
			result=dao.updateData("myPage.deleteUser", userIdx);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}





}
