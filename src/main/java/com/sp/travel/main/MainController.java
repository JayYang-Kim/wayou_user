package com.sp.travel.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("travel.main.mainController")
public class MainController {
	@RequestMapping(value="/travel")
	public String main() {
		return ".travel.main.main";
	}
}
