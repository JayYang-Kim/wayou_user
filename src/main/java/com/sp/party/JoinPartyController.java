package com.sp.party;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;

@Controller("party.joinPartyController")
public class JoinPartyController {
	
	@Autowired
	private JoinPartyService joinPartyService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/travel/party/joinParty", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertJoinParty(@RequestParam Map<String, Object> requestParam) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		String msg = "true";
		try {
			int result = joinPartyService.insertJoinParty(requestParam);
			if(result == 0) {
				state = "false";
			}
		} catch (Exception e) {
			msg = "false";
			e.printStackTrace();
		}
		
		model.put("state", state);
		model.put("msg", msg);
				
		return model;
	}
	
	@RequestMapping(value="/travel/party/listJoinParty", method = RequestMethod.GET)
	public String listJoinParty(@RequestParam int partyCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model) throws Exception {
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		dataCount = joinPartyService.dataCountJoinParty(partyCode);
		
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
		
		List<JoinParty> list = joinPartyService.listJoinParty(map);
		
		for(JoinParty dto : list) {
			dto.setMemo(myUtil.htmlSymbols(dto.getMemo()));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		
		return "party/listJoinParty";
	}
	
	@RequestMapping(value="/travel/party/joinParty/accept", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinParty_accept(@RequestParam Map<String, Object> paramMap) throws Exception {
		String msg = "true";
		
		try {
			joinPartyService.updateJoinParty_accept(paramMap);
		} catch (Exception e) {
			msg = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("msg", msg);
		
		return model;
	}
	
	@RequestMapping(value="/travel/party/joinParty/refuse", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinParty_refuse(@RequestParam Map<String, Object> paramMap) throws Exception {
		String msg = "true";
		
		try {
			joinPartyService.updateJoinParty_refuse(paramMap);
		} catch (Exception e) {
			msg = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("msg", msg);
		
		return model;
	}
	
	@RequestMapping(value="/travel/party/joinParty/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinParty_delete(@RequestParam Map<String, Object> paramMap) throws Exception {
		String msg = "true";
		
		try {
			joinPartyService.updateJoinParty_delete(paramMap);
		} catch (Exception e) {
			msg = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("msg", msg);
		
		return model;
	}
}
