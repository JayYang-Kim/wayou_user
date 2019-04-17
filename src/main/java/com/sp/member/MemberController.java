package com.sp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member.memberController")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(
			String login_error,
			Model model
			) {
		if(login_error!=null) {
			String msg = "아이디 또는 비밀번호가 다릅니다.";
			model.addAttribute("msg", msg);
		}
		return "member/login";
	}
	
}
