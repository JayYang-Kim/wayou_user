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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("hqna.hqnaController")
public class HqnaController {
	
	@Autowired
	private HqnaService hqnaService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/hotel/hqna/list",method=RequestMethod.GET )
	public String hqnaList() throws Exception {
		
		return ".hotel.hqna.list";
	}
	
	@RequestMapping(value="/hotel/hqna/tab1")
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
		
		return "hotel/hqna/tab1";
	}
	
	@RequestMapping(value="/hotel/hqna/tab2", method=RequestMethod.POST)
	public String hqnaListTab2() {
		return "hotel/hqna/tab2";
	}
	
	@RequestMapping(value="/hotel/hqna/tab3", method=RequestMethod.POST)
	public String hqnaListTab3() {
		return "hotel/hqna/tab3";
	}
	
	@RequestMapping(value= "/hotel/hqna/created",method=RequestMethod.GET )
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		
		return ".hotel.hqna.created";
	}
	
	@RequestMapping(value= "/hotel/hqna/created", method=RequestMethod.POST)
	public String createdSubmit(HttpSession session, Hqna dto) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
	
		dto.setUserIdx(info.getUserIdx());
		
		hqnaService.insertHqna(dto);
		
		return "redirect:/hotel/hqna/list";
	}
	
	@RequestMapping(value= "/hotel/hqna/article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam (defaultValue="all") String key,
			@RequestParam (defaultValue="") String value,
			HttpSession session,
			Model model
			) throws Exception {
			
		value=URLDecoder.decode(value, "UTF-8");
		String query="page="+page;
		if(value.length() !=0) {
			query +="key="+key+"value="+URLDecoder.decode(value, "UTF-8");
		}
		
		hqnaService.updateHitCount(num);
		
		Hqna dto=hqnaService.readHqna(num);
		if(dto==null) {
			return "redirect:hotel/hqna/list?"+query;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<>();
		map.put("key", key);
		map.put("value", value);
		map.put("num", num);
		
		Hqna preHqnadto = hqnaService.preReadHqna(map);
		Hqna nextHqndto = hqnaService.nextReadHqna(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preHqnadto", preHqnadto);
		model.addAttribute("nextHqnadto", nextHqndto);
		model.addAttribute("query", query);
		model.addAttribute("page", page);		
		
		return ".hotel.hqna.article";
	}
}
