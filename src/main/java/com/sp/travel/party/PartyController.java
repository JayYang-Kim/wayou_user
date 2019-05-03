package com.sp.travel.party;

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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("travel.party.partyController")
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
		
		return ".travel.party.main";
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

		return "travel/party/main_r_new";
		
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
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
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
		
		return ".travel.party.view";
	}
	
	@RequestMapping(value="/travel/party/update", method = RequestMethod.GET)
	public String partyUpdateForm(@RequestParam int partyCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		String query = "page=" + current_page;
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Party dto = partyService.readParty(partyCode);
		
		if(dto == null) {
			return "redirect:/travel/party?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("mode", "update");
		
		return ".travel.party.create";
	}
	
	@RequestMapping(value="/travel/party/update", method = RequestMethod.POST)
	public String partyUpdateSubmit(Party dto,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String query = "page=" + current_page;
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return "redirect:/travel/party?" + query;
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info.getUserIdx() != dto.getUserIdx()) {
			return "redirect:/travel/party?" + query;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		try {
			partyService.updateParty(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "redirect:/travel/party?" + query;
	}
	
	@RequestMapping(value="/travel/party/delete")
	public String partyDelete(@RequestParam int partyCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue) throws Exception {
		
		String query = "page=" + current_page;
		if(searchValue.length() != 0) {
			query += "&searchKey" + searchKey + "&searchValue" + searchValue;
		}
		
		try {
			int result = partyService.deleteParty(partyCode);
			
			if(result == 0) {
				return "redirect:/travel/party/view?" + query;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/travel/party/view?" + query;
		}
		
		return "redirect:/travel/party?" + query;
	}
	
	@RequestMapping(value="/travel/party/myList")
	public String myPartyList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("userIdx", info.getUserIdx());
		
		dataCount = partyService.myParty_dataCount(map);
		
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
		
		List<Party> list = partyService.myListParty(map);
		for(Party dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/travel/party/myList";
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
		
		return ".travel.party.myList.main";
	}
	
	@RequestMapping(value="/travel/party/attendList")
	public String attendPartyList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("userIdx", info.getUserIdx());
		
		dataCount = partyService.attendParty_dataCount(map);
		
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
		
		List<Party> list = partyService.attendListParty(map);
		for(Party dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/travel/party/attendList";
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
		
		return ".travel.party.attendList.main";
	}
}
