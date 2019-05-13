package com.sp.travel.landmark;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("travel.landmark.landmarkController")
public class LandmarkController {
	@Autowired
	private LandmarkService landmarkService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/travel/landmark")
	public String main(@RequestParam int locCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int dataCount = 0;
		int total_page = 0;
		int rows = 10;
		
		dataCount = landmarkService.countLandmark(locCode);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("locCode", locCode);
		map.put("start", start);
		map.put("end", end);
		
		List<Landmark> list = landmarkService.listLandmark(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/travel/landmark";
		String articleUrl = cp + "/travel/landmark/view?page=" + current_page;
		
		if(searchValue.length() != 0) {
			String query = "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("locCode", locCode);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".travel.landmark.list";
	}
	
	@RequestMapping(value="/travel/landmark/view")
	public String locationView(Model model) throws Exception {
		
		return ".travel.landmark.landmark";
	}
}
