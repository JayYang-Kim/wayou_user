package com.sp.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.travel.main.Main;
import com.sp.travel.main.MainService;

@Controller("mainController")
public class MainController {
	
	@Autowired
	private MainService mainService;
	 
	@RequestMapping(value= {"/main", "/"}, method=RequestMethod.GET)
	public String method(Model model) throws Exception {
		
		List<Main> listLocation = mainService.recommendLocation();
		List<Main> listLandMark = mainService.recommendLandmak();
		List<Main> listWorkspace = mainService.recommendWorkspace();
		
		model.addAttribute("listLocation", listLocation);
		model.addAttribute("listLandMark", listLandMark);
		model.addAttribute("listWorkspace", listWorkspace);
		
		return ".travel.main.main";
	}
}
