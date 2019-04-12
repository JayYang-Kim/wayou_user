package com.sp.party;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("party.partyController")
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/travel/party")
	public String main(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = partyService.dataCount(map);
		
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Party> list = partyService.listParty(map);
		for(Party dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/travel/party";
		String articleUrl = cp + "/travel/party/view?page=" + current_page;
		
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".party.main";
	}
	
	@RequestMapping(value="/travel/partyNew", method = RequestMethod.GET)
	public String listPartyNew(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		if(searchValue.length() != 0) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		List<Party> list = partyService.listPartyNew();
		
		for(Party dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String cp = req.getContextPath();
		String query = "";
		String articleUrl = cp + "/travel/party/view?page=" + current_page;
		
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			
			articleUrl += "&" + query;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);

		return "party/main_r_new";
		
	}
	
	@RequestMapping(value="/travel/party/create", method = RequestMethod.GET)
	public String party_list(Model model) {
		model.addAttribute("mode", "create");
		
		return ".party.create";
	}
	
	@RequestMapping(value="/travel/party/create", method = RequestMethod.POST)
	public String party_list_submit(Party dto,
			HttpSession session,
			HttpServletRequest req) {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return "redirect:/main";
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setUserIdx(info.getUserIdx());
		dto.setConfirmCode(0);
		
		try {
			partyService.insertParty(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/travel/party";
	}
	
	@RequestMapping(value="/travel/party/view")
	public String party_view(@RequestParam int partyCode,
			@RequestParam int page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		String query = "page=" + page;
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Party dto = partyService.readParty(partyCode);
		
		if(dto == null) {
			return "redirect:/travel/party?" + query;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("partyCode", partyCode);
		
		Party preReadParty = partyService.preReadParty(map);
		Party nextReadParty = partyService.nextReadParty(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("preReadParty", preReadParty);
		model.addAttribute("nextReadParty", nextReadParty);
		model.addAttribute("query", query);
		
		return ".party.view";
	}
	
	@RequestMapping(value="/travel/party/joinParty", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertJoinParty(@RequestParam Map<String, Object> requestParam) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		try {
			int result = partyService.insertJoinParty(requestParam);
			if(result == 0) {
				state = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.put("state", state);
				
		return model;
	}
	
	@RequestMapping(value="/travel/party/listJoinParty", method = RequestMethod.GET)
	public String listJoinParty(@RequestParam int partyCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model) throws Exception {
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		dataCount = partyService.dataCountJoinParty(partyCode);
		
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("partyCode", partyCode);
		
		List<JoinParty> list = partyService.listJoinParty(map);
		
		for(JoinParty dto : list) {
			dto.setMemo(myUtil.htmlSymbols(dto.getMemo()));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		
		return "party/listJoinParty";
	}
}
