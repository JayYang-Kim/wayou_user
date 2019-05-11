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
                </div>
            </div>
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
                                <li><a href="<%=cp%>/myPage/main">주문내역</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/">- 전체 주문 내역</a></li>
                                        <li><a href="<%=cp%>/">- 숙박 </a></li>
                                        <li><a href="#">- 티켓</a></li>
                                        <li><a href="<%=cp%>/">- 일정</a></li>
                                        <li><a href="<%=cp%>/">- 주문취소/교환/반품내역</a>
                                        	<ul class="dropdown">
                                                <li><a href="<%=cp%>/">- 주문 취소</a></li>
                                                <li><a href="<%=cp%>/">- 교환</a></li>
                                                <li><a href="<%=cp%>/">- 반품내역</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/myPage/main">관심상품</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/myPage/wishlist/list">- 장바구니</a></li>
                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/myPage/main">회원정보</a>
                                    <ul class="dropdown">
                                        <li><a href="<%=cp%>/myPage/check">- 수정 및 탈퇴</a></li>
                                        <li><a href="<%=cp%>/myPage/step">- 등급확인</a></li>
                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/myPage/main">문의사항</a>
                                        <ul class="dropdown">
                                        <li><a href="<%=cp%>/">- 문의사항 작성</a></li>
                                        <li><a href="<%=cp%>/">- 답변 확인</a></li>
                                    </ul>
                                </li>
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