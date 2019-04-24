package com.sp.hotel;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("hotel.hotelController")
public class HotelController {
	@RequestMapping(value="/hotel/hotel/main",method=RequestMethod.GET )
	public String main() {
		return ".hotel.hotel.main";
	}
	
	@RequestMapping(value="/hotel/hotel/list",method=RequestMethod.GET )
	public String HotelList(@RequestParam (value="page", defaultValue="1") int current_page,
							@RequestParam (value="all") String key,
							@RequestParam (value="") String value,
							HttpServletRequest req,
							Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			value=URLEncoder.encode(value, "utf-8");
		}
		
		int row=2;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		
			
		return ".hotel.hotel.list";
	}
	
	@RequestMapping(value="/hotel/hotel/article", method=RequestMethod.GET )
	public String Harticle() {
		return ".hotel.hotel.article";
	}
	
}
