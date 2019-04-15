package com.sp.hevent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("hevent.heventController")
public class HeventController {
	@RequestMapping(value={"/hotel/hevent/hevent"},method=RequestMethod.GET )
	public String hevent() {
		return ".hotel.hevent.hevent";
	}
	
	@RequestMapping(value={"/hotel/hevent/article"},method=RequestMethod.GET )
	public String earticle() {
		return ".hotel.hevent.article";
	}	
}
