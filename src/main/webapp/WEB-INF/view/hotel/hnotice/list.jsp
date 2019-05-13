<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-center">
					<h2 class="page-title">공지사항</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<form name="search_form" method="post">
			<div class="row justify-content-center box_search mb40">
				<div class="col-12 col-sm-3 col-lg-2">
					<select name="searchKey">
						<option value="all"
							${searchKey == 'all' ? "selected='selected'" : ""}>제목 +
							내용</option>
						<option value="subject"
							${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
						<option value="content"
							${searchKey == 'content' ? "selected='selected'" : ""}>내용</option>
					</select>
				</div>
				<div class="col-12 col-sm-9 col-lg-8">
					<input type="text" name="searchValue" class="form-control" placeholder="검색어를 입력해주세요." />
				</div>
				<div class="col-12 col-lg-2">
					<button type="button" class="btn roberto-btn"
						onclick="sendSearch()">검색</button>
				</div>
			</div>
		</form>
		<div class="row justify-content-center">
			<div class="col-12 col-lg-12">
				<table class=tb style="font-size: 15px;margin-top:20px;"> 
					<tr align="center" bgcolor="#eeeeee" height="40"
						style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
						<th width="60" style="color: #787878;">번호</th>
						<th style="color: #787878;">제목</th>
						<th width="100" style="color: #787878;">작성자</th>
						<th width="120" style="color: #787878;">작성일</th>
						<th width="60" style="color: #787878;">조회수</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr align="center" bgcolor="#ffffff" height="40"
							style="border-bottom: 1px solid #cccccc;">
							<td>${dto.listNum}</td>
							<td style="cursor: pointer;"><a href="<%=cp%>/hotel/hnotice/article?noticeNum=${dto.noticeNum}">${dto.subject}</a></td>
							<td>${dto.adminName}</td>
							<td>${dto.created}</td>
							<td>${dto.hitCount}</td>
						</tr>
					</c:forEach>
				</table> 

				<c:if test="${empty list}">
					<div class="t_center mt40 mb40">
						<span class="f14 exbold">등록된 공지사항이 없습니다.</span>
					</div>
				</c:if>

				<!-- Pagination -->
				<nav class="roberto-pagination mb-100" style="margin-top:20px; text-align: center;">${paging}</nav>
			</div>
		</div>
	</div>
</div> 
<script>
	function sendSearch(){
		if(!$("input[name=searchValue]").val()){
			location.href="<%=cp%>/hotel/hnotice/list";
			return false;
		}
		var searchKey = $("select[name=searchKey]").val();
		var searchValue=$("input[name=searchValue]").val();
		$("input[name=searchValue]").val("");
		location.href="<%=cp%>/hotel/hnotice/list?searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
	}
</script>