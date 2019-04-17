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
    	function sendOk() {
    		var f = document.login_form;
    		var msg = "* 아이디와 비밀번호를 입력해주세요.";
    		
    		if(!$("input[name='userId']").val()){    			
    			$("input[name='userId']").focus().css("outline-color","#df4442");
    			
    			var out = "<span class='t_red f14'>" + msg + "</span>";
    			
				$("#loginMsg").html(out).addClass("mt30");
				
    			return false;
    		}
    		
    		if(!$("input[name='userPwd']").val()){
    			$("input[name='userPwd']").focus().css("outline-color","#df4442");
    			
				var out = "<span class='t_red f14'>" + msg + "</span>";
    			
				$("#loginMsg").html(out).addClass("mt30");
    			
    			return false;
    		}
    		
    		return true;
    	}
    </script>
</head>

<body>
    <!-- Wrap -->
    <div id="wrap" class="login_wrap">
        <!-- Header -->
        <!-- <header>
            <div class="login_header">
                <h1 class="title">
                    <a href="main.html">WAYOU | 관리자</a>
                </h1>
            </div>
        </header> -->
        <!-- //Header -->
        
        <!-- container -->
        <div id="container" class="login_container">
            <!-- contents -->
            <div class="register">
                <form name="login_form" action="<%=cp%>/member/login" method="post" onsubmit="return sendOk();">
                    <fieldset>
                        <div class="box_login">
                            <h3 class="title">로그인</h3>
                            <div class="mt30">
                                <label for="txt_id">아이디</label>
                                <div>
                                    <input type="text" name="userId" id="txt_id" class="boxTf" autocomplete="off" autofocus/>
                                </div>
                            </div>
                            <div class="mt30">
                                <label for="txt_pwd">비밀번호</label>
                                <div>
                                    <input type="password" name="userPwd" id="txt_pwd" class="boxTf" autocomplete="off" autofocus/>
                                </div>
                            </div>
                            <div class="mt30">
                                <label class="checkbox">
                                    <input name="checkbox" type="checkbox" value="saveId"/>
                                    <span class="lbl">아이디 저장</span>
                                </label>
                            </div>
                            <div id="loginMsg"></div>
                            <div class="mt30">
                                <button type="submit" class="btn_login">로그인</button><br>
                                <p>${msg}</p>
                            </div>
                        </div>
                    </fieldset>
                </form>
                <div class="login_info">
                    <a href="#">아이디 찾기</a><span class="bar">|</span> 
                    <a href="#">비밀번호 찾기</a><span class="bar">|</span> 
                    <a href="<%=cp%>/member/join.do">회원가입</a>
                </div>
            </div>
            <!-- //contents -->
        </div>
        <!-- //container -->
        
        <!-- Footer -->
        <footer class="clear login">
            <div class="box_footer">
                <div class="copyright">
                    <p>Copyright (c) (주)WAYOU. All rights reserved.</p>
                </div>
            </div>
        </footer>
        <!-- //Footer -->
    </div>
    <!-- //Wrap -->
</body>
</html>