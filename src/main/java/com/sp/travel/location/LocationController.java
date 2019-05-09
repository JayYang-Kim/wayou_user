package com.sp.travel.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("travel.location.locationController")
public class LocationController {
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value="/travel/location")
	public String main(Model model) throws Exception {
		
		List<Location> listLocation = locationService.listLocation();
		
		model.addAttribute("listLocation", listLocation);
		
		return ".travel.location.list";
	}
	
	// 추천 여행일정(지역) AJAX HTML 출력
	@RequestMapping(value="/travel/location/recommendLocation")
	public String recommendLocation(Model model) throws Exception {
		List<Location> list = locationService.recommendLocation();
		
		model.addAttribute("list", list);
		
		return "travel/location/recommendList";
	}
	
	@RequestMapping(value="/travel/location/view")
	public String locationView(@RequestParam int locCode,
			Model model) throws Exception {
		Location readLocation = locationService.readLocation(locCode);
		
		if(readLocation == null) {
			return "redirect:/travel";
		}
		
		List<Location> recommendLandmak = locationService.recommendLandmak(locCode);
		List<Location> recommendWorkspace = locationService.recommendWorkspace(locCode);
		
		model.addAttribute("readLocation", readLocation);
		model.addAttribute("recommendLandmak", recommendLandmak);
		model.addAttribute("recommendWorkspace", recommendWorkspace);
		
		return ".travel.location.location";
	}
}
