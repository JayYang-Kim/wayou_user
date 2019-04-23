package com.sp.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String step1Submit(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/step1";
	}
	
	@RequestMapping(value="/member/step1", method=RequestMethod.GET)
	public String step2Form(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/step2";
	}
	
	@RequestMapping(value="/member/step1", method=RequestMethod.POST)
	public String step2Submit(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/step2";
	}
	
	@RequestMapping(value="/member/step2", method=RequestMethod.POST)
	public String step3Submit(
			@ModelAttribute("user")User user
			) throws Exception{
		return "member/step3";
	}
	
	@RequestMapping(value="/member/step3", method=RequestMethod.POST)
	public String completeSubmit(
			@ModelAttribute("user")User user,
			SessionStatus sessionStatus
			) throws Exception{
		
		int result=memberService.insertMember(user);
		
		if(result==0) {
			System.out.println("====================실패");
		}
		sessionStatus.setComplete();
		
		return "member/complete";
	}
	
	@RequestMapping(value="/member/emailCheck")
	@ResponseBody
	public Map<String, Object> emailCheck(
			@RequestParam String email){
		Map<String, Object> model = new HashMap<>();

		String num=memberService.random();
		boolean b = memberService.mailSend(email, num);
		
		model.put("result", b);
		model.put("securityNum", num);
		return model;
	}
	
	@RequestMapping(value="/member/idCheck")
	@ResponseBody
	public Map<String, Object> idCheck(
			@RequestParam String userId) {
		Map<String, Object> model= new HashMap<>();

		int result=memberService.idCheck(userId);
		model.put("result", result);
		
		return model;
	}
		
}

