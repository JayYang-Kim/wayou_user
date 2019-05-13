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
		            		<option value="all" ${searchKey == 'all' ? "selected='selected'" : ""}>전체</option>
		            		<option value="tag1" ${searchKey == 'tag1' ? "selected='selected'" : ""}>역사 / 종교</option>
		            		<option value="tag2" ${searchKey == 'tag2' ? "selected='selected'" : ""}>숙박</option>
		            		<option value="tag3" ${searchKey == 'tag3' ? "selected='selected'" : ""}>쇼핑</option>
		            		<option value="tag4" ${searchKey == 'tag4' ? "selected='selected'" : ""}>음식점</option>
		            	</select>
		            </div>
		            <div class="col-12 col-sm-9 col-lg-6">
		            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요."/>
		            </div>
		            <div class="col-12 col-lg-4">
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
		            	<button type="button" class="btn roberto-btn" onclick="location.href='<%=cp%>/travel/landmark?locCode=${locCode}'">새로고침</button>
		            </div>
			</div>
		</form>
		<!-- //검색 -->
        <div class="row justify-content-center">
            <div class="col-12 col-lg-12">
                <!-- Single Blog Post Area -->
                <c:forEach var="list" items="${list}">
	                <div class="tr_landmarkList single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
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
	                        <div class="address mb20">
	                        	${list.address1}, ${list.address2}
	                        </div>
	                        <div class="memo mb20">
	                        	${list.memo}
	                        </div>
	                        <div class="etc mb20">
	                        	<c:if test="${list.landAvgStarNum < 5}">
									<c:forEach begin="${list.landAvgStarNum}" end="4">
										<i class="fa fa-star"></i>
									</c:forEach>
								</c:if>
								<c:if test="${list.landAvgStarNum > 0}">
									<c:forEach begin="1" end="${list.landAvgStarNum}">
					            		<i class="fa fa-star" style="color: #f5b917;"></i>
					            	</c:forEach>
				            	</c:if>
	                        	 / ${list.landReplyCount} (댓글수)
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