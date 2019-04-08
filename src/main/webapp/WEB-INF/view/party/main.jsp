<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
	function sendSearch() {
		var f = document.search_form;
		f.submit();
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
		            <div class="col-12 col-lg-2">
		            	<select name="searchKey">
		            		<option value="all" ${searchKey == 'all' ? "selected='selected'" : ""}>제목 + 내용</option>
		            		<option value="subject" ${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
		            		<option value="content" ${searchKey == 'content' ? "selected='selected'" : ""}>내용</option>
		            		<option value="startDate" ${searchKey == 'startDate' ? "selected='selected'" : ""}>시작일</option>
		            		<option value="endDate" ${searchKey == 'endDate' ? "selected='selected'" : ""}>종료일</option>
		            		<option value="userIdx" ${searchKey == 'userIdx' ? "selected='selected'" : ""}>아이디</option>
		            		<option value="userCount" ${searchKey == 'userCount' ? "selected='selected'" : ""}>인원수</option>
		            	</select>
		            </div>
		            <div class="col-12 col-lg-8">
		            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요."/>
		            </div>
		            <div class="col-12 col-lg-2">
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
		            </div>
			</div>
		</form>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
            	<c:forEach var="dto" items="${list}">
	                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
	                    <!-- Post Content -->
	                    <div class="post-content party_list">
	                        <!-- Post Meta -->
	                        <div class="post-meta">
	                            <a href="<%=cp%>/travel/party/view" class="post-author">${dto.startDate}</a>
	                            <a href="<%=cp%>/travel/party/view" class="post-tutorial">${dto.endDate}</a>
	                        </div>
	                        <!-- Post Title -->
	                        <a href="<%=cp%>/travel/party/view" class="post-title">${dto.subject}</a>
	                        <p>${dto.content}</p>
	                        <a href="<%=cp%>/travel/party/view" data-partyCode="${dto.partyCode}" class="btn continue-btn">상세보기</a>
	                    </div>
	                </div>
                </c:forEach>
            
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
                
                <div>
                	<div class="col-12 text-right">
	                    <a href="<%=cp%>/travel/party/create" class="btn roberto-btn mb-50">파티 생성</a>
	                </div>
                </div>

                <!-- Pagination -->
                <!-- <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="600ms">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next <i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </nav> -->
                <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="600ms">
                	${paging}
                </nav>
            </div>

            <div class="col-12 col-sm-12 col-md-12 col-lg-4">
                <div class="roberto-sidebar-area pl-md-4">

                    <!-- Recent Post -->
                    <div class="single-widget-area mb-100">
                        <h4 class="widget-title mb-30">인기 파티 (Top5)</h4>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Proven Techniques Help You Herbal Breast</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Cooking On A George Foreman Grill</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Selecting The Right Hotel</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Comment Importance Of Human Life</a>
                            </div>
                        </div>
                    </div>
					
					<!-- Recent Post -->
                    <div class="single-widget-area mb-100">
                        <h4 class="widget-title mb-30">최신 파티 (Top5)</h4>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Proven Techniques Help You Herbal Breast</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Cooking On A George Foreman Grill</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Selecting The Right Hotel</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Comment Importance Of Human Life</a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->