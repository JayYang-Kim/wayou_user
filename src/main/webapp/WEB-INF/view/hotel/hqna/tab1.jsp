<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount }개 (${page}/${total_page }) 페이지
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">작성일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		  </tr>
<c:forEach var="hqna" items="${list}">	 
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${hqna.listNum }</td>
		      <td align="left" style="padding-left: 10px;">
		               <a href="">${hqna.subject }</a>
		      </td>
		      <td>${sessionScope.member.userName }</td>
		      <td>${hqna.created }</td>
		      <td>${hqna.hitCount }</td>
		  </tr>
</c:forEach>	
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        ${dadtaCount==0?"등록된 자료가 없습니다.": paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="reloadHqna();">새로고침</button>
		      </td>
		      <td align="center">
		              <select name="key" id="key" class="selectField">
		              	  <option value="all"      ${key=="all"?"selected='selected'":"" }>모두</option>
		                  <option value="subject"  ${key=="subject"?"selected='selected'":"" }>제목</option>
		                  <option value="userName" ${key=="userName"?"selected='selected'":"" }>작성자</option>
		                  <option value="content"  ${key=="content"?"selected='selected'":"" }>내용</option>
		                  <option value="created"  ${key=="created"?"selected='selected'":"" }>등록일</option>
		            </select>
		            <input type="text" name="value"  id="value" value="${value}" class="boxTF" >
		            <button type="button" class="btn" onclick="serchList()">검색</button>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/hotel/hqna/created';">글올리기</button>
		      </td>
		   </tr>
		</table>