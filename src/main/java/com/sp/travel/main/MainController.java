package com.sp.travel.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("travel.main.mainController")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/travel")
	public String main(Model model) throws Exception {
		
		List<Main> listLocation = mainService.recommendLocation();
		List<Main> listLandMark = mainService.recommendLandmak();
		List<Main> listWorkspace = mainService.recommendWorkspace();
		
		model.addAttribute("listLocation", listLocation);
		model.addAttribute("listLandMark", listLandMark);
		model.addAttribute("listWorkspace", listWorkspace);
		
		return ".travel.main.main";
	}
}
