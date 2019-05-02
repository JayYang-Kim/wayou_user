<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	String uri = request.getRequestURI();
%>

<!-- Search Form -->
<div class="search-form d-flex align-items-center">
    <div class="container">
        <form action="index.html" method="get">
            <input type="search" name="search-form-input" id="searchFormInput" placeholder="검색어를 입력해주세요.">
            <button type="submit"><i class="icon_search"></i></button>
        </form>
    </div>
</div>

<!-- Top Header Area Start -->
<div class="top-header-area">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="top-header-content">
                    <!-- Top Social Area -->
                    <div class="top-social-area">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    </div>
                    <!-- <div class="top-area">
                        <span>WAYOU - 너도 여행할 수 있어!!</span>
                    </div> -->
                </div>
            </div>
            <!-- 비로그인 -->
            <c:if test="${sessionScope.member == null}">
	            <div class="col-6 h_mobile">
	                <div class="top-header-content">
	                    <div class="ml-auto top-area">
	                        <a href="<%=cp%>/member/login"><span>로그인</span></a>
	                        <span class="pl15 pr15 t_white">|</span>
	                        <a href="<%=cp%>/member/join"><span>회원가입</span></a>
	                    </div>
	                </div>
	            </div>
            </c:if>
            <!-- 로그인 -->
            <c:if test="${sessionScope.member != null}">
	            <div class="col-6 h_mobile">
	                <div class="top-header-content">
	                    <div class="ml-auto top-area">
	                        <span>${sessionScope.member.userId}</span><span>(님)</span>
	                        <span class="pl15 pr15 t_white">|</span>
	                        <a href="<%=cp%>/myPage/main"><span>마이페이지</span></a>
	                        <span class="pl15 pr15 t_white">|</span>
	                        <a href="<%=cp%>/member/logout"><span>로그아웃</span></a>
	                    </div>
	                </div>
	            </div>
            </c:if>
        </div>
    </div>
</div>
<!-- Top Header Area End -->

<!-- Main Header Start -->
<div class="main-header-area">
    <div class="classy-nav-container breakpoint-off">
        <div class="container">
            <!-- Classy Menu -->
            <nav class="classy-navbar justify-content-between" id="robertoNav">

                <!-- Logo -->
                <div class="logo"><h1><a href="<%=cp%>/main">WAYOU</a></h1></div>

                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">
                    <!-- Menu Close Button -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                            <ul id="nav">
                            	<!-- Menu Sample -->
                            	<%-- <li><a href="<%=cp%>/travel">여행</a>
                                    <ul class="dropdown">
                                        <li><a href="#">- 지역보기</a></li>
                                        <li><a href="#">- 랜드마크 보기 </a></li>
                                        <li><a href="#">- 일정 모음</a></li>
                                        <li><a href="#">- 나만의 일정</a></li>
                                        <li><a href="#">- 동료 모으기</a></li>
                                        <li><a href="#">- 일정 만들기</a></li>
                                        <li><a href="#">- 문의하기</a></li>
                                        <li><a href="#">- Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="#">- Dropdown Item</a></li>
                                                <li><a href="#">- Dropdown Item</a></li>
                                                <li><a href="#">- Dropdown Item</a></li>
                                                <li><a href="#">- Dropdown Item</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li> --%>
                                <li><a href="<%=cp%>/travel">여행</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/travel/location">- 지역보기</a></li>
                                        <li><a href="<%=cp%>/travel/landMark">- 랜드마크 보기 </a></li>
                                        <li><a href="<%=cp%>/travel/plan/list">- 일정 모음</a></li>
                                        <li><a href="<%=cp%>/travel/myplan/myList">- 나만의 일정</a></li>
                                        <li><a href="<%=cp%>/travel/party">- 동료 모으기</a>
                                        	<ul class="dropdown">
                                                <!-- <li><a href="#">- 리스트</a></li> -->
                                                <li><a href="<%=cp%>/travel/party/create">- 파티 생성</a></li>
                                                <li><a href="<%=cp%>/travel/party/myList">- 내 파티 리스트</a></li>
                                                <li><a href="<%=cp%>/travel/party/attendList">- 참가 파티 리스트</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="<%=cp%>/travel/myplan/add">- 일정 만들기</a></li>
                                        <li><a href="<%=cp%>/travel/notice/list">- 공지사항</a></li>
                                        <li><a href="<%=cp%>/travel/contact">- 문의하기</a></li>
                                        <li><a href="<%=cp%>/travel/event/list">- 이벤트</a></li>
                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/ticket/tmain">티켓몰</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/ticket/list">- 티켓</a></li>
                                        <li><a href="#">- 나만의 티켓 예약</a></li>
                                        <li><a href="#">- 이벤트</a></li>
                                        <li><a href="#">- 공지사항</a></li>
                                        <li><a href="<%=cp%>/ticket/qna/list">- 문의사항</a>
                                        	<ul class="dropdown">
                                                <li><a href="<%=cp%>/ticket/qna/list">- 질문과 답변</a></li>
                                                <li><a href="<%=cp%>/ticket/faq/list">- 자주하는 질문</a></li>
                                                <li><a href="#">- 1:1문의</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/hotel/hotel/main">숙박</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/hotel/hotel/list">- 호텔</a></li>
                                        <li><a href="<%=cp%>/hotel/hotel/article">- 나만의 호텔 예약</a></li>
                                        <li><a href="<%=cp%>/hotel/hevent/hevent">- 이벤트</a></li>
                                        <li><a href="#">- 공지사항</a></li>
                                        <li><a href="<%=cp%>/hotel/hqna/main">- 문의사항</a></li>
                                        <li><a href="#">- FAQ</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">문의사항</a></li>
                            </ul>

                        <!-- Search -->
                        <div class="h_mobile search-btn ml-4">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </div>
                        
                        <!-- Book Now -->
                        <div class="book-now-btn ml-3 ml-lg-5 h_mobile">
                            <a href="#">여행 출발 <i class="fa fa-suitcase" aria-hidden="true"></i></a>
                        </div>

                        <!-- Mobile Login -->
                        <!-- 비로그인 -->
                        <c:if test="${sessionScope.member == null}">
	                        <div class="h_web login_area">
	                            <div class="row">
	                                <div class="col-12">
	                                    <a href="<%=cp%>/member/login">로그인</a>
	                                </div>
	                                <div class="col-12">
	                                    <a href="<%=cp%>/member/join">회원가입</a>
	                                </div>
	                            </div>
	                        </div>
                        </c:if>
                        <!-- 로그인 -->
                        <c:if test="${sessionScope.member != null}">
	                        <div class="h_web login_area">
	                            <div class="row">
	                                <div class="col-12">
	                                    <p>
	                                        <span>${sessionScope.member.userId}</span><span>(님) 환영합니다.</span>
	                                    </p>
	                                </div>
	                                <div class="col-12">
	                                    <a href="<%=cp%>/myPage/main">마이페이지</a>
	                                </div>
	                                <div class="col-12">
	                                    <a href="<%=cp%>/member/logout">로그아웃</a>
	                                </div>
	                            </div>
	                        </div>
                        </c:if>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
        </div>
    </div>
</div>