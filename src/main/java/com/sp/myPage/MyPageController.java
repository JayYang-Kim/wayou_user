package com.sp.myPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("myPage.myPageController")
public class MyPageController {

	@RequestMapping(value="/myPage/main")
	public String myPage() throws Exception{
		
		return ".myP.myPage.main";
	}
	
	@RequestMapping(value="/myPage/step")
	public String myPageLevel() throws Exception{
		
		return ".myP.myPage.step";
	}
}
