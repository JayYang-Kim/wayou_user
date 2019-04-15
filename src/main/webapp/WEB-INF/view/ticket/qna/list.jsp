<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

//문의사항 답변
$(function(){
	$(".qnaSubject").on("click", function(){
		var qnaCode = $(this).attr("data-Num");
		$(".qnaArticle").show();
		articleAnswer(qnaCode);
	});
});

function articleAnswer(qnaCode) {
	var url="<%=cp%>/ticket/qna/article";
	
	$.ajax({
		type:"get"
		,url:url
		,data:{qnaCode:qnaCode}
		,success:function(data) {
			$("#qnaArticle")
		}
	});
}

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
		
		<table class=tb_basic_w>
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th width="70" style="color: #787878;">답변상태</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="120" style="color: #787878;">작성일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		      
		  </tr>
<c:forEach var="dto" items="${list}">		 
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum}</td>
		      <td align="left" style="padding-left: 10px;">
		      	${dto.answerCount == 0 ? '대기' : '답변완료'}
		      </td>
		      <td class="qnaSubject" data-Num='${dto.qnaCode}'>${dto.subject}</td>
		      <td>${dto.userName}</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitCount}</td>
		  </tr>
		  <div id="qnaArticle"></div>
		 
</c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        ${dataCount==0 ? "등록된 자료가 없습니다." : paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/ticket/qna/list';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="<%=cp%>/ticket/qna/list" method="post">
		              <select name="searchKey" class="selectField">
		                  <option value="all" ${searchKey=="all" ? "selected='selected' " : "" }>모두</option>
		                  <option value="subject"  ${searchKey=="subject" ? "selected='selected' " : "" }>제목</option>
		                  <option value="userName" ${searchKey=="userName" ? "selected='selected' " : "" }>작성자</option>
		                  <option value="content"  ${searchKey=="content" ? "selected='selected' " : "" }>내용</option>
		                  <option value="created"  ${searchKey=="created" ? "selected='selected' " : "" }>등록일</option>
		            </select>
		            <input type="text" name="searchValue" class="boxTF" value="${searchValue}">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/ticket/qna/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>

     
			</div>

          </div>
      
  <!-- Rooms Area End -->
	

	
	