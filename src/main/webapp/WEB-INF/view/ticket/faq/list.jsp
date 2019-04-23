<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

//문의사항 답변
$(function(){
	$(".faqArticle").hide();
	
	$(".faqSubject").on("click", function(){
		var tr = $(this).closest("tr").next(".faqArticle");
		var isHidden = $(this).closest("tr").next(".faqArticle").is(":hidden");
		var $this = $(this).closest("tr");
		if(isHidden) {
			var faqNum=$(this).attr("data-Num");
			$(".faqArticle").hide();
			tr.show();
		} else {
			tr.hide();
		}
	});
	
	
});

function searchList() {
	var f = document.searchForm;
	f.submit();
}
</script>

      
  <!-- Rooms Area Start -->
  <div class="roberto-rooms-area section-padding-100-0">
      <div class="container">

<div class="body-container" style="width: 700px; margin-bottom: 200px;">
    <div class="body-title">
        
    </div>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table class=tb style="font-size: 15px;">
		  <tr align="center" bgcolor="#eeeeee" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th> 
		  </tr>
<c:forEach var="dto" items="${list}">		 
		  <tr align="center" bgcolor="#ffffff" height="40" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum}</td>
		      <td class="faqSubject" data-Num='${dto.faqNum}' style="cursor:pointer;">${dto.subject}</td>
		  </tr>
		  <tr class="faqArticle" style="background-color: #F6F6F6">
		  	<td colspan="2" style="text-align: left !important;">
			  	<div style="margin:30px 10px 25px 40px;">
					<div style="margin-bottom: 30px;">
					${dto.content}
					</div>
				</div>
		  	</td>
		  </tr>
</c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
			<td align="center" style="padding-top:10px;">
		        ${dataCount==0 ? "등록된 자료가 없습니다." : paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
		   <tr height="40">
      		<td align="center">
	          <form name="searchForm" action="<%=cp%>/ticket/faq/list" method="post">
		              <select name="searchKey" class="select">
		                  <option value="all" ${searchKey=="all" ? "selected='selected' " : "" }>모두</option>
		                  <option value="subject"  ${searchKey=="subject" ? "selected='selected' " : "" }>제목</option>
		                  <option value="content"  ${searchKey=="content" ? "selected='selected' " : "" }>내용</option>
		            </select>
		            <input type="text" name="searchValue" class="form-control t_center" style="width:200px; height: 30px;" value="${searchValue}">
		            <button type="button" class="btn-black t_center" style="width: 50px; height: 35px; border-radius: 5px;" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
    </div>
</div>
			</div>
          </div>
      
  <!-- Rooms Area End -->
	

	
	