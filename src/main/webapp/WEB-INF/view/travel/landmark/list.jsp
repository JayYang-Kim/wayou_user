<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	
</script>

<!-- 지역상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5"></div>
            </div>
        </div>
    </div>
</div>
<!-- //지역상세정보(Top) -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
    	<!-- 검색 -->
    	<form name="search_form" action="<%=cp%>/travel/party" method="post">
		   	<div class="row justify-content-center box_search mb40">
		            <div class="col-12 col-sm-3 col-lg-2">
		            	<select name="searchKey">
		            		<option value="all" ${searchKey == 'all' ? "selected='selected'" : ""}>제목 + 내용</option>
		            		<option value="subject" ${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
		            		<option value="content" ${searchKey == 'content' ? "selected='selected'" : ""}>내용</option>
		            		<option value="startDate" ${searchKey == 'startDate' ? "selected='selected'" : ""}>시작일</option>
		            		<option value="endDate" ${searchKey == 'endDate' ? "selected='selected'" : ""}>종료일</option>
		            		<option value="userId" ${searchKey == 'userId' ? "selected='selected'" : ""}>아이디</option>
		            		<option value="userCount" ${searchKey == 'userCount' ? "selected='selected'" : ""}>인원수</option>
		            	</select>
		            </div>
		            <div class="col-12 col-sm-9 col-lg-8">
		            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요."/>
		            </div>
		            <div class="col-12 col-lg-2">
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">새로고침</button>
		            </div>
			</div>
		</form>
		<!-- //검색 -->
        <div class="row justify-content-center">
            <div class="col-12 col-lg-12">
                <!-- Single Blog Post Area -->
                <c:forEach var="list" items="${list}">
	                <div class="tr_locationList single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
	                    <!-- Post Thumbnail -->
	                    <div class="post-thumbnail">
	                    	<a href="${articleUrl}?&locCode=${list.locCode}&landCode=${list.landCode}"><img src="<%=cp%>/resources/images/travel/main/basic_location.jpg" alt=""></a>
	                    	<%-- <c:if test="${not empty list.saveFilename}">
	                    		<a href="${articleUrl}?locCode=${list.locCode}"><img src="/wadmin/uploads/landmark/${list.saveFilename}" alt="${list.locName}"></a>
	                    	</c:if>
	                    	<c:if test="${empty list.saveFilename}">
	                    		<a href="${articleUrl}?locCode=${list.locCode}"><img src="<%=cp%>/resources/images/travel/main/basic_location.jpg" alt=""></a>
	                    	</c:if> --%>
	                    </div>
	                    <!-- Post Content -->
	                    <div class="post-content">
	                        <!-- Post Title -->
	                        <a href="${articleUrl}?&locCode=${list.locCode}&landCode=${list.landCode}" class="post-title">${list.landName}</a>
	                        <div class="mb20">
	                        	${list.address1}, ${list.address2}
	                        </div>
	                        <div class="mb20">
	                        	${list.memo}
	                        </div>
	                        <div class="mb20">
	                        	${list.landAvgStarNum} / ${list.landReplyCount} (댓글수)
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->
<div class="t_center mt30 mb30">
	${paging}
</div>