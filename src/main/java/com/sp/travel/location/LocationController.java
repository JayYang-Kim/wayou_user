package com.sp.travel.location;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("travel.location.locationController")
public class LocationController {
	@RequestMapping(value="/travel/location")
	public String main() {
		return ".travel.location.main";
	}
	
	@RequestMapping(value="/travel/location/view")
	public String locationView() {
		return ".travel.location.location";
	}
}
