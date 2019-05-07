<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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
    
    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/common.css" media="all" />
	<link rel="stylesheet" href="<%=cp%>/resources/css/loginStyle.css" media="all" />
   	
   	<!-- jQuery 2.2.4 -->
    <script src="<%=cp%>/resources/js/lib/jquery-1.12.4.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
    <script src="<%=cp%>/resources/js/lib/util.js"></script>
   	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="<%=cp%>/resources/js/lib/html5shiv.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
    $(function(){
    	$("#login_notice").hide();
    	
    	var msg = "${msg}";
    	if(msg != "") {
    		$("#login_notice").find(".memo_notice").html(msg);
   			$("#login_notice").fadeIn(2000);
   			$("input[name='userId']").focus();
   			return false;
    	}
    	
    });
    function sendOk(){
   		var f = document.login_form;
   	
   		if(!$("input[name='userId']").val()){
   			$("#login_notice").find(".memo_notice").html("아이디를 입력해주세요.");
   			$("#login_notice").fadeIn(2000);
   			$("input[name='userId']").focus();
   			return false;
   		}
   		
   		if(!$("input[name='userPwd']").val()) {
   			$("#login_notice").find(".memo_notice").html("비밀번호를 입력해주세요.");
   			$("#login_notice").fadeIn(2000);
   			$("input[name='userPwd']").focus();
   			return false;
   		}
   		
   		return true;
   	}
    </script>
</head>

<body>
	<article class="main_wrap">
		<div class="inner">
			<h3>로그인</h3>
			<form name="login_form" action="<%=cp%>/member/login" method="post" onsubmit="return sendOk();">
				<ul>
					<li>
						<label for="userId">아이디 / ID</label>
						<input type="text" name="userId" id="txt_id" class="boxTf" autocomplete="off" autofocus/>
					</li>
					<li>
						<label for="userPw">비밀번호 / Password</label>
						<input type="password" name="userPwd" id="txt_pwd" class="boxTf" autocomplete="off" autofocus/>
					</li>
					<%-- <li class="login_check mt20">
						<label class="checkbox-wrap">
							<input type="checkbox" id="id_save">
							<i class="check-icon"></i>
						</label>
						<label for="id_save">아이디저장</label>
					</li> --%>
					<li style="margin-top:40px">
						<button type="submit" class="btn_login btn-block"><strong>로그인</strong></button>
					</li>
				</ul>
			</form>
			<div class="login_info">
            	<a href="#">아이디 찾기</a><span class="bar">|</span> 
                <a href="#">비밀번호 찾기</a><span class="bar">|</span> 
                <a href="<%=cp%>/member/join">회원가입</a>
            </div>
			<footer id="login_notice">
				<img src="<%=cp%>/resources/images/common/icon_notice2.png" class="icon_notice"><span class="memo_notice">아이디 및 패스워드를 확인해주세요.</span>
			</footer>
		</div>
	</article>
</body>
</html>