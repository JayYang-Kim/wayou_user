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
    <script type="text/javascript">
    	function sendOk(){
    		var f = document.login_form;
    	
    		if(!$("input[name='userId']").val() || !$("input[name='userPwd']").val()){
    			alert("이름과 패스워드를 입력하세요");
    			return;
    		}
    		var url ="<%=cp%>/member/login";
    		var query = $("form[name='login_form']").serialize();
    		$.ajax({
    			type:"post",
    			url:url,
    			data:query,
    			dataType:"json",
    			success:function(data){    
    				if(data.isUser){
    					var uri = data.uri;
    					if(uri==null || uri.indexOf('login')>0){
    						uri ="/main";
    					}
    					location.href="<%=cp%>"+uri;
    				}else{
    					alert("정보가 다릅니다.");
    				}
    			},
    			beforesend:function(e){
    				e.setRequestHeader("AJAX",true);
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
    	}
    </script>
</head>

<body>
        <!-- container -->
        <div id="container" class="login_container">
            <!-- contents -->
            <div class="register">
                <form name="login_form" action="<%=cp%>/member/loginSubmit" method="post">
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
                                <button type="button" class="btn_login" onclick="sendOk()">로그인</button>
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
</body>
</html>