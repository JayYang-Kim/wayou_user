package com.sp.travel.landmark;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("travel.landmark.landmarkController")
public class LandmarkController {
	@Autowired
	private LandmarkService landmarkService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/travel/landmark")
	public String main(@RequestParam int locCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="0") int tagCode,
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
		map.put("tagCode", tagCode);
		map.put("searchValue", searchValue);
		map.put("locCode", locCode);
		map.put("start", start);
		map.put("end", end);
		
		List<Landmark> list = landmarkService.listLandmark(map);
		
		for(Landmark dto : list) {
			dto.setLandAvgStarNum(Math.round(dto.getLandAvgStarNum()));
		}
		
		String cp = req.getContextPath();
		String listUrl = cp + "/travel/landmark";
		String articleUrl = cp + "/travel/landmark/view?page=" + current_page;
		
		if(searchValue.length() != 0) {
			String query = "&tagCode=" + tagCode + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			
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
		model.addAttribute("tagCode", tagCode);
		model.addAttribute("searchValue", searchValue);
		
		return ".travel.landmark.list";
	}
	
	@RequestMapping(value="/travel/landmark/view")
	public String locationView(@RequestParam int locCode,
			@RequestParam int landCode,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("locCode", locCode);
		map.put("landCode", landCode);
		
		Landmark dto = landmarkService.readLandmark(map);
		
		dto.setLandAvgStarNum(Math.round(dto.getLandAvgStarNum()));
		
		List<Landmark> landmarkFiles = landmarkService.landmarkFiles(landCode);
		
		model.addAttribute("readLandmark", dto);
		model.addAttribute("landmarkFiles", landmarkFiles);
		
		return ".travel.landmark.landmark";
	}
	
	@RequestMapping(value="/travel/landmark/replyList")
	public String replyList(@RequestParam int landCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model) throws Exception {
		int rows = 5;
		int dataCount = landmarkService.replyCount(landCode);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("landCode", landCode);
		map.put("start", start);
		map.put("end", end);
	
		List<Landmark> list = landmarkService.replyList(map);
		
		for(Landmark dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String methodName = "replyList";
		String paging = myUtil.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "travel/landmark/landmarkReply";
	}
	
	@RequestMapping(value="/travel/landmark/reply/insert")
	@ResponseBody
	public void insertReply(Landmark dto,
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserIdx(info.getUserIdx());
		
		int result = 0;
		String msg = "true";
		try {
			result = landmarkService.replyInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("msg", msg);
		model.put("result", result);
	}
	
	@RequestMapping(value="/travel/landmark/reply/delete")
	@ResponseBody
	public Map<String,Object> deleteReply(@RequestParam int replyNum,
			@RequestParam int userIdx,
			HttpSession session) throws Exception {		
		Map<String,Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(userIdx != info.getUserIdx()) {
			map.put("msg", "false");
			return map;
		}
		try {
			landmarkService.replyDelete(replyNum);
			map.put("msg", "true");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}
}
