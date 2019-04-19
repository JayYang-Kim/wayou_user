package com.sp.travel;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("travel.travelController")
public class TravelController {
	
	@Autowired
	private TravelService travelService;
	
	@RequestMapping(value="/travel/myplan/add") //일정 만들기 초기화면 호출
	public String workSpace() {
		return ".travel.myplan.add"; //view단의 add.jsp를 호출 //tiles 형태로 리턴
	}
	
	@RequestMapping(value="/travel/myplan/locList") //지역 리스트 호출 Using ajax
	public String locList(@RequestParam String name,Model model) throws UnsupportedEncodingException {
		name = URLDecoder.decode(name, "utf-8");
		List<Location> list = travelService.locList(name);
		model.addAttribute("list", list);
		return "travel/myplan/location/locList"; //일반형태로 리턴
	}
	
	
	@RequestMapping(value="/travel/myplan/basicInfo") //지역 정보 호출  Using ajax
	public String basicInfo(@RequestParam int locCode,Model model) throws UnsupportedEncodingException {
		Location dto = travelService.getLocation(locCode);
		model.addAttribute("dto", dto);
		return "travel/myplan/location/basicInfo";
	}
	
	
	@RequestMapping(value="/travel/myplan/workspace", method=RequestMethod.GET)
	public String workspace(
			@RequestParam int locCode,
			@RequestParam int workNum,
			@RequestParam int dayCount,
			@RequestParam String lat,
			@RequestParam String lng,
			HttpSession session,
			Model model
			) {
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
		HttpSession session,
		Model model
	) {
		Map<String,Object> map = new HashMap<>(); //넘어온 파라미터에서 데이터 넘기기
		map.put("locCode", locCode);
		map.put("title", title);
		map.put("startDay", startDay);
		map.put("endDay", endDay);

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
		System.out.println("==================="+seqNum+","+locCode+","+lat+","+lng+","+diff/1000/60/60/24+","+isInserted);
		map.clear();
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
		System.out.println("isDetailExist:"+isDetailExist);
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
			System.out.println(map);
		}
		
		map.clear();
		map.put("isSuccess", isSuccess);
		return map;
	}
	
	@RequestMapping(value="/travel/myplan/list")
	public String myList() {
		return ".travel.myplan.list";
	}
	
	
	
}