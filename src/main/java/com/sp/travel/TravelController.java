	package com.sp.travel;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("travel.travelController")
public class TravelController {
	
	@Autowired
	private TravelService travelService;
	@Autowired
	private EventService eventService;
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/travel/myplan/add") //일정 만들기 초기화면 호출
	public String add() {
		return ".travel.myplan.add"; //view단의 add.jsp를 호출 //tiles 형태로 리턴
	}
	
	@RequestMapping(value="/travel/myplan/locList") //지역 리스트 호출 Using ajax
	public String locList(@RequestParam String name,Model model) throws UnsupportedEncodingException {
		name = URLDecoder.decode(name, "utf-8");
		List<Location> list = travelService.locList(name);
		model.addAttribute("list", list);
		return "travel/myplan/location/locList";
	}
	
	
	@RequestMapping(value="/travel/myplan/basicInfo") //지역 정보 호출  Using ajax
	public String basicInfo(@RequestParam int locCode,Model model) throws UnsupportedEncodingException {
		Location dto = travelService.getLocation(locCode);
		model.addAttribute("dto", dto);
		return "travel/myplan/location/basicInfo";
	}
	
	private Location locInfo(int locCode) {
		return travelService.getLocation(locCode);
	}
	
	
	@RequestMapping(value="/travel/myplan/workspace", method=RequestMethod.GET)
	public String workspace(
			@RequestParam int locCode,
			@RequestParam int workNum,
			@RequestParam int dayCount,
			@RequestParam(defaultValue="") String lat,
			@RequestParam(defaultValue="") String lng,
			HttpSession session,
			Model model
			) {
		int writerIdx = travelService.readOnlyWorkspace(workNum);
		
		if(writerIdx==0 || ((SessionInfo)session.getAttribute("member")).getUserIdx() != writerIdx) {
			return "redirect:/";
		}
		if(lat.length()==0 && lng.length()==0) {
			Location loc = locInfo(locCode);
			lat = loc.getLat();
			lng = loc.getLng();
		}
	
		model.addAttribute("locCode", locCode);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("workNum", workNum);
		model.addAttribute("dayCount", dayCount);
		return ".travel.myplan.workspace";
	}
	
	@RequestMapping(value="/travel/myplan/workspace", method=RequestMethod.POST) //지역 선택 후 일자와 타이틀을 골라 일정 생성 요청
	@ResponseBody
	public Map<String,Object> addWorkspace(
		@RequestParam int locCode,
		@RequestParam String title,
		@RequestParam String startDay,
		@RequestParam String endDay,
		@RequestParam String lat,
		@RequestParam String lng,
		@RequestParam(value="pay",defaultValue="0") int pay,
		HttpSession session,
		Model model
	) {
		Map<String,Object> map = new HashMap<>(); //넘어온 파라미터에서 데이터 넘기기
		map.put("locCode", locCode);
		map.put("title", title);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("pay", pay);

		SessionInfo info = (SessionInfo)session.getAttribute("member"); //세션에 Member라는 이름으로 저장된 로그인 사용자 객체를 불러오기
		map.put("userIdx", info.getUserIdx());
		
		int year = Integer.parseInt(startDay.substring(0, 4));
		int month = Integer.parseInt(startDay.substring(5, 7));
		int date = Integer.parseInt(startDay.substring(8));
		
		Calendar scal = Calendar.getInstance();
		scal.set(year, month, date);
		
		year = Integer.parseInt(endDay.substring(0, 4));
		month = Integer.parseInt(endDay.substring(5, 7));
		date = Integer.parseInt(endDay.substring(8));
		
		Calendar ecal = Calendar.getInstance();
		ecal.set(year, month, date);
		
		long diff = ecal.getTimeInMillis()-scal.getTimeInMillis(); //몇일 동안 여행인지 확인하여 일자별 리스트 작성을 위한 계산
		
		map.put("dayCount", diff/1000/60/60/24);
		
		int seqNum = travelService.currentWorkSeqNum();
		map.put("seqNum", seqNum);
		
		int result = travelService.insertWorkspace(map);
		boolean isInserted = false;
		if(result==1) {
			isInserted = true;
		}
		map.clear();
		map.put("userIdx",info.getUserIdx());
		map.put("workNum", seqNum);
		map.put("locCode", locCode);
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("dayCount", diff/1000/60/60/24);
		map.put("isInserted", isInserted);
		return map;
	}
	
