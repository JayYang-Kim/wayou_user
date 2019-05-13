<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	$(function(){
		listRecommendLocation();
	});

	function listRecommendLocation() {
		var url="<%=cp%>/travel/location/recommendLocation";
		
		$.ajax({
			type:"post"
			,url:url
			,success:function(data) {
				$("#recommendLocation_layout").html(data);
			}
		    ,beforeSend:function(e) {
		    	e.setRequestHeader("AJAX", true);
		    }
		    ,error:function(e) {
		    	<%-- if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	} --%>
		    	console.log(e.responseText);
		    }
		});
		
	}
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
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">

                <!-- Single Blog Post Area -->
                <c:forEach var="listLocation" items="${listLocation}">
	                <div class="tr_locationList single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
	                    <!-- Post Thumbnail -->
	                    <div class="post-thumbnail">
	                    	<c:if test="${not empty listLocation.saveFilename}">
	                    		<a href="<%=cp%>/travel/location/view?locCode=${listLocation.locCode}"><img src="<%=cp%>/uploads/location/${listLocation.saveFilename}" alt="${listLocation.locName}"></a>
	                    	</c:if>
	                    	<c:if test="${empty listLocation.saveFilename}">
	                    		<a href="<%=cp%>/travel/location/view?locCode=${listLocation.locCode}"><img src="<%=cp%>/resources/images/travel/main/basic_location.jpg" alt=""></a>
	                    	</c:if>
	                    </div>
	                    <!-- Post Content -->
	                    <div class="post-content">
	                        <!-- Post Title -->
	                        <a href="<%=cp%>/travel/location/view?locCode=${listLocation.locCode}" class="post-title">${listLocation.locName}(${listLocation.loceName})</a>
	                        <p>${listLocation.memo}</p>
	                        <div>
	                        	<c:if test="${listLocation.locAvgStarNum < 5}">
									<c:forEach begin="${listLocation.locAvgStarNum}" end="4">
										<i class="fa fa-star"></i>
									</c:forEach>
								</c:if>
								<c:if test="${listLocation.locAvgStarNum > 0}">
									<c:forEach begin="1" end="${listLocation.locAvgStarNum}">
					            		<i class="fa fa-star" style="color: #f5b917;"></i>
					            	</c:forEach>
				            	</c:if>
	                        	 / ${listLocation.locReplyCount} (댓글수)
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>

            <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                <div class="roberto-sidebar-area pl-md-4">
                    <!-- Recent Post -->
                    <div class="single-widget-area mb-100">
                        <h4 class="widget-title mb-30">추천 지역</h4>

                        <div id="recommendLocation_layout"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->