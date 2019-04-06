package com.sp.travel;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("travel.travelController")
public class TravelController {
	
	@Autowired
	private TravelService travelService;
	
	@RequestMapping(value="/travel/workspace")
	public String workSpace() {
		return ".travel.workspace";
	}
	
	@RequestMapping(value="/travel/locList")
	public String locList(@RequestParam String name,Model model) throws UnsupportedEncodingException {
		name = URLDecoder.decode(name, "utf-8");
		List<Location> list = travelService.locList(name);
		model.addAttribute("list", list);
		return "travel/locList";
	}
}
