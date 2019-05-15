package com.sp.myPage;
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
import com.sp.ticket.QnABoard;

@Controller("myPage.myPageQnaController")
public class MyPageQnaController {
	@Autowired
	private MyPageQnaService boardService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/myPage/question")
	public String myQuestion(
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
		
		if(current_page>total_page) {
			current_page=total_page;
		}	
		
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
		String listUrl = cp + "/myPage/question";
		
		if(searchValue.length()!=0) {
			query = "searchKey"+searchKey+"&searchValue"+URLEncoder.encode(searchValue, "UTF-8");
			
			listUrl += "?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
	
		return ".myP.myPage.qna.contact";
	}
	
	@RequestMapping(value="/myPage/question/hitCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> hitCount(@RequestParam int qnaCode) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String msg="true";
		int result=boardService.updateHitCount(qnaCode);
		if(result==0) {
			msg="false";
		}
		
		int hitCount=boardService.readHitCount(qnaCode);
		
		model.put("msg", msg);
		model.put("hitCount", hitCount);
		
		return model;
	}
	
	@RequestMapping(value="/myPage/question/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int qnaCode,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		QnABoard dto = boardService.readBoard(qnaCode);
		System.out.println("성공"+dto.getUserIdx());
		
		if(info.getUserIdx()!=dto.getUserIdx()) {
			return "redirect:/myPage/question?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".myP.myPage.qna.created";
	}
	
	@RequestMapping(value="/myPage/question/update", method=RequestMethod.POST)
	public String updateSubmit(
			QnABoard dto,
			@RequestParam String page) throws Exception {
		
		boardService.updateBoard(dto);
		
		return "redirect:/myPage/question?page="+page;
	}
	
	@RequestMapping(value="/myPage/question/delete")
	public String delete(
			@RequestParam int qnaCode,
			@RequestParam String page) throws Exception {
		
		boardService.deleteBoard(qnaCode);
		
		return "redirect:/myPage/question?page="+page;
	}
	
}
