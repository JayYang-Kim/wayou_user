<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    
    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/common.css" media="all" />

    <!-- Javascript -->
    <script src="<%=cp%>/resources/js/lib/jquery-1.12.4.min.js"></script>
	<script src="<%=cp%>/resources/js/lib/jquery-migrate-1.4.1.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
    <script src="<%=cp%>/resources/js/lib/util.js"></script>
    

    <style type="text/css">
    .layer{position:absolute;top:0;left:0;width:100%;height:100%;text-align:center; background:#f5f6f7}
	.layer .content{display:inline-block;width: 510px; height:345px;padding: 40px;background:#fff;border-radius: 40px;vertical-align:middle; border:1px solid efefef; margin-top:150px;}
	.layer .blank{display:inline-block;width:0;height:100%;vertical-align:middle}
	
    </style>
    
 <script type="text/javascript">

</script>
    
</head>

<body>
<div class="layer">
  <div class="content">
  	<h1>회원가입 완료</h1>
  	</div>
</div>
  <div class="blank"></div>
</body>
</html>