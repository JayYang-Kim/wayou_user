package com.sp.party;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.member.SessionInfo;

@Controller("party.partyController")
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	@RequestMapping(value="/travel/party", method = RequestMethod.GET)
	public String main() {
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
