package com.sp.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("ticket.ticketController")
public class TicketController {
	@Autowired
	private TicketService ticketService;
	@Autowired
	private MyUtil myUtil;

	
	@RequestMapping(value="/ticket/tmain")
	public String main() {
		return ".ticket.tmain";
	}
	
	@RequestMapping(value="/ticket/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="0") int regionCode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 2;
		
		Map<String, Object> map = new HashMap<>();
		map.put("regionCode", regionCode);
		
		dataCount=ticketService.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<Ticket> list = ticketService.listTicket(map);
		
		int listNum, n=0;
		for(Ticket dto : list) {
			listNum = dataCount - (start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		List<Ticket> listRegion = ticketService.listRegion();
		List<Ticket> listCategory = ticketService.listCategory();
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/ticket/list";
		String articleUrl = cp + "ticket/article?page="+current_page+"&regionCode="+regionCode;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("listRegion", listRegion);
		model.addAttribute("regionCode", regionCode);
		model.addAttribute("listCategory", listCategory);
		

		return ".ticket.list";
	}
	
	
	
	@RequestMapping(value="/ticket/detail")
	public String detail() {
		return ".ticket.detail";
	}
}

