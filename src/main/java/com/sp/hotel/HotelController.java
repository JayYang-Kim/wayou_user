package com.sp.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("hotel.hotelController")
public class HotelController {
	@RequestMapping(value={"/hotel/main"},method=RequestMethod.GET )
	public String main() {
		return ".hotel.main";
	}
	
	@RequestMapping(value={"/hotel/list"},method=RequestMethod.GET )
	public String list() {
		return ".hotel.list";
	}
	
	@RequestMapping(value={"/hotel/hdetail"},method=RequestMethod.GET )
	public String hdetail() {
		return ".hotel.hdetail";
	}
		
}
