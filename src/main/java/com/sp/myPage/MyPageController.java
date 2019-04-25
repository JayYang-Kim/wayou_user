package com.sp.myPage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;
import com.sp.member.User;

@Controller("myPage.myPageController")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;

	@RequestMapping(value="/myPage/main")
	public String myPage() throws Exception{
		
		return ".myP.myPage.main";
	}
	
	@RequestMapping(value="/myPage/step")
	public String myPageLevel() throws Exception{
		
		return ".myP.myPage.step";
	}
	
	@RequestMapping(value="/myPage/check", method=RequestMethod.GET)
	public String myPageCheckForm(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int userIdx=info.getUserIdx();
		
		String userPwd=myPageService.checkPwd(userIdx);
		model.addAttribute("userIdx",userIdx);
		model.addAttribute("userPwd", userPwd);
		
		return "myPage/check";
	}
	
	@RequestMapping(value="/myPage/check", method=RequestMethod.POST)
	public String myPageCheckConfirm(
			@RequestParam int userIdx,
			Model model)throws Exception{
		User dto=myPageService.readUser(userIdx);
		model.addAttribute("dto",dto);
		
		return "myPage/update";
	}
	
	@RequestMapping(value="/myPage/update", method=RequestMethod.POST)
	public String myPageUpdateSubmit(
			User dto,
			Model model)throws Exception{
		int result=myPageService.updateUser(dto);

		return "redirect:/myPage/main";
	}
	
	@RequestMapping(value="/myPage/delete1", method=RequestMethod.POST)
	public String myPagedelete(User dto)throws Exception{
		int userIdx=dto.getUserIdx();
		int result=myPageService.deleteUser(userIdx);
		return "redirect:/member/logout";
	}
}
