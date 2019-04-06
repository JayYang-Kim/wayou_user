package com.sp.party;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("party.partyController")
public class PartyController {
	@RequestMapping(value="/travel/party", method = RequestMethod.GET)
	public String main() {
		return ".party.main";
	}
}