	@RequestMapping(value="/travel/myplan/listByTag")
	public String landList(@RequestParam int locCode, @RequestParam int tagNum,Model model) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("locCode", locCode);
		map.put("tagNum", tagNum);
		List<Landmark> list = travelService.landListByTag(map);
		model.addAttribute("list", list);
		model.addAttribute("isSaved", false);
		return "travel/myplan/landmark/landList";
	}

	
	@RequestMapping(value="/travel/myplan/landList")
	public String landList(@RequestParam int locCode,@RequestParam String landName,Model model) throws UnsupportedEncodingException {
		landName = URLDecoder.decode(landName, "utf-8");
		Map<String,Object> map = new HashMap<>();
		map.put("locCode", locCode);
		map.put("landName", landName);
		List<Landmark> list = travelService.landList(map);
		model.addAttribute("isSaved", false);
		model.addAttribute("list", list);
		return "travel/myplan/landmark/landList";
	}
	
	@RequestMapping(value="/travel/myplan/loadSavedRouteByDay") //일자별로 저장된 경로 가져오기 using ajax
	public String loadSavedRouteByDay(
			@RequestParam int day,
			@RequestParam int workNum,
			Model model
			) {
		Map<String,Object> map = new HashMap<>();
		map.put("day", day);
		map.put("workCode", workNum);
		List<Landmark> list = travelService.landListByDay(map);
		
		if(day==0) {
			model.addAttribute("day", "all");
		}
		model.addAttribute("isSaved", true);
		model.addAttribute("list", list);
		return "travel/myplan/landmark/landList";
	}
	
	
	@RequestMapping(value="/travel/myplan/addRouteByDay")
	@ResponseBody
	public Map<String,Object> addRouteByDay(
			@RequestParam int day,
			@RequestParam int workNum,
			@RequestParam List<Integer> landCodes
			) {
		Map<String,Object> map = new HashMap<>();
		//workspaceDetail 먼저 삽입
		//workspacedetailCode 가져오기
		
		
		map.put("day", day);
		map.put("workCode", workNum);
		int isDetailExist = travelService.isDetailExist(map);
		boolean isSuccess = true;
		int seqNum = 0;
		if(isDetailExist!=1) {
			seqNum = travelService.currentWorkDetailSeqNum();
			map.put("seqNum", seqNum);
			travelService.insertWorkDetail(map);
		}else if(isDetailExist==1){
			seqNum = travelService.getDetailCode(map);
			travelService.deleteWorkLand(seqNum);
		}
		//workLand 삽입
		map.clear();
		int result2 = 0;
		map.put("detailCode", seqNum);		
		for(int i=0; i<landCodes.size(); i++) {
			map.put("orderNum", i+1);
			map.put("landCode", landCodes.get(i));
			result2=travelService.insertWorkLand(map);
			if(result2==0) isSuccess=false;
		}
		
		map.clear();
		map.put("isSuccess", isSuccess);
		return map;
	}
	
	@RequestMapping(value="/travel/myplan/myList")
	public String myList(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="all") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="locCode",defaultValue="0") int locCode,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws UnsupportedEncodingException {
		session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int userIdx = info.getUserIdx();
		
		String cp = req.getContextPath();
		String list_url = cp+"/travel/myplan/myList";
		String article_url = cp+"/travel/myArticle?page="+current_page;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		if(searchValue.length()!=0) {
			list_url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			article_url += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("userIdx", userIdx);
		map.put("locCode", locCode);
		int dataCount = travelService.myDataCount(map);
		int rows = 4;
		int total_page = util.pageCount(rows, dataCount);
		if(current_page > total_page) 
			current_page = total_page;
		
		int start = (current_page-1)*rows +1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Workspace> list = travelService.myList(map);
		
		String paging = util.paging(current_page, total_page, list_url);
		
		//작성한 지역과 카운트 가져오기
		List<LocCategory> locCategory = travelService.locationCategory(userIdx);

		model.addAttribute("locCategory", locCategory);
		model.addAttribute("list", list);
		model.addAttribute("list_url", list_url);
		model.addAttribute("article_url", article_url);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchKey", searchKey);
		
		return ".travel.myplan.myList";
	}
	
	@RequestMapping(value="/travel/plan/view")
	public String view(
			@RequestParam int locCode,
			@RequestParam int workNum,
			@RequestParam int dayCount,
			@RequestParam int userIdx,
			@RequestParam(value="day",defaultValue="1") int day,
			Model model,
			HttpServletRequest req,
			HttpSession session
			) {
		Map<String,Object> map = new HashMap<>();
		map.put("userIdx", userIdx);
		map.put("workCode", workNum);
		map.put("day", day);
		
		int dataCount = travelService.countWorkDetail(map);
		System.out.println("VIews-dataCount : "+dataCount);
		if(day>dataCount) {
			day = dataCount;
		}
		String list_url = req.getContextPath()+"/travel/plan/view?locCode="+locCode+"&workNum="+workNum+"&dayCount="+dayCount+"&userIdx="+userIdx+"&";
		
		//페이징 처리
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock=10;
		int currentPageSetup;
		int n, page;
		
		currentPageSetup=(day/numPerBlock)*numPerBlock;
		if(day%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		n=day-numPerBlock;
		sb.append("<ul class='pagination'>");
		
		if(dataCount > numPerBlock && currentPageSetup > 0) {
			sb.append("<li class='page-item'>");
			sb.append("<a href='"+list_url+"day=1' class=\"page-link\"><i class=\"fa fa-angle-double-left\"></a>");
			sb.append("</li>");
			sb.append("<li class='page-item'>");
			sb.append("<a href='"+list_url+"day="+n+"' class=\"page-link\"><i class=\"fa fa-angle-left\"></i></a>");
			sb.append("</li>");
		}
		
		// 바로가기
		page=currentPageSetup+1;
		while(page<=dataCount && page <=(currentPageSetup+numPerBlock)) {
			if(page==day) {
				/*sb.append("<span class='curBox'>"+page+"</span>");*/
				sb.append("<li class='page-item'>");
				sb.append("<a href='#' class=\"page-link active\">"+page+"</a>");
				sb.append("</li>");
			} else {
				/*sb.append("<a href='"+list_url+"page="+page+"' class='numBox'>"+page+"</a>");*/
				sb.append("<li class='page-item'>");
				sb.append("<a href='"+list_url+"day="+page+"' class=\"page-link\">"+page+"</a>");
				sb.append("</li>");
			}
			page++;
		}
		
		n=day+numPerBlock;
		if(n>dataCount) n=dataCount;
		if(dataCount-currentPageSetup>numPerBlock) {
			
			sb.append("<li class='page-item'>");
			sb.append("<a href='"+list_url+"day=1' class=\"page-link\"><i class=\"fa fa-angle-right\"></a>");
			sb.append("</li>");
			sb.append("<li class='page-item'>");
			sb.append("<a href='"+list_url+"day="+n+"' class=\"page-link\"><i class=\"fa fa-angle-double-right\"></i></a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String,Object> checkMap = new HashMap<>();
		checkMap.put("userIdx", info.getUserIdx());
		checkMap.put("workCode", workNum);
		
		
		
		Workspace workspace = travelService.readWorkspace(map);
		
		int isPaid = travelService.isPaid(checkMap);
		boolean isPaidFlag = true;
		//유료 경로 이면서 경로 제작자가 아니고 경로를 구매하지 않았으면
		System.out.println("니니니니니니니니니니니니니니 : "+workspace.getPay()+"/"+info.getUserIdx()+"/"+isPaid);
		if(workspace.getPay()==1&&info.getUserIdx()!=userIdx&&isPaid==0){
			isPaidFlag = false;
		}
		List<WorkLand> list = travelService.readWorkLand(map);
		
		
		model.addAttribute("isPaid", isPaidFlag);
		model.addAttribute("workspace", workspace);
		model.addAttribute("list", list);
		model.addAttribute("day", day);
		model.addAttribute("paging", sb.toString());
	
		return ".travel.plan.view";
	}
	
	@RequestMapping(value="/travel/plan/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="all") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="locCode",defaultValue="0") int locCode,
			@RequestParam(value="routeSort",defaultValue="2") int routeSort,
			HttpServletRequest req,
			Model model
		) throws UnsupportedEncodingException {
	String cp = req.getContextPath();
	String list_url = cp+"/travel/myplan/myList";
	String article_url = cp+"/travel/myArticle?page="+current_page;
	
	if(req.getMethod().equalsIgnoreCase("GET")) {
		searchValue = URLDecoder.decode(searchValue, "utf-8");
	}
	
	if(searchValue.length()!=0) {
		list_url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		article_url += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
	}
	
	Map<String,Object> map = new HashMap<>();
	map.put("searchKey", searchKey);
	map.put("searchValue", searchValue);
	map.put("locCode", locCode);
	map.put("routeSort", routeSort);
	
	int dataCount = travelService.dataCount(map);
	int rows = 12;
	int total_page = util.pageCount(rows, dataCount);
	if(current_page > total_page) 
		current_page = total_page;
	
	int start = (current_page-1)*rows +1;
	int end = current_page * rows;
	map.put("start", start);
	map.put("end", end);
	
	List<Workspace> list = travelService.list(map);
	
	String paging = util.paging(current_page, total_page, list_url);
	
	//작성한 지역과 카운트 가져오기
	List<LocCategory> locCategory = travelService.locationCategory(map);

	model.addAttribute("locCategory", locCategory);
	model.addAttribute("list", list);
	model.addAttribute("list_url", list_url);
	model.addAttribute("article_url", article_url);
	model.addAttribute("dataCount", dataCount);
	model.addAttribute("total_page", total_page);
	model.addAttribute("page", current_page);
	model.addAttribute("paging", paging);
	model.addAttribute("searchValue", searchValue);
	model.addAttribute("searchKey", searchKey);
	model.addAttribute("locCode", locCode);
	model.addAttribute("routeSort",routeSort);
	return ".travel.plan.list";
	}
	
	@RequestMapping(value="/travel/plan/updateWorkLandDetail",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateWorkLandDetail(
			WorkLand workland
		) {
		Map<String,Object> map = new HashMap<>();
		
		travelService.updateWorkLandDetail(workland);
		WorkLand dto = travelService.selectWorkLandBM(workland.getWorkLandCode());				
		map.put("budget", dto.getBudget());
		map.put("memo", dto.getMemo());
		
		return map;
	}

	@RequestMapping(value="/travel/plan/updateBudgetByDay",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateBudgetByDay(
			@RequestParam int workCode,
			@RequestParam int day,
			@RequestParam int budget
		) {
		Map<String,Object> map = new HashMap<>();
		map.put("workCode", workCode);
		map.put("day", day);
		map.put("budget", budget);
		travelService.updateBudgetByDay(map);
		int sum = travelService.selectTotBudget(workCode);
		map.clear();
		map.put("sum", sum);
		return map;
	}
	

	
	@PostMapping("/travel/plan/confirm")
	@ResponseBody
	public Map<String,Object> confirm(
			@RequestParam int workCode,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String,Object> map = new HashMap<>();
		
		map.put("workCode", workCode);
		map.put("userIdx", info.getUserIdx());
		
		travelService.payRoute(map);
		
		return map;
	}
	
	
	@GetMapping("/travel/event/list")
	public String eventList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/travel/event/list";
		String articleUrl = cp+"/travel/event/article"; 
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		if(!searchValue.equals("")) {	
			url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			articleUrl +="?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		//사전 준비
		int rows = 10;
		int articleCount = eventService.articleCount(map);
		int total_page = util.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Event> list =  eventService.eventList(map);
		
		//리스트 번호 만들기

		Calendar cal = Calendar.getInstance();
		Calendar now = Calendar.getInstance();
		now.set(Calendar.HOUR, 23);
		now.set(Calendar.MINUTE,59);
		now.set(Calendar.SECOND, 59);
		
		
		int n =0;
		for(Event event : list) {
			event.setListNum(articleCount-((current_page-1)*rows +n));
			event.setCreated(event.getCreated().substring(0, 11));
			cal.set(Integer.parseInt(event.getCreated().substring(0, 4)), Integer.parseInt(event.getCreated().substring(5, 7)), Integer.parseInt(event.getCreated().substring(8, 9)));
			System.out.println("eventName : "+event.getEventCode()+" now : "+now.getTimeInMillis()+" input : "+cal.getTimeInMillis());
			if(now.getTimeInMillis()-cal.getTimeInMillis()<=0) {
				event.setIsNew(true);
			}else {
				event.setIsNew(false);
			}
			n++;
		}
		
		String paging = util.paging(current_page, total_page, url);
		
		model.addAttribute("page", current_page);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", URLEncoder.encode(searchValue, "utf-8"));
		model.addAttribute("url", url);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return	".travel.event.list";
	}
	
	
	@GetMapping("/travel/event/article")
	public String eventArticle(
			@RequestParam(value="code") int eventCode,
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			Model model
			){
		try {
			Event event = eventService.eventArticle(eventCode);
			event.setFiles(eventService.eventFiles(eventCode));
			eventService.updateHitCount(eventCode);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			event.setStartDate(event.getStartDate().substring(0, 10));
			event.setEndDate(event.getEndDate().substring(0, 10));
			
			model.addAttribute("event", event);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/travel/event/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}

		return ".travel.event.article";
	}
	
	@PostMapping("/travel/event/insertReply")
	@ResponseBody
	public void insertReply(
				EventReply reply,
				HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		reply.setUserIdx(info.getUserIdx());
		eventService.insertReply(reply);
	}
	
	@GetMapping("/travel/event/replyList")
	public String replyList(
			@RequestParam int eventCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model
			) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int rows = 5;
		int dataCount = eventService.replyCount(eventCode);
		int total_page = util.pageCount(rows, dataCount);
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("eventCode", eventCode);
		map.put("start", start);
		map.put("end", end);
	
		List<EventReply> list = eventService.eventReplys(map);
		String methodName = "replyList";
		String paging = util.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "travel/event/replyList";
	}
	
	@PostMapping("/travel/event/deleteReply")
	@ResponseBody
	public Map<String,Object> deleteReply(
			EventReply reply,
			HttpSession session
			){		
		Map<String,Object> map = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(reply.getUserIdx() != info.getUserIdx()) {
			map.put("isDeleted", false);
			return map;
		}
		eventService.deleteReply(reply);
		map.put("isDeleted", true);
		return map;
	}
	

	@GetMapping("/travel/notice/list")
	public String noticeList(
			@RequestParam(defaultValue="1", value="page") int current_page,
			@RequestParam(defaultValue="", value="searchKey") String searchKey,
			@RequestParam(defaultValue="", value="searchValue") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		Map<String,Object> map = new HashMap<>();
		String cp = req.getContextPath();
		String url = cp+"/travel/notice/list";
		String articleUrl = cp+"/travel/notice/article"; 
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		if(!searchValue.equals("")) {	
			url += "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			articleUrl +="?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		//사전 준비
		int rows = 10;
		int articleCount = noticeService.noticeCount(map);
		int total_page = util.pageCount(rows, articleCount);
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list =  noticeService.list(map);
		
		//리스트 번호 만들기
		int n =0;
		for(Notice notice : list) {
			notice.setListNum(articleCount-((current_page-1)*rows +n));
			notice.setCreated(notice.getCreated().substring(0, 11));
			n++;
		}
		
		String paging = util.paging(current_page, total_page, url);
		
		model.addAttribute("page", current_page);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", URLEncoder.encode(searchValue, "utf-8"));
		model.addAttribute("url", url);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);	
		return	".travel.notice.list";
	}
	
	@GetMapping("/travel/notice/article")
	public String readNotice(
				@RequestParam int notiCode,
				@RequestParam(defaultValue="", value="searchKey") String searchKey,
				@RequestParam(defaultValue="", value="searchValue") String searchValue,
				@RequestParam(defaultValue="1", value="page") int current_page,
				Model model
			) {
		try {
			Notice notice = noticeService.readNotice(notiCode);
			notice.setFiles(noticeService.readFiles(notiCode));
			
			
			noticeService.updateHitCount(notiCode);
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			String query = "page="+current_page+"&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			
			model.addAttribute("notice", notice);
			model.addAttribute("query", query);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/travel/notice/list?page="+current_page+"&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		return ".travel.notice.article";
	}
	
	
}
