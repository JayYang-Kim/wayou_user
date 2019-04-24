<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

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
			     ${dto.content}
			   </td>
			</tr>

						

			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 : 
			       <c:if test="${not empty preHqnadto }">
			       	<a href="javascript:articleHqna('${preHqnadto.qnaCode}')">${preHqnadto.subject }</a>
			       </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			       <c:if test="${not empty nextHqnadto }">
			       	<a href="javascript:articleHqna('${nextHqnadto.qnaCode}')">${nextHqnadto.subject }</a>
			       </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			    
			          <button type="button" class="btn" onclick="updateHqna('${dto.qnaCode}');">수정</button>
			 
			
			          <button type="button" class="btn" onclick="deleteHqna('${dto.qnaCode}');">삭제</button>
			   
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="listPage(pageNo)">리스트</button>
			    </td>
			</tr>
			</table>
    </div>  
    <!-- 관리자 답변  -->
            <div>
            <table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
            <tr height='30'> 
	            <td align='left'>
	            	<span style='font-weight: bold;' >관리자 답변입니다.</span>
	            </td>
            </tr>
            </table>
            
            <div id="listReply">
            <table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
				<tbody id='listReply'>
					<c:forEach var="vo" items="${listReply }">
						    <tr height='35' style='background: #eeeeee;'>
						       <td width='100%' style='padding:5px 5px; border:1px solid #cccccc;'>
						          ${vo.answerContent }      
						        </td>
						    </tr>
						    <tr height='35'>
						     	<td width='100%' style='padding:5px 5px;' align="right">
						    		  <span>${vo.answerCreated }</span>   
						        </td>  
						    </tr>
					</c:forEach>
			</tbody>
			</table>
            
           </div>
        </div> 
</div>