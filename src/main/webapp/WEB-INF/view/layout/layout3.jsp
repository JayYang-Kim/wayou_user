<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>
<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="ko"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="ko"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="ko"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="ko"> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    
    <title>WAYOU - 누워서 유람하듯 여행을 떠나요</title>
    
    <!-- Favicon - 파비콘 (주소창 영역 아이콘) -->
    <link rel="Shortcut Icon" href="<%=cp%>/resources/images/common/wayou.ico"/>
    
    <!-- Stylesheet - Temp Common CSS File -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/style.css">

    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/common.css" media="all" />
    <link rel="stylesheet" href="<%=cp%>/resources/css/contents.css" media="all" />
    <link rel="stylesheet" href="<%=cp%>/resources/css/datepicker.css" media="all" />
    <link rel="stylesheet" href="<%=cp%>/resources/css/sangkeun.css" media="all" />
    
    <!-- jQuery 2.2.4 -->
    <script src="<%=cp%>/resources/js/lib/jquery.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
    <script src="<%=cp%>/resources/js/lib/util.js"></script>
    <script src="<%=cp%>/resources/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resources/js/ui_script.js"></script>
    
    <!-- 결제모듈 js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="<%=cp%>/resources/js/lib/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Header -->
    <header class="header-area">
    	<tiles:insertAttribute name="header"/>
    </header>
    <!-- /Header -->

    <!-- Body -->
    <tiles:insertAttribute name="body"/>
    <!-- /Body -->

    <!-- Footer -->
    <footer class="footer-area clear">
    <!-- <footer class="footer-area section-padding-80-0"> -->
        <tiles:insertAttribute name="footer"/>
    </footer>
    <!-- /Footer -->

    <!-- **** All JS Files ***** -->
    <!-- Popper -->
    <script src="<%=cp%>/resources/js/lib/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=cp%>/resources/js/lib/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="<%=cp%>/resources/js/lib/roberto.bundle.js"></script>
    <!-- Active -->
    <script src="<%=cp%>/resources/js/lib/default-assets/active.js"></script>
    	<!-- pop_layer -->
	<div id="popup" class="pop_bg">
		<article class="pop_wrap">
			<h1>팝업 타이틀</h1>
			<div class="pop_cont">
				<p></p>
				<p class="t_center mt20">
					<a href="#" class="pop_close button w72 btn_wht">취소</a>
					<a href="#" class="button w72 btn_blk">확인</a>
				</p>
			</div>
			<!-- 팝업을 닫을때는 .pop_close 클래스를 활용 하거나, popupHide 함수 활용 -->
			<a href="#" class="btn_close pop_close">닫기</a>
		</article>
	</div>
</body>
</html>