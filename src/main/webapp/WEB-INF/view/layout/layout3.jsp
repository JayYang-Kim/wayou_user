<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
   String uri = request.getRequestURI();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    
    <title>wayou - 너도 여행할 수 있어</title>
    
    <!-- Favicon - 파비콘 (주소창 영역 아이콘) -->
    <link rel="Shortcut Icon" href="<%=cp%>/resource/user/images/common/saramit.ico"/>
    
    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resource/user/css/common.css" media="all" />
	<link rel="stylesheet" href="<%=cp%>/resource/user/css/style.css" media="all" />
	<link rel="stylesheet" href="<%=cp%>/resource/user/css/sangkeun.css" media="all" />
	

    <!-- Javascript -->
    <script src="<%=cp%>/resource/user/js/lib/jquery-1.12.4.min.js"></script>
	<script src="<%=cp%>/resource/user/js/lib/jquery-migrate-1.4.1.min.js"></script>
    <script src="<%=cp%>/resource/user/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resource/user/js/plugins.js"></script>
    <script src="<%=cp%>/resource/user/js/basic.js"></script>
    <script src="<%=cp%>/resource/user/js/util.js"></script>
    <script src="<%=cp%>/resource/user/js/sangkeun.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54199dccf04c47c7869a5d1e688d52d"></script>

    <!-- Carousel -->
    <script type="text/javascript" src="<%=cp%>/resource/user/js/carousel.js"></script>
    
    <!-- 다음 주소검색 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="<%=cp%>/resources/js/lib/html5shiv.js"></script>
    <![endif]-->
</head>
<body>

<div id="wrap">
	    <tiles:insertAttribute name="header"/>
		<div style="min-height: 60px;"></div> 
	<div class="container">
	    <tiles:insertAttribute name="body"/>
	</div>
    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>