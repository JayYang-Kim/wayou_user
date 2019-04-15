package com.sp.ticket;

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
import org.springframework.web.bind.annotation.RequestPart;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("ticket.QnAController")
public class QnAController {
	@Autowired
	private QnABoardService boardService;
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value="/ticket/qna/qna")
	public String qna(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.ticket.qna.list";
	}
	
	@RequestMapping(value="/ticket/qna/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".ticket.qna.created";
	}
	
	@RequestMapping(value="/ticket/qna/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			QnABoard dto
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserIdx(info.getUserIdx());
		
		boardService.insertBoard(dto);
		
		return "redirect:/ticket/qna/list";
	}
	
	@RequestMapping(value="/ticket/qna/list")
	public String list (
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=boardService.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		List<QnABoard> list = boardService.listBoard(map);
		
		int listNum, n=0;
		for(QnABoard dto : list) {
			listNum = dataCount - (start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/ticket/qna/list";
		String articleUrl = cp + "ticket/qna/article?page="+current_page;
		
		if(searchValue.length()!=0) {
			query = "searchKey"+searchKey+"&searchValue"+URLEncoder.encode(searchValue, "UTF-8");
			
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
	
		return ".four.ticket.qna.list";
	}
	
	@RequestMapping(value="/ticket/qna/article")
	public String article(
			@RequestParam int qnaCode,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model
			) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "UTF-8");
		String query="page"+page;
		if(searchValue.length() != 0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		boardService.updateHitCount(qnaCode);
		
		QnABoard dto = boardService.readBoard(qnaCode);
		if(dto==null) {
			return "redirect:/ticket/qna/list";
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("qnaCode", qnaCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".four.ticket.qna.article";
	}
	
	
}
