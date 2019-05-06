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
}
