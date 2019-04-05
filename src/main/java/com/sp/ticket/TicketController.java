package com.sp.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("ticket.ticketController")
public class TicketController {
	@RequestMapping(value="/ticket/tmain")
	public String main() {
		return ".ticket.tmain";
	}
	
	@RequestMapping(value="/ticket/list")
	public String list() {
		return ".ticket.list";
	}
}

