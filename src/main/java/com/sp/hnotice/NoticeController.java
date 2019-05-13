package com.sp.hnotice;

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

@Controller("hnotice.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("/hotel/hnotice/list")
	public String noticeList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/hotel/hnotice/list";
		String articleUrl = cp+"/hotel/hnotice/article"; 
		
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
		int total_page = myUtil.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<HNotice> list =  noticeService.list(map);
		
		//리스트 번호 만들기
		int n =0;
		for(HNotice notice : list) {
			notice.setListNum(articleCount-((current_page-1)*rows +n));
			notice.setCreated(notice.getCreated().substring(0, 11));
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
		return	".hotel.hnotice.list";
	}
	
	@GetMapping("/hotel/hnotice/article")
	public String readNotice(
				@RequestParam int noticeNum,
				@RequestParam(defaultValue="", value="searchKey") String searchKey,
				@RequestParam(defaultValue="", value="searchValue") String searchValue,
				@RequestParam(defaultValue="1", value="page") int current_page,
				Model model
			) {
		try {
			HNotice notice = noticeService.readNotice(noticeNum);
		
			
			noticeService.updateHitCount(noticeNum);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			model.addAttribute("notice", notice);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/hotel/hnotice/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		return ".hotel.hnotice.article";
	}
}
