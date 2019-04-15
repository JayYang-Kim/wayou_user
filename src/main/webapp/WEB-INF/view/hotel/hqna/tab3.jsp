<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<table style="width: 100%; margin: 20px 0 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          몇개 (페이지번호/총페이지) 페이지
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">작성일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		      <th width="50" style="color: #787878;">첨부</th>
		  </tr>
		  </table>
		  <table style="width: 100%;" >
		  	<tr align="center" bgcolor="#ffffff" height="35"> 
		      <td>${dto.listNum }</td>
		      <td align="center" style="padding-left: 10px;">
		           <a href="javascript:articleBoard('${dto.num }')">${dto.subject}</a>
		      </td>
		      <td>${dto.userName }</td>
		      <td>${dto.created }</td>
		      <td>${dto.hitCount }</td>
		      <td>
		      <c:if test="${not empty dto.saveFilename }">
		      	<a href="#"><img src="<%=cp%>/resource/images/disk.gif"></a>
		      </c:if>
		      </td>
		  </tr>
		  </table>
		  <table style="width: 100%; border-spacing: 0px;">
		   <tr height="35" style="width: 60%;">
			<td align="center">
		        ${dadtaCount==0?"등록된 자료가 없습니다.": paging }
			</td>
		   </tr>
		</table>
<table style="width: 100%; margin: 10px 0; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="reloadBoard();">새로고침</button>
		      </td>
		      <td align="center">
		              <select name="key" id="key" class="selectField">
		              	  <option value="all"      ${condition=="all"?"selected='selected'":"" }>모두</option>
		                  <option value="subject"  ${condition=="subject"?"selected='selected'":"" }>제목</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":"" }>작성자</option>
		                  <option value="content"  ${condition=="content"?"selected='selected'":"" }>내용</option>
		                  <option value="created"  ${condition=="created"?"selected='selected'":"" }>등록일</option>
		            </select>
		            <input type="text" name="value"  id="value" value="${value}" class="boxTF" >
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/hotel/hqna/created';">글올리기</button>
		      </td>
		   </tr>
		</table>