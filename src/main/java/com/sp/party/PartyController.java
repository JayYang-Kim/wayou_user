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
		
		List<Party> list = partyService.listBoard(map);
		
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
		
		partyService.insertParty(dto);
		
		return "redirect:/travel/party";
	}
	
	@RequestMapping(value="/travel/party/view", method = RequestMethod.GET)
	public String party_view() {
		return ".party.view";
	}
}
