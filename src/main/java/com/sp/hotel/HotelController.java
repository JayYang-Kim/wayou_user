package com.sp.hotel;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("hotel.hotelController")
public class HotelController {
	
	@Autowired
	private HotelService hotelservice;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value="/hotel/hotel/main",method=RequestMethod.GET )
	public String main() {
		return ".hotel.hotel.main";
	}
	
	@RequestMapping(value="/hotel/hotel/list" )
	public String HotelList(@RequestParam (value="page", defaultValue="1") int current_page,
							@RequestParam (defaultValue="") String value,
							@RequestParam (defaultValue="") String price_order,
							HttpServletRequest req,
							Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			value=URLEncoder.encode(value, "utf-8");
		}

		int rows=2;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("price_order", price_order);
		map.put("value", value);
		
		dataCount=hotelservice.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Hotel> list=hotelservice.listHotel(map);
		
		int listNum, n=0;
		for(Hotel dto:list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/hotel/hotel/list";
		String articleUrl=cp+"/hotel/hotel/aticle?page="+current_page;
	
		if(value.length()!=0) {
			query+="value="+URLEncoder.encode(value, "utf-8");
			
			listUrl += "?"+query;
			articleUrl += "&"+query;
		}

		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		model.addAttribute("value", value);
		
		return ".hotel.hotel.list";
	}
	
	@RequestMapping(value="/hotel/hotel/article", method=RequestMethod.GET )
	public String Harticle() {
		return ".hotel.hotel.article";
	}
	
}
