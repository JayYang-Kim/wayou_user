	package com.sp.ticket;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("ticket.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MyUtil util;

	@GetMapping("/ticket/notice/list")
	public String noticeList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/ticket/notice/list";
		String articleUrl = cp+"/ticket/notice/article"; 
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		if(!searchValue.equals("")) {	
			url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			articleUrl +="?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		//사전 준비
		int rows = 10;
		int articleCount = noticeService.noticeCount(map);
		int total_page = util.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list =  noticeService.list(map);
		
		//리스트 번호 만들기
		int n =0;
		for(Notice notice : list) {
			notice.setListNum(articleCount-((current_page-1)*rows +n));
			notice.setCreated(notice.getCreated().substring(0, 11));
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
		return	".ticket.notice.list";
	}
	
	@GetMapping("/ticket/notice/article")
	public String readNotice(
				@RequestParam int noticeNum,
				@RequestParam(defaultValue="", value="searchKey") String searchKey,
				@RequestParam(defaultValue="", value="searchValue") String searchValue,
				@RequestParam(defaultValue="1", value="page") int current_page,
				Model model
			) {
		try {
			Notice notice = noticeService.readNotice(noticeNum);
			
			notice.setContent(util.htmlSymbols(notice.getContent()));
			
			noticeService.updateHitCount(noticeNum);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			model.addAttribute("notice", notice);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/ticket/notice/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		return ".ticket.notice.article";
	}
	
	
}
