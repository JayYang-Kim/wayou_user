package com.sp.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("user")
@Controller("member.memberController")
public class MemberController {
	@ModelAttribute("user")
	public User commend() {
		return new User();
	}
	
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
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String createForm(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/create";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String createSubmit(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/create";
	}
	
	@RequestMapping(value="/user/emailCheck", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> emailCheck(
			@RequestParam String email){
		Map<String, Object> model = new HashMap<>();

		boolean b = memberService.mailSend(email);
		
		return model;
	}
}
