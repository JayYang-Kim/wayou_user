package com.sp.travel.location;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("travel.location.locationController")
public class LocationController {
	@Autowired
	private LocationService locationService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/travel/location")
	public String main(Model model) throws Exception {
		
		List<Location> listLocation = locationService.listLocation();
		
		for(Location dto : listLocation) {
			dto.setLocAvgStarNum(Math.round(dto.getLocAvgStarNum()));
		}
		
		model.addAttribute("listLocation", listLocation);
		
		return ".travel.location.list";
	}
	
	// 추천 여행일정(지역) AJAX HTML 출력
	@RequestMapping(value="/travel/location/recommendLocation")
	public String recommendLocation(Model model) throws Exception {
		List<Location> list = locationService.recommendLocation();
		
		model.addAttribute("list", list);
		
		return "travel/location/recommendList";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/travel/location/view")
	public String locationView(@RequestParam int locCode,
			Model model) throws Exception {
		Location readLocation = locationService.readLocation(locCode);
		
		readLocation.setLocAvgStarNum(Math.round(readLocation.getLocAvgStarNum()));
		
		if(readLocation == null) {
			return "redirect:/travel";
		}
		
		List<Location> recommendLandmak = locationService.recommendLandmak(locCode);
		List<Location> recommendWorkspace = locationService.recommendWorkspace(locCode);
		
		model.addAttribute("readLocation", readLocation);
		model.addAttribute("recommendLandmak", recommendLandmak);
		model.addAttribute("recommendWorkspace", recommendWorkspace);
		
		return ".travel.location.location";
	}
	
	@RequestMapping(value="/travel/location/replyList")
	public String replyList(@RequestParam int locCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model) throws Exception {
		int rows = 5;
		int dataCount = locationService.replyCount(locCode);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("locCode", locCode);
		map.put("start", start);
		map.put("end", end);
	
		List<Location> list = locationService.replyList(map);
		
		for(Location dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String methodName = "replyList";
		String paging = myUtil.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "travel/location/locationReply";
	}
	
	@RequestMapping(value="/travel/location/reply/insert")
	@ResponseBody
	public void insertReply(Location dto,
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserIdx(info.getUserIdx());
		
		int result = 0;
		String msg = "true";
		try {
			result = locationService.replyInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("msg", msg);
		model.put("result", result);
	}
	
	@RequestMapping(value="/travel/location/reply/delete")
	@ResponseBody
	public Map<String,Object> deleteReply(@RequestParam int replyCode,
			@RequestParam int userIdx,
			HttpSession session) throws Exception {		
		Map<String,Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(userIdx != info.getUserIdx()) {
			map.put("msg", "false");
			return map;
		}
		try {
			locationService.replyDelete(replyCode);
			map.put("msg", "true");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}
}
