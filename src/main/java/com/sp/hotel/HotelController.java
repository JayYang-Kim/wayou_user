package com.sp.hotel;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

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
							@RequestParam (defaultValue="0") int hotelCode,
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
		String articleUrl=cp+"/hotel/hotel/article?page="+current_page;
	
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
		model.addAttribute("hotelCode", hotelCode);
		
		return ".hotel.hotel.list";
	}
	
	@RequestMapping(value="/hotel/hotel/article")
	public String Harticle(@RequestParam int hotelCode,
						   @RequestParam int page,
						   HttpServletRequest req,
						   Model model
						   ) throws Exception {
		

		String query="page="+page+"&hotelCode="+hotelCode;
		
		Hotel maxDto=hotelservice.readHotelMax(hotelCode);
		
		
		List<Hotel> list = hotelservice.readHotel(hotelCode);
		if(list == null) {
			return "redirect:/hotel/hotel/list?"+query;
		}
		
		for(Hotel dto : list) {
			dto.setInformation(myUtil.htmlSymbols(dto.getInformation()));
			dto.setCancel_notice(myUtil.htmlSymbols(dto.getCancel_notice()));
			dto.setNotice(myUtil.htmlSymbols(dto.getNotice()));
		}
		

		model.addAttribute("maxDto", maxDto);
		model.addAttribute("hotelCode", hotelCode);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".hotel.hotel.article";
	}
	
	@RequestMapping(value="/hotel/hotel/insertReview", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReview(Hotel dto,
			HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setUserIdx(info.getUserIdx());
			
		String state="true";
		
		try {
			int result = hotelservice.insertReview(dto);
			
			if(result==0) {
				state="false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/hotel/hotel/hotelReview")
	public String listReview(@RequestParam int hotelCode,
										  @RequestParam (value="pageNo", defaultValue="1") int current_page,
										  Model model) throws Exception{
		
		int rows=5;
		int total_page;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("hotelCode", hotelCode);
		
		dataCount=hotelservice.reviewDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Review> listReview=hotelservice.listReview(map);
		for(Review dto : listReview) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReview", listReview);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "hotel/hotel/hotelReview";		
	}
	
	
}
