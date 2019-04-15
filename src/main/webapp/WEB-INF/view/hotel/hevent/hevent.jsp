<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<section class="welcome-area">
	<div class="welcome-slides owl-carousel noImg">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">Welcome To wayou</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">Hotel</h2>
	                          
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	 </div>
</section>
<div class="roberto-news-area section-padding-100-0" >
        <div class="container" >
            <div class="row justify-content">
                <nav style="font-size: 20px; color: gray; line-height:2; padding-right: 150px;">
				    <ul>
				        <li><a href="/more/notice">이&nbsp;벤&nbsp;트</a></li>
				        <li><a href="/more/event" class="active">공&nbsp;지&nbsp;사&nbsp;항</a></li>
				        <li><a href="/more/project">문&nbsp;의&nbsp;사&nbsp;항</a></li>
				        <li><a href="/more/faq">F&nbsp;&nbsp;&&nbsp;&nbsp;Q</a></li>
				    </ul>
				</nav>
                            <!-- Single Recent Post -->
                            <div class="single-recent-post d-flex">
                </div>
                <div class="col-12 col-lg-8" style="clear:both; float: right;" >
                    <!-- Single Blog Post Area -->
                    <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail" style="padding-right: 50px;">
                           <a href="#"><img src="<%=cp %>/resources/images/bg-img/24.jpg" alt=""></a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <!-- Post Meta -->
                            <div class="post-meta">
                                <a href="#" class="post-author">이벤트 등록날짜</a>
                                <a href="#" class="post-tutorial">Event</a>
                            </div>
                            <!-- Post Title -->
                            <a href="#" class="post-title">이벤트 제목</a>
                            <p>이벤트 내용&사진</p>
                            <a href="<%=cp%>/hevent/earticle" class="btn continue-btn">Read More</a>
                        </div>
                    </div>
                    <!-- Pagination -->
                    <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="600ms" style="visibility: visible; animation-delay: 600ms; animation-name: fadeInUp;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next <i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>