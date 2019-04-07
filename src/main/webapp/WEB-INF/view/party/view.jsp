<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
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
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
            	<!-- Title -->
            	<div class="blog-details-title">
            		<h3>파티 게시물 타이틀 영역</h3>
            	</div>
                <!-- Blog Details Text -->
                <div class="blog-details-text">
                    <p>“IT” (otherwise known as HD 36405.b) isn’t your average “oddball” exo-solar planet made of rock that wobbles on its end &amp; zips around a nearby star in less than 2.46 days.</p>

                    <p>Seeking a spot of serenity somewhere in the universe, I recently booked a deep-discount dodgy berth on the ‘White Elephant Express Space Shuttle’, to a little known place in a galaxy far, far away.</p>

                    <p>If truth be told, (after reading random excerpts from “The Itty Bitty Bunkum Book About Life, the Universe &amp; Practically Everything Under the Sun Not To Mention Stuff Going On In Remote Galaxies), I was basically delirious. According to its noted author, Dr. Jarn Leffer, “IT is a ‘must-see’ for those with little time on their hands &amp; a passionate interest in Innocuous Things.”</p>

                    <p>Most linear thinkers have a great deal of difficulty even comprehending why on earth someone in their “right mind” would be interested in visiting a planet called “IT”. Not being a linear thinker with an investment in the “right” answer, I didn’t give a hoot. After all, what does one (who walks on water &amp; listens to miffed mortals all day long) do for a frigging night off, now I ask you?</p>

                    <!-- Blockquote -->
                    <blockquote class="roberto-blockquote d-flex">
                        <div class="icon">
                            <img src="<%=cp%>/resources/images/core-img/quote.png" alt="">
                        </div>
                        <div class="text">
                            <h5>“Before you took that first cruise, your thoughts about cruise ships and cruise vacations consisted of flashbacks to Love Boat re-runs. Cruising was all about sunny, tropical destinations like Bermuda”</h5>
                        </div>
                    </blockquote>

                    <p>The city of southern California, san diego is locally known as ‘America’s Finest City’. It’s located on San Diego Bay, an inlet of the Pacific Ocean near the Mexican border. San Diego is the second largest city in California and the seventh largest in the United States. It is also nicknamed as ‘America’s biggest small town’.</p>
                </div>

                <!-- Post Author Area -->
                <div class="post-author-area d-flex align-items-center justify-content-between mb-50">
                	<div class="w100p">
                		<div>
                			<a href="/wayou/travel/party/create" class="btn roberto-btn">파티 생성</a>
                    		<a href="/wayou/travel/party/create" class="btn roberto-btn">파티 생성</a>
                    		<a href="/wayou/travel/party/create" class="btn roberto-btn f_right">파티 생성</a>
                		</div>
                	</div>
                </div>

                <!-- Comments Area -->
                <div class="comment_area mb-50 clearfix">
                    <h2>02 Comments</h2>

                    <ol>
                        <!-- Single Comment Area -->
                        <li class="single_comment_area">
                            <!-- Comment Content -->
                            <div class="comment-content d-flex">
                                <!-- Comment Author -->
                                <div class="comment-author">
                                    <img src="<%=cp%>/resources/images/bg-img/40.jpg" alt="author">
                                </div>
                                <!-- Comment Meta -->
                                <div class="comment-meta">
                                    <a href="#" class="post-date">27 Aug 2016</a>
                                    <h5>Brandon Kelley</h5>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi.</p>
                                    <a href="#" class="like">Like</a>
                                    <a href="#" class="reply">Reply</a>
                                </div>
                            </div>

                            <ol class="children">
                                <li class="single_comment_area">
                                    <!-- Comment Content -->
                                    <div class="comment-content d-flex">
                                        <!-- Comment Author -->
                                        <div class="comment-author">
                                            <img src="<%=cp%>/resources/images/bg-img/41.jpg" alt="author">
                                        </div>
                                        <!-- Comment Meta -->
                                        <div class="comment-meta">
                                            <a href="#" class="post-date">27 Aug 2018</a>
                                            <h5>John Doe</h5>
                                            <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetu adipisci velit, sed quia non numquam eius modi</p>
                                            <a href="#" class="like">Like</a>
                                            <a href="#" class="reply">Reply</a>
                                        </div>
                                    </div>
                                </li>
                            </ol>
                        </li>

                        <!-- Single Comment Area -->
                        <li class="single_comment_area">
                            <!-- Comment Content -->
                            <div class="comment-content d-flex">
                                <!-- Comment Author -->
                                <div class="comment-author">
                                    <img src="<%=cp%>/resources/images/bg-img/42.jpg" alt="author">
                                </div>
                                <!-- Comment Meta -->
                                <div class="comment-meta">
                                    <a href="#" class="post-date">27 Aug 2018</a>
                                    <h5>Lander Tea</h5>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetu adipisci velit, sed quia non numquam eius modi</p>
                                    <a href="#" class="like">Like</a>
                                    <a href="#" class="reply">Reply</a>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>

                <!-- Leave A Reply -->
                <div class="roberto-contact-form mt-80 mb-100">
                    <h2>댓글 남기기</h2>

                    <!-- Form -->
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" name="message-name" class="form-control mb-30" placeholder="Your Name">
                            </div>
                            <div class="col-12">
                                <input type="email" name="message-email" class="form-control mb-30" placeholder="Email">
                            </div>
                            <div class="col-12">
                                <input type="text" name="website" class="form-control mb-30" placeholder="Websites">
                            </div>
                            <div class="col-12">
                                <textarea name="message" class="form-control mb-30" placeholder="Start the discussion..."></textarea>
                            </div>
                            <div class="col-12 text-right">
                                <button type="submit" class="btn roberto-btn btn-3 mt-15">Post Comment</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-12 col-sm-8 col-md-6 col-lg-4">
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

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->