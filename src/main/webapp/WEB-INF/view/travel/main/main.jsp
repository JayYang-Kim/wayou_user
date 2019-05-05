<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<script type="text/javascript">
	$(function(){
		
	});
</script>

<section class="welcome-area">
	<div class="welcome-slides owl-carousel">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/17.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInUp" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/18.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/18.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
                    <!-- Welcome Text -->
                        <div class="col-12">
                            <div class="welcome-text text-center">
                                <h6 data-animation="fadeInDown" data-delay="200ms">Hotel &amp; Resort</h6>
                                <h2 data-animation="fadeInDown" data-delay="500ms">Welcome To Roberto</h2>
                                <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">Discover Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //welcome-slides  -->
</section>
<!-- //welcome-area  -->
	
<!-- roberto-about-area -->
<section class="roberto-about-area section-padding-100-0">
    <!-- Hotel Search Form Area -->
	<div class="hotel-search-form-area">
	    <div class="container-fluid">
	        <div class="hotel-search-form">
	            <form action="#" method="post">
	                <div class="row justify-content-between align-items-end">
	                    <div class="col-12 col-md-9">
	                        <label for="children">여행 지역 및 랜드마크 검색</label>
	                        <input type="text" class="form-control" id="input_search" name="input_search"/>
	                    </div>
	                    <div class="col-12 col-md-3">
	                        <button type="submit" class="form-control btn roberto-btn w-100">검색(Search)</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
</section>
<!-- //roberto-about-area -->

<%-- <div>
	<button type="button" class="btn roberto-btn" onclick="btnPayment()">테스트 결제하기</button>
</div> --%>

<div class="colorlib-tour">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>Popular Destination</h2>
				<p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
	</div>
	<div class="tour-wrap">
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Athens, Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-2.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Thailand</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-3.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Philippines</h2>
				<span class="city">Lipa, Philippines</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-4.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-5.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-6.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-7.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
		<a href="#" class="tour-entry animate-box">
			<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-8.jpg);">
			</div>
			<span class="desc">
				<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
				<h2>Family Tour in Greece</h2>
				<span class="city">Athens, Greece</span>
				<span class="price">$450</span>
			</span>
		</a>
	</div>
</div>

<div class="colorlib-tour colorlib-light-grey">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>Most Popular Travel Countries</h2>
				<p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="f-tour">
					<div class="row row-pb-md">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6 animate-box">
									<a  href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);">
										<div class="desc">
											<h3>Rome - 5 Days</h3>
											<p class="price"><span>$120</span> <small>/ person</small></p>
										</div>
									</a>
								</div>
								<div class="col-md-6 animate-box">
									<a  href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-2.jpg);">
										<div class="desc">
											<h3>Rome - 5 Days</h3>
											<p class="price"><span>$120</span> <small>/ person</small></p>
										</div>
									</a>
								</div>
								<div class="col-md-6 animate-box">
									<a  href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-3.jpg);">
										<div class="desc">
											<h3>Rome - 5 Days</h3>
											<p class="price"><span>$120</span> <small>/ person</small></p>
										</div>
									</a>
								</div>
								<div class="col-md-6 animate-box">
									<a  href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-4.jpg);">
										<div class="desc">
											<h3>Rome - 5 Days</h3>
											<p class="price"><span>$120</span> <small>/ person</small></p>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="col-md-6 animate-box">
							<div class="desc">
								<div class="row">
									<div class="col-md-12">
										<h3>Italy, Europe</h3>
										<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p><br>
									</div>
									<div class="col-md-12">
										<h4>Best Tours City</h4>
										<div class="row">
											<div class="col-md-4 col-sm-4 col-xs-4">
												<ul>
													<li><a href="#">Rome</a></li>
													<li><a href="#">Milan</a></li>
													<li><a href="#">Genoa</a></li>
													<li><a href="#">Verona</a></li>
												</ul>
											</div>
											<div class="col-md-4 col-sm-4 col-xs-4">
												<ul>
													<li><a href="#">Venice</a></li>
													<li><a href="#">Bologna</a></li>
													<li><a href="#">Trieste</a></li>
													<li><a href="#">Florence</a></li>
												</ul>
											</div>
											<div class="col-md-4 col-sm-4 col-xs-4">
												<ul>
													<li><a href="#">Palermo</a></li>
													<li><a href="#">Siena</a></li>
													<li><a href="#">San Marino</a></li>
													<li><a href="#">Naples</a></li>
												</ul>
											</div>
										</div>
										<p><a href="tours.html" class="btn btn-primary">View All Places</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="colorlib-hotel">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>Recommended Hotels</h2>
				<p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 animate-box">
				<div>
					<div class="item">
						<div class="hotel-entry">
							<a href="hotels.html" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-1.jpg);">
								<p class="price"><span>$120</span><small> /night</small></p>
							</a>
							<div class="desc">
								<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
								<h3><a href="#">Hotel Edison</a></h3>
								<span class="place">New York, USA</span>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="hotel-entry">
							<a href="hotels.html" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-2.jpg);">
								<p class="price"><span>$120</span><small> /night</small></p>
							</a>
							<div class="desc">
								<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
								<h3><a href="#">Hotel Edison</a></h3>
								<span class="place">New York, USA</span>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="hotel-entry">
							<a href="hotels.html" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-3.jpg);">
								<p class="price"><span>$120</span><small> /night</small></p>
							</a>
							<div class="desc">
								<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
								<h3><a href="#">Hotel Edison</a></h3>
								<span class="place">New York, USA</span>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="hotel-entry">
							<a href="hotels.html" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-4.jpg);">
								<p class="price"><span>$120</span><small> /night</small></p>
							</a>
							<div class="desc">
								<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
								<h3><a href="#">Hotel Edison</a></h3>
								<span class="place">New York, USA</span>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- roberto-blog-area -->
<section class="roberto-blog-area section-padding-100-0 colorlib-light-grey clear">
    <div class="container">
        <div class="row">
            <!-- Section Heading -->
	        <div class="col-12">
	            <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
	                <h6>Our Blog</h6>
	                <h2>Latest News &amp; Event</h2>
	            </div>
	        </div>
  		</div>

    	<div class="row">
        	<!-- Single Post Area -->
        	<div class="col-12 col-md-6 col-lg-4">
            	<div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                	<a href="#" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/2.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">Jan 02, 2019</a>
	                    <a href="#" class="post-catagory">Event</a>
	                </div>
                	<!-- Post Title -->
                	<a href="#" class="post-title">Learn How To Motivate Yourself</a>
                	<p>How many free autoresponders have you tried? And how many emails did you get through using them?</p>
                	<a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
            	</div>
        	</div>

	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="500ms">
	                <a href="#" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/3.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">Jan 02, 2019</a>
	                    <a href="#" class="post-catagory">Event</a>
	                </div>
	                <!-- Post Title -->
	                <a href="#" class="post-title">What If Let You Run The Hubble</a>
	                <p>My point here is that if you have no clue for the answers above you probably are not operating a followup.</p>
	                <a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </div>
	        </div>

        	<!-- Single Post Area -->
        	<div class="col-12 col-md-6 col-lg-4">
            	<div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="700ms">
                	<a href="#" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/4.jpg" alt=""></a>
                	<!-- Post Meta -->
                	<div class="post-meta">
                    	<a href="#" class="post-date">Jan 02, 2019</a>
                    	<a href="#" class="post-catagory">Event</a>
                	</div>
                	<!-- Post Title -->
                    <a href="#" class="post-title">Six Pack Abs The Big Picture</a>
                    <p>Some good steps to take to ensure you are getting what you need out of a autoresponder include…</p>
                    <a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <!-- //row -->
    </div>
    <!-- //container -->
</section>
<!-- //roberto-blog-area -->