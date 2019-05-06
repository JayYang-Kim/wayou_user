<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
	$(function(){
		listPartyNew();
	});

	function sendSearch() {
		var f = document.search_form;
		f.submit();
	}
	
	function listPartyNew() {
		var url="<%=cp%>/travel/partyNew";
		var query = "page=${page}";
	
		var searchValue = "${searchValue}";
		if(searchValue != "") {
			query += "&searchKey=${searchKey}&searchValue=${searchValue}"; 
		}
		
		$.ajax({
			type:"get"
			,url:url
			,data:query
			,success:function(data) {
				$("#listPartyNew").html(data);
			}
		    ,beforeSend:function(e) {
		    	e.setRequestHeader("AJAX", true);
		    }
		    ,error:function(e) {
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
		    	console.log(e.responseText);
		    }
		});
		
	}
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                    <h2 class="page-title">여행 동료 모으기</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
    	<form name="search_form" action="<%=cp%>/travel/party" method="post">
	    	<div class="row justify-content-center box_search mb40">
		            <div class="col-12 col-sm-3 col-lg-2">
		            	<select name="searchKey">
		            		<option value="all" ${searchKey == 'all' ? "selected='selected'" : ""}>제목 + 내용</option>
		            		<option value="subject" ${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
		            		<option value="content" ${searchKey == 'content' ? "selected='selected'" : ""}>내용</option>
		            		<option value="startDate" ${searchKey == 'startDate' ? "selected='selected'" : ""}>시작일</option>
		            		<option value="endDate" ${searchKey == 'endDate' ? "selected='selected'" : ""}>종료일</option>
		            		<option value="userCount" ${searchKey == 'userCount' ? "selected='selected'" : ""}>인원수</option>
		            	</select>
		            </div>
		            <div class="col-12 col-sm-9 col-lg-8">
		            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요."/>
		            </div>
		            <div class="col-12 col-lg-2">
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
		            </div>
			</div>
		</form>
        <div class="row justify-content-center">
            <div class="col-12">
            	<c:forEach var="dto" items="${list}">
	                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
	                    <!-- Post Content -->
	                    <div class="post-content party_list">
	                        <!-- Post Meta -->
	                        <div class="post-meta">
	                            <span class="">파티장 : ${dto.userId}</span>
	                            <span class="pl10 pr10">/</span>
	                            <span class="">작성일 : ${dto.created}</span>
	                        </div>
	                        <!-- Post Title -->
	                        <a href="${articleUrl}&partyCode=${dto.partyCode}" class="post-title">${dto.subject}</a>
	                        <p>${dto.content}</p>
	                        <div class="post-meta">	                           	
	                           	<span class="pr10">모집일 :</span><span>${dto.startDate}</span> - <span>${dto.endDate}</span>
	                        </div>
	                        <a href="${articleUrl}&partyCode=${dto.partyCode}" data-partyCode="${dto.partyCode}" class="btn continue-btn">상세보기</a>
	                    </div>
	                </div>
                </c:forEach>
                
                <c:if test="${empty list}">
                	<div class="t_center mt40 mb40">
                		<span class="f14 exbold">등록된 파티가 없습니다.</span>
                	</div>
                </c:if>
            
                <!-- Sample -->
                <%-- <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Content -->
                    <div class="post-content party_list">
                        <!-- Post Meta -->
                        <div class="post-meta">
                            <a href="<%=cp%>/travel/party/view" class="post-author">Jan 02, 2019</a>
                            <a href="<%=cp%>/travel/party/view" class="post-tutorial">Event</a>
                        </div>
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/party/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                        <a href="<%=cp%>/travel/party/view" class="btn continue-btn">상세보기</a>
                    </div>
                </div> --%>
                
                <c:if test="${not empty sessionScope.member}">
	                <div>
	                	<div class="col-12 text-right">
		                    <a href="<%=cp%>/travel/party/create" class="btn roberto-btn mb-50">파티 생성</a>
		                </div>
	                </div>
                </c:if>

                <!-- Pagination -->
                <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="600ms">
                	${paging}
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->