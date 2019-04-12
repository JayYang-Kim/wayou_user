<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	//게시글 지울수있는사람 2명으로 => 관리자와 글쓴이만 할수있게
	
function deleteBoard(num) {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">	
		if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/bbs/delete?num="+num+"&${query}";
		location.href=url;
	}
</c:if>

<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	alert("게시글을 삭제할 수 없습니다.");
</c:if>
}
	
function updateBoard(num) {
<c:if test="${sessionScope.member.userId==dto.userId}">
	var url="<%=cp%>/bbs/update?num="+num+"&page=${page}";
	location.href=url;
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시글을 수정 할 수 없습니다.");
</c:if>
}

</script>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 게시판 </h3>
    </div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject }
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userName }
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created } | 조회 ${dto.hitCount }
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			     ${dto.content }
			   </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="center" style="padding-bottom: 15px;"  height="40">
			   		<button type="button" class="btn btnSendBoardLike"><span style="font-family:Wingdings;">C</span>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount }</span></button>
			   </td>
			</tr>
						
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
			       <c:if test="${not empty dto.saveFilename}"><a href="<%=cp%>/bbs/download?num=${dto.num}">${dto.originalFilename }</a>(<fmt:formatNumber value="${dto.filesize/1024 }" pattern="#,##0.00"/> kb)</c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 : 
			       <c:if test="${not empty preReadDto }">
			       	<a href="<%=cp%>/bbs/article?num=${preReadDto.num}&${query}">${preReadDto.subject }</a>
			       </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			       <c:if test="${not empty nextReadDto }">
			       	<a href="<%=cp%>/bbs/article?num=${nextReadDto.num}&${query}">${nextReadDto.subject }</a>
			       </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			          <button type="button" class="btn" onclick="updateBoard('${dto.num}')">수정</button>
			          <button type="button" class="btn" onclick="deleteBoard('${dto.num}')">삭제</button>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list?${query }';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    
    <!-- 여기에 article.jsp추가 넣기 -->
    
        
        <div>
            <table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
            <tr height='30'> 
	            <td align='left'>
	            	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	            </td>
            </tr>
            <tr>
               <td style='padding:5px 5px 0px;'>
                    <textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
                </td>
            </tr>
            <tr>
               <td align='right'>
                    <button type='button' class='btn btnSendReply' style='padding:10px 20px;' >댓글 등록</button>
                </td>
            </tr>
            </table>
            
            <div id="listReply"></div>
        </div>
    
    
</div>