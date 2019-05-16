package com.sp.hevent;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("hevent.heventController")
public class HeventController {
	@Autowired
	private EventService eventService;
	
	@Autowired
	private MyUtil myUtil;
	
	

	@GetMapping("/hotel/hevent/list")
	public String eventList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/hotel/hevent/list";
		String articleUrl = cp+"/hotel/hevent/article"; 
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		if(!searchValue.equals("")) {	
			url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			articleUrl +="?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		//사전 준비
		int rows = 10;
		int articleCount = eventService.articleCount(map);
		int total_page = myUtil.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<HEvent> list =  eventService.eventList(map);
		
		//리스트 번호 만들기

		Calendar cal = Calendar.getInstance();
		Calendar now = Calendar.getInstance();
		now.set(Calendar.HOUR, 23);
		now.set(Calendar.MINUTE,59);
		now.set(Calendar.SECOND, 59);
		
		
		int n =0;
		for(HEvent event : list) {
			event.setListNum(articleCount-((current_page-1)*rows +n));
			event.setCreated(event.getCreated().substring(0, 11));
			cal.set(Integer.parseInt(event.getCreated().substring(0, 4)), Integer.parseInt(event.getCreated().substring(5, 7)), Integer.parseInt(event.getCreated().substring(8, 9)));
			System.out.println("eventName : "+event.getEventNum()+" now : "+now.getTimeInMillis()+" input : "+cal.getTimeInMillis());
			if(now.getTimeInMillis()-cal.getTimeInMillis()<=0) {
				event.setIsNew(true);
			}else {
				event.setIsNew(false);
			}
			n++;
		}
		
		String paging = myUtil.paging(current_page, total_page, url);
		
		model.addAttribute("page", current_page);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", URLEncoder.encode(searchValue, "utf-8"));
		model.addAttribute("url", url);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return	".hotel.hevent.list";
	}
	
	
	@GetMapping("/hotel/hevent/article")
	public String eventArticle(
			@RequestParam(value="eventNum") int eventNum,
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			Model model
			){
		try {
			HEvent event = eventService.eventArticle(eventNum);
			
			event.setContent(myUtil.htmlSymbols(event.getContent()));
			
			eventService.updateHitCount(eventNum);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			event.setStartDate(event.getStartDate().substring(0, 10));
			event.setEndDate(event.getEndDate().substring(0, 10));
			
			model.addAttribute("event", event);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/hotel/hevent/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}

		return ".hotel.hevent.article";
	}
	
	@PostMapping("/hotel/hevent/insertReply")
	@ResponseBody
	public void insertReply(
				HEventReply reply,
				HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		reply.setUserIdx(info.getUserIdx());
		eventService.insertReply(reply);
	}
	
	@GetMapping("/hotel/hevent/replyList")
	public String replyList(
			@RequestParam int eventNum,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model
			) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int rows = 5;
		int dataCount = eventService.replyCount(eventNum);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("eventNum", eventNum);
		map.put("start", start);
		map.put("end", end);
	
		List<HEventReply> list = eventService.eventReplys(map);
		String methodName = "replyList";
		String paging = myUtil.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "hotel/hevent/replyList";
	}
	
	@PostMapping("/hotel/hevent/deleteReply")
	@ResponseBody
	public Map<String,Object> deleteReply(
			HEventReply reply,
			HttpSession session
			){		
		Map<String,Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(reply.getUserIdx() != info.getUserIdx()) {
			map.put("isDeleted", false);
			return map;
		}
		eventService.deleteReply(reply);
		map.put("isDeleted", true);
		return map;
	}
}
