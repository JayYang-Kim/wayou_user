package com.sp.travel;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;

@Controller("travel.travelController")
public class TravelController {
	
	@Autowired
	private TravelService travelService;
	
	@RequestMapping(value="/travel/myplan/add")
	public String workSpace() {
		return ".travel.myplan.add";
	}
	
	@RequestMapping(value="/travel/myplan/locList")
	public String locList(@RequestParam String name,Model model) throws UnsupportedEncodingException {
		name = URLDecoder.decode(name, "utf-8");
		List<Location> list = travelService.locList(name);
		model.addAttribute("list", list);
		return "travel/myplan/location/locList";
	}
	
	
	@RequestMapping(value="/travel/myplan/basicInfo")
	public String basicInfo(@RequestParam int locCode,Model model) throws UnsupportedEncodingException {
		Location dto = travelService.getLocation(locCode);
		model.addAttribute("dto", dto);
		return "travel/myplan/location/basicInfo";
	}
	
	@RequestMapping(value="/travel/myplan/workspace", method=RequestMethod.POST)
	public String workspace(
		@RequestParam int locCode,
		@RequestParam String title,
		@RequestParam String startDay,
		@RequestParam String endDay,
		@RequestParam String lat,
		@RequestParam String lng,
		HttpSession session,
		Model model
	) {
		Map<String,Object> map = new HashMap<>(); //넘어온 파라미터에서 데이터 넘기기
		map.put("locCode", locCode);
		map.put("title", title);
		map.put("startDay", startDay);
		map.put("endDay", endDay);

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		map.put("userIdx", info.getUserIdx());
		
		int year = Integer.parseInt(startDay.substring(0, 4));
		int month = Integer.parseInt(startDay.substring(5, 7));
		int date = Integer.parseInt(startDay.substring(8));
		
		Calendar scal = Calendar.getInstance();
		scal.set(year, month, date);
		
		year = Integer.parseInt(endDay.substring(0, 4));
		month = Integer.parseInt(endDay.substring(5, 7));
		date = Integer.parseInt(endDay.substring(8));
		
		Calendar ecal = Calendar.getInstance();
		ecal.set(year, month, date);
		
		long diff = ecal.getTimeInMillis()-scal.getTimeInMillis();
		
		map.put("dayCount", diff/1000/60/60/24);
		
		travelService.insertWorkspace(map);
		
		model.addAttribute("locCode", locCode);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("dayCount",diff/1000/60/60/24);
		model.addAttribute("startDay",startDay);
		model.addAttribute("endDay",endDay);
		model.addAttribute("title", title);
		
		return ".travel.myplan.workspace";
	}
	
	@RequestMapping(value="/travel/myplan/landList")
	public String landList(@RequestParam int locCode,@RequestParam String landName,Model model) throws UnsupportedEncodingException {
		landName = URLDecoder.decode(landName, "utf-8");
		Map<String,Object> map = new HashMap<>();
		map.put("locCode", locCode);
		map.put("landName", landName);
		List<Landmark> list = travelService.landList(map);
		model.addAttribute("list", list);
		return "travel/myplan/landmark/landList";
	}
	
	
	@RequestMapping(value="/travel/myplan/listByTag")
	public String landList(@RequestParam int locCode, @RequestParam int tagNum,Model model) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("locCode", locCode);
		map.put("tagNum", tagNum);
		List<Landmark> list = travelService.landListByTag(map);
		model.addAttribute("list", list);
		return "travel/myplan/landmark/landList";
	}
	
}
