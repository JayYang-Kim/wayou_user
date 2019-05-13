package com.sp.hqna;

import java.net.URLDecoder;
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

@Controller("hqna.hqnaController")
public class HqnaController {
	
	@Autowired
	private HqnaService hqnaService;
	
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/hotel/hqna/main",method=RequestMethod.GET )
	public String hqnaList() throws Exception {
		
		return ".hotel.hqna.main";
	}
	
	@RequestMapping(value="/hotel/hqna/listTab1")
	public String hqnaListTab1(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all")String key,
			@RequestParam(defaultValue="") String value,
	
			HttpServletRequest req,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			value=URLDecoder.decode(value, "UTF-8");
		}
		
		int rows=2;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("key", key);
		map.put("value", value);
		dataCount=hqnaService.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);

		
		
		List<Hqna> list=hqnaService.listHqna(map);
		
		int listNum, n=0;
		for(Hqna dto:list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
			
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page",current_page); 
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		
		return "hotel/hqna/listTab1";
	}
	
	@RequestMapping(value="/hotel/hqna/tab2", method=RequestMethod.POST)
	public String hqnaListTab2(
		@RequestParam(value="page", defaultValue="1") int current_page,
		@RequestParam(defaultValue="all") String key,
		@RequestParam(defaultValue="") String value,
		HttpServletRequest req,
		Model model
		) throws Exception {
	
	if(req.getMethod().equalsIgnoreCase("GET")) {
		value=URLDecoder.decode(value, "UTF-8");
	}
	
	int total_page = 0;
	int dataCount = 0;
	int rows = 10;
	
	Map<String, Object> map = new HashMap<>();
	map.put("key", key);
	map.put("value", value);
	
	dataCount=hqnaService.HfaqdataCount(map);
	if(dataCount!=0)
		total_page=myUtil.pageCount(rows, dataCount);
	
	if(current_page>total_page)
		current_page=total_page;
	
	int start = (current_page-1)*rows+1;
	int end = current_page*rows;
	
	map.put("start", start);
	map.put("end", end);
	List<Hfaq> list = hqnaService.HfaqlistBoard(map);
	
	int listNum, n=0;
	for(Hfaq dto : list) {
		listNum = dataCount - (start+n-1);
		dto.setListNum(listNum);
		n++;
	}
	
/*	String cp = req.getContextPath();
	String query = "";
	String listUrl = cp + "/ticket/faq/list";
	String articleUrl = cp + "ticket/faq/article?page="+current_page;
	
	if(searchValue.length()!=0) {
		query = "searchKey"+searchKey+"&searchValue"+URLEncoder.encode(searchValue, "UTF-8");
		
		listUrl += "?" + query;
		articleUrl += "&" + query;
	}
	
	String paging = myUtil.paging(current_page, total_page, listUrl);*/
	String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
	
	model.addAttribute("list", list);
	model.addAttribute("dataCount", dataCount);
	model.addAttribute("page", current_page);
	model.addAttribute("total_page", total_page);
	model.addAttribute("paging", paging);
	model.addAttribute("key", key);
	model.addAttribute("value", value);
	

		return "hotel/hqna/tab2";
	}
	
	@RequestMapping(value="/hotel/hqna/tab3", method=RequestMethod.POST)
	public String hqnaListTab3() {
		return "hotel/hqna/tab3";
	}
	
	@RequestMapping(value= "/hotel/hqna/created",method=RequestMethod.GET )
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		
		return "hotel/hqna/created";
	}
	
	@RequestMapping(value= "/hotel/hqna/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(HttpSession session, Hqna dto) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserIdx(info.getUserIdx());
		
		String state="true";
		
		int result= hqnaService.insertHqna(dto);
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value= "/hotel/hqna/article")
	public String article(
			@RequestParam int qnaCode,
			@RequestParam int pageNo,
			@RequestParam (defaultValue="all") String key,
			@RequestParam (defaultValue="") String value,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		hqnaService.updateHitCount(qnaCode);	
		
		Hqna dto=hqnaService.readHqna(qnaCode);
		
		if(dto==null) {
			return hqnaListTab1(pageNo, key, value, req, model);
		}
		
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<>();
		value=URLDecoder.decode(value, "utf-8");
		map.put("key", key);
		map.put("value", value);
		map.put("qnaCode", qnaCode);
		
		Hqna preHqnadto = hqnaService.preReadHqna(map);
		Hqna nextHqndto = hqnaService.nextReadHqna(map);
		
		
		List<Reply> listReply=hqnaService.listReply(map);
		for(Reply vo:listReply) {
			vo.setAnswerContent(myUtil.htmlSymbols(vo.getAnswerContent()));
		}
		
		model.addAttribute("listReply", listReply);		
		model.addAttribute("dto", dto);
		model.addAttribute("preHqnadto", preHqnadto);
		model.addAttribute("nextHqnadto", nextHqndto);	
		
		return "hotel/hqna/article";
	}
	
	
	@RequestMapping(value="/hotel/hqna/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int qnaCode,
			@RequestParam int pageNo,
			@RequestParam (defaultValue="all") String key,
			@RequestParam (defaultValue="") String value,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		
		Hqna dto=hqnaService.readHqna(qnaCode);
		
		if(dto==null) {
			return hqnaListTab1(pageNo, key, value, req, model);
	
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
				
		return "hotel/hqna/created";
	}
	
	@RequestMapping(value="/hotel/hqna/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(HttpSession session, Hqna dto) throws Exception {

		hqnaService.updateHqna(dto);
		
		String state="true";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/hotel/hqna/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteHqna(@RequestParam int qnaCode,
										  HttpSession session) throws Exception {
		
		
		
		int result=hqnaService.deleteHqna(qnaCode);
		String state="true";
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
		
	}
	
	@RequestMapping(value="/hotel/hqna/listReply")
	public String listReply(
							@RequestParam int qnaCode,
							Model model ) throws Exception {
		
	Map<String, Object> map=new HashMap<>();
	map.put("qnaCode", qnaCode);
	
	
	List<Reply> listReply=hqnaService.listReply(map);
	for(Reply dto:listReply) {
		dto.setAnswerContent(myUtil.htmlSymbols(dto.getAnswerContent()));
	}
	
	model.addAttribute("listReply", listReply);

	
		return "hotel/hqna/listReply";
		
	}
}
