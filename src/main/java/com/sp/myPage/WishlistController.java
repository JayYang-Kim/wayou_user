package com.sp.myPage;

import java.text.NumberFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller(value="myP.wishlistController")
public class WishlistController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private WishlistService wish;
	
	@RequestMapping(value="/myPage/wishlist/list")
	public String listWish(
		@RequestParam (value="page", defaultValue="1") int current_page,
		HttpServletRequest req,
		HttpSession session,
		Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int userIdx=info.getUserIdx();
		
		int rows=10;
		int dataCount=0;
		int dataCount1=0;
		int dataCount2=0;
		int dataCount3=0;
		int total_page=0;
		
		dataCount1=wish.dataCount1(userIdx);
		dataCount2=wish.dataCount1(userIdx);
		dataCount3=wish.dataCount1(userIdx);
		
		dataCount=dataCount1+dataCount2+dataCount3;
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int listNum=0;
		int n=1;
		List<Wishlist> list1 = wish.list1Wish(userIdx);
		List<Wishlist> list2 = wish.list1Wish(userIdx);
		List<Wishlist> list3 = wish.list1Wish(userIdx);
	
		
		for(Wishlist dto : list1) {
			dto.setPrice1(NumberFormat.getInstance().format(dto.getPrice()));
			dto.setTotalprice(dto.getAmount()*dto.getPrice());
			listNum=n;
			n++;
			dto.setListNum(listNum);
		}
		
		for(Wishlist dto : list2) {
			dto.setPrice1(NumberFormat.getInstance().format(dto.getPrice()));
			dto.setTotalprice(dto.getAmount()*dto.getPrice());
			listNum=n;
			n++;			
			dto.setListNum(listNum);
		}
		
		for(Wishlist dto : list3) {
			dto.setPrice1(NumberFormat.getInstance().format(dto.getPrice()));
			dto.setTotalprice(dto.getAmount()*dto.getPrice());
			listNum=n;
			n++;			
			dto.setListNum(listNum);
		}
		String cp = req.getContextPath();
		
		String paging=myUtil.paging(current_page, total_page);
		
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		
		
		return ".myPage.wishlist.list";
	}
	
}
