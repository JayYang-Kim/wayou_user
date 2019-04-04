package com.sp.travel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("travel.travelController")
public class TravelController {
	
	@RequestMapping(value="/travel/workspace")
	public String workSpace() {
		
		return ".travel.workspace";
	}
}
