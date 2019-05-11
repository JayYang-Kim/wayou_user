<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<c:forEach var="list" items="${list}">
	<div class="single-recent-post d-flex">
	    <!-- Thumb -->
	    <div class="post-thumb">
	    	<c:if test="${not empty list.saveFilename}">
	        	<a href="single-blog.html"><img src="/wadmin/uploads/location/${list.saveFilename}" alt=""></a>
	        </c:if>
	        <c:if test="${empty list.saveFilename}">
	        	<a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/29.jpg" alt=""></a>
	        </c:if>
	    </div>
	    <!-- Content -->
	    <div class="post-content">
	        <!-- Post Meta -->
	        <div class="post-meta">
	            <a href="#" class="post-author">${list.locName}</a>
	            <a href="#" class="post-tutorial">${list.loceName}</a>
	        </div>
	        <a href="single-blog.html" class="recommendList_memo post-title">${list.memo}</a>
	    </div>
	</div>
</c:forEach>