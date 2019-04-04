package com.sp.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("member.memberController")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	//로그인이 갑자기 안된다 무슨 일 일까
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> loginSubmit(
			User user,
			HttpSession session
			) {
			//System.out.println("hi");
			Map<String,Object> map = new HashMap<>();
			User temp = memberService.readLoginInfo(user.getUserId());
			boolean isUser = false;
			if(temp != null && temp.getUserPwd().equals(user.getUserPwd())){
				SessionInfo info = new SessionInfo();
				info.setRoleCode(temp.getRoleCode());
				info.setUserId(temp.getUserId());
				info.setUserIdx(temp.getUserIdx());
				info.setUserName(temp.getUserName());
				session.setAttribute("member", info);
				isUser = true;
			}
			String uri = (String)session.getAttribute("preLoginURI");
			session.removeAttribute("preLoginURI");
			map.put("isUser", isUser);
			map.put("uri", uri);
		return map;
	}
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session){
		session.removeAttribute("member");
		session.invalidate();
		return "redirect:/main";
	}
}
