package com.sp.ticket;

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
import com.sp.hotel.Review;
import com.sp.member.SessionInfo;

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
			@RequestParam(defaultValue="0") int cateCode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 2;
		
		Map<String, Object> map = new HashMap<>();
		map.put("regionCode", regionCode);
		map.put("cateCode", cateCode);
		
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
		/*String query = "";*/
		String listUrl = cp + "/ticket/list";
		String articleUrl = cp + "/ticket/detail?page="+current_page+"&regionCode="+regionCode+"&cateCode="+cateCode;
		
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
		model.addAttribute("cateCode", cateCode);
		

		return ".ticket.list";
	}
	
	
	
	@RequestMapping(value="/ticket/detail")
	public String detail(
			@RequestParam int ticketCode,
			@RequestParam int storeCode,
			@RequestParam int page,
			@RequestParam(defaultValue="0") int regionCode,
			@RequestParam(defaultValue="0") int cateCode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String query="page="+page+"&regionCode="+regionCode+"&cateCode="+cateCode;
		
		
		Ticket dto = ticketService.readTicket(ticketCode);
		if(dto==null) {
			return "redirect:/ticket/list"+query;
		}
		
		List<Ticket> listDate = ticketService.readDate(storeCode);

		Map<String, Object> map = new HashMap<>();
		map.put("ticketCode", ticketCode);
		map.put("regionCode", regionCode);
		map.put("cateCode", cateCode);
		map.put("storeCode", storeCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("listDate", listDate);
		
		return ".ticket.detail";
	}
	
	@RequestMapping(value="/ticket/tab1", method=RequestMethod.POST)
	public String tab1 (
			) throws Exception {
		return "ticket/tab1";
	}
	
	
	@RequestMapping(value="/ticket/tab2", method=RequestMethod.POST)
	public String tab2 () throws Exception {
		return "ticket/tab2";
	}
	
	@RequestMapping(value="/ticket/insertReview", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReview(
			TicketReview dto,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserIdx(info.getUserIdx());
		
		int result=ticketService.insertReview(dto);
		String state="true";
		if(result==0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/ticket/listReview")
	public String listReview(
			@RequestParam int storeCode,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		
		int rows = 5;
		int total_page;
		int reviewCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("storeCode", storeCode);
		
		reviewCount = ticketService.reviewCount(map);
		total_page = myUtil.pageCount(rows, reviewCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<TicketReview> listReview = ticketService.listReview(map);
		for(TicketReview dto : listReview) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReview", listReview);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
	
		return "ticket/listReview";
	}
	
	
	@RequestMapping(value="/ticket/tab3", method=RequestMethod.POST)
	public String tab3 (
			@RequestParam int storeCode,
			Model model
			) throws Exception {
		Ticket dto = ticketService.readStore(storeCode);
		
		model.addAttribute("dto", dto);
		
		return "ticket/tab3";
	}
}

