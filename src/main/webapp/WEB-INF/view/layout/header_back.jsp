﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
	String uri = request.getRequestURI();
%>

	<header>
	    <div class="header">
    		<% if(uri.indexOf("login.jsp") != -1) { %>
	    		<h1 class="title">
		            <a href="<%=cp%>/main">WAYOU | 로그인</a>
		        </h1>
	    	<% } else if(uri.indexOf("join.jsp") != -1) { %>
	    		<h1 class="title">
		            <a href="<%=cp%>/main">WAYOU | 회원가입</a>
		        </h1>
	    	<% } else {%>
	    		<h1 class="title">
		            <a href="<%=cp%>/main">WAYOU</a>
		        </h1>
		        <%-- gnb : 회사 --%>
		        <%-- <div class="gnb">
		            <ul>
		                <li><a href="#">회사검색</a></li>
		                <li><a href="#">지원확인</a></li>
		                <li><a href="#">피드백 게시판</a></li>
		                <li><a href="#">자유게시판</a></li>
		                <li><a href="#">사람잇과 소통</a></li>
		            </ul>
		        </div> --%>
		        <%-- //gnb --%>
		        <%-- gnb : 유저 --%>
		        <div class="gnb">
		            <ul>
		                <li><a href="<%=cp%>/companies/list.do">일정 만들기</a></li>
		                <li><a href="<%=cp%>/companies/listReview.do">쇼핑몰</a></li>
		                <li><a href="<%=cp%>/board/list.do">피드백 게시판</a></li>
		                <li><a href="<%=cp%>/pass_board/list.do">합격자소서</a></li>
		                <li><a href="<%=cp%>/board/free/list.do">자유게시판</a></li>
		                <li><a href="<%=cp%>/resume/list.do">이력서 관리</a></li>
		            </ul>
		        </div>
		        <%-- //gnb --%>
	    	<% } %>
	        <%-- 회원 : 비로그인 --%>
	        <c:if test="${sessionScope.member == null}">
	        <div class="userInfo">
	            <ul>
	                <li><a href="<%=cp%>/member/login.do">로그인</a></li>
	                <li><span>|</span></li>
	                <li><a href="<%=cp%>/member/join.do">회원가입</a></li>
	            </ul>
	        </div>
	        </c:if>
	        <%-- //회원 --%>
	        <%-- 회원 : 로그인 --%>
	        <c:if test="${sessionScope.member != null}">
				<div class="userInfo_login">
				    <ul>
				        <li><span>${sessionScope.member.userName}</span></li>
				        <li><span>|</span></li>
				        <li><a href="<%=cp%>/member/myPage.do">마이페이지</a></li>
				        <li><span>|</span></li>
				        <li><a href="<%=cp%>/member/logout.do">로그아웃</a></li>
				    </ul>
				</div> 
	        </c:if>
	        <%-- 회원 : 로그인 --%>
	    </div>
	</header>