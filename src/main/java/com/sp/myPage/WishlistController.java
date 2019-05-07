package com.sp.myPage;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller(value="myP.wishlistController")
public class WishlistController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private WishlistService wish;
	
   @RequestMapping(value="/myPage/wishlist/list")
   @ResponseBody
   public Map<String, Object> listWish(
		   HttpSession session
		   ){
      SessionInfo info = (SessionInfo)session.getAttribute("member");
      int userIdx=info.getUserIdx();
	   
      int dataCount=0;
      int dataCount1=0;
      int dataCount2=0;
      int dataCount3=0;
      
      try {
         dataCount1=wish.dataCount1(userIdx);
         dataCount2=wish.dataCount2(userIdx);
         dataCount3=wish.dataCount3(userIdx);   
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      dataCount=dataCount1+dataCount2+dataCount3;
      int listNum=0;
      int n=1;
      
      Map<String, Object> map = new HashMap<>();
      map.put("userIdx", userIdx);
      
      Map<String, Object> model=new HashMap<>();
      try {
         List<Wishlist> list1 = wish.list1Wish(map);
         List<Wishlist> list2 = wish.list2Wish(map);
         List<Wishlist> list3 = wish.list3Wish(map);
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
            
            model.put("dataCount", dataCount);
            model.put("list1", list1);
            model.put("list2", list2);
            model.put("list3", list3);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return model;
   }

}
