package com.sp.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("hotel.hotelController")
public class HotelController {
	@RequestMapping(value="/hotel/hotel/main",method=RequestMethod.GET )
	public String main() {
		return ".hotel.hotel.main";
	}
	
	@RequestMapping(value="/hotel/hotel/list",method=RequestMethod.GET )
	public String list() {
		return ".hotel.hotel.list";
	}
	
	@RequestMapping(value="/hotel/hotel/article", method=RequestMethod.GET )
	public String harticle() {
		return ".hotel.hotel.article";
	}
	
}
