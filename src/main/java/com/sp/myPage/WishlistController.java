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
   public String listWish() {
      
      return ".myP.myPage.wishlist.list";
   }
   @RequestMapping(value="/myPage/wishlist/list2")
   @ResponseBody
   public Map<String, Object> listWish(
         HttpSession session
         )throws Exception{
      SessionInfo info = (SessionInfo)session.getAttribute("member");
      int userIdx=info.getUserIdx();
   
      int dataCount=0;
      int dataCount1=0;
      int dataCount2=0;

      dataCount1=wish.dataCount1(userIdx);
      dataCount2=wish.dataCount2(userIdx);

  
      dataCount=dataCount1+dataCount2;
      int listNum=0;
      int n=1;
  
      Map<String, Object> map = new HashMap<>();
      map.put("userIdx", userIdx);
  

      List<Wishlist> listdh = wish.listdhWish(map);
      List<Wishlist> listdt = wish.listdtWish(map);
         
      for(Wishlist dto : listdh) {
            dto.setPrice1(NumberFormat.getInstance().format(dto.getPrice()));
            dto.setAmount1(NumberFormat.getInstance().format(dto.getAmount()));
            dto.setTotalprice1(NumberFormat.getInstance().format(dto.getAmount()*dto.getPrice()));
            listNum=n;
            n++;
            dto.setListNum(listNum);
      }
     
      for(Wishlist dto : listdt) {
         dto.setPrice1(NumberFormat.getInstance().format(dto.getPrice()));
         dto.setAmount1(NumberFormat.getInstance().format(dto.getAmount()));
         dto.setTotalprice1(NumberFormat.getInstance().format(dto.getAmount()*dto.getPrice()));
         listNum=n;
         n++;         
         dto.setListNum(listNum);
      }
     
      Map<String, Object> model=new HashMap<>();
      
      model.put("dataCount", dataCount);
      model.put("listdh", listdh);
      model.put("listdt", listdt);

      return model;
   }
   
   @RequestMapping(value="/myPage/wishlist/delete")
   @ResponseBody
   public Map<String, Object> deleteWish (
		   @RequestParam int dataType,
		   @RequestParam int wishCode
		  )throws Exception{
	   int result=0;
	   if(dataType==1) {
		   wish.deleteWishdh(wishCode);
		   result=1;
	   }else if(dataType==2) {
		   wish.deleteWishdt(wishCode);
		   result=1;
	   }
	   Map<String, Object> model = new HashMap<>();
	   if(result==1) {
		   model.put("status", "삭제 완료");
	   }
	   return model;
   }
   
   @RequestMapping(value="/myPage/wishlist/update")
   @ResponseBody
   public Map<String, Object> updateWish (
		   @RequestParam int dataType,
		   @RequestParam int wishCode,
		   @RequestParam int amount
		  )throws Exception{
	   Map<String, Object> map = new HashMap<>();
	   map.put("wishCode", wishCode);
	   System.out.println(dataType);
	   int result=0;
	   if(dataType==1) {
		   map.put("amount", amount);
		   wish.updateWishdh(map);
		   result=1;
	   }else if(dataType==2) {
		   map.put("amount", amount);
		   wish.updateWishdt(map);
		   result=1;
	   }
	   Map<String, Object> model = new HashMap<>();
	   if(result==1) {
		   model.put("status", "수정 완료");
	   }
	   return model;
   }

}