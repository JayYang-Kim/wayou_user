package com.sp.travel.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="/travel/location/view")
	public String locationView() {
		return ".travel.location.location";
	}
	
	// 추천 여행일정(지역) AJAX HTML 출력
	@RequestMapping(value="/travel/location/recommendLocation")
	public String recommendLocation(Model model) throws Exception {
		List<Location> list = locationService.recommendLocation();
		
		model.addAttribute("list", list);
		
		return "travel/location/recommendList";
	}
}
