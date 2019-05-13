	package com.sp.ticket;

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

@Controller("ticket.eventController")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private MyUtil util;
	
	@GetMapping("/ticket/event/list")
	public String eventList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/ticket/event/list";
		String articleUrl = cp+"/ticket/event/article"; 
		
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
		int total_page = util.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Event> list =  eventService.eventList(map);
		
		//리스트 번호 만들기

		Calendar cal = Calendar.getInstance();
		Calendar now = Calendar.getInstance();
		now.set(Calendar.HOUR, 23);
		now.set(Calendar.MINUTE,59);
		now.set(Calendar.SECOND, 59);
		
		
		int n =0;
		for(Event event : list) {
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
		
		String paging = util.paging(current_page, total_page, url);
		
		model.addAttribute("page", current_page);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", URLEncoder.encode(searchValue, "utf-8"));
		model.addAttribute("url", url);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return	".ticket.event.list";
	}
	
	
	@GetMapping("/ticket/event/article")
	public String eventArticle(
			@RequestParam(value="eventNum") int eventNum,
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			Model model
			){
		try {
			Event event = eventService.eventArticle(eventNum);
			eventService.updateHitCount(eventNum);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			event.setStartDate(event.getStartDate().substring(0, 10));
			event.setEndDate(event.getEndDate().substring(0, 10));
			
			model.addAttribute("event", event);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/ticket/event/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}

		return ".ticket.event.article";
	}
	
	@PostMapping("/ticket/event/insertReply")
	@ResponseBody
	public void insertReply(
				EventReply reply,
				HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		reply.setUserIdx(info.getUserIdx());
		eventService.insertReply(reply);
	}
	
	@GetMapping("/ticket/event/replyList")
	public String replyList(
			@RequestParam int eventNum,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model
			) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int rows = 5;
		int dataCount = eventService.replyCount(eventNum);
		int total_page = util.pageCount(rows, dataCount);
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("eventNum", eventNum);
		map.put("start", start);
		map.put("end", end);
	
		List<EventReply> list = eventService.eventReplys(map);
		String methodName = "replyList";
		String paging = util.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "ticket/event/replyList";
	}
	
	@PostMapping("/ticket/event/deleteReply")
	@ResponseBody
	public Map<String,Object> deleteReply(
			EventReply reply,
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
