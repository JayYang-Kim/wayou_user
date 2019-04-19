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
    <link rel="stylesheet" href="<%=cp%>/resource/css/common.css" media="all" />

    <!-- Javascript -->
    <script src="<%=cp%>/resource/js/lib/jquery-1.12.4.min.js"></script>
	<script src="<%=cp%>/resource/js/lib/jquery-migrate-1.4.1.min.js"></script>
    <script src="<%=cp%>/resource/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resource/js/lib/util-jquery.js"></script>
    <script src="<%=cp%>/resource/js/lib/util.js"></script>
    
    <script src="<%=cp%>/resource/js/plugins.js"></script>
    <script src="<%=cp%>/resource/js/basic.js"></script>
    <script type="text/javascript">

    </script>
    
    <script type="text/javascript">
   var a;
    
   function securityCheck(){
	   var f=document.joinForm;
	   var email=f.userEmail.val();
	   var url="<%=cp%>/user/emailCheck";
	   var data="email="+email;
	   $.ajax({
		  type:"GET",
		  url:url,
		  data:data,
		  success:function(data){
			  var result=data.result;
			  a=data.num;
			  alert("인증 번호가 남긴 이메일을 보냈습니다.");
		  },beforeSend:function(e){
			  e.setRequestHeader("AJAX",true);
		  },error:function(){
			  if(e.status==403){
				alert("메일 전송 실패");
				return;
			  }
			  console.log(e.responseText);
		  }
	   });
   }
 
   function submit(){
    	var f =document.joinForm;
    	var content;
    	
    	content=f.userId.val();
    	content = content.trim();
    	if(!content){
    		alert("이름을 입력하세요");
    		f.userId.focus();
    		return;
    	}
    	
    	content=f.userPwd.val();
    	content=content.trim();
    	if(!content){
    		alert("비밀번호를 입력하세요");
    		f.userPwd
    	}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(content)) { 
    		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자를 포함해야합니다");
    		f.userPwd.focus();
    		return;
    	}
    	
    	if(content!=f.userPwdCheck.value){
    		alert("패스워드가 일치하지 않습니다");
    		f.userPwdCheck.focus();
    		return;
    	}
    	
    	content=f.userEmail.value
    	if(!content){
    		alert("이메일을 작성해주세요");
    		f.userEmail.focus();
    		return;
    	}
    	
    	content=f.security.value;
    	if(!content){
    		alert("인증번호를 작성하세요");
    		f.security.focus();
    		return;
    	}
    }
    </script>
    
    
    
    <style type="text/css">
    .layer{position:absolute;top:0;left:0;width:100%;height:100%;text-align:center; background:#f5f6f7}
	.layer .content{display:inline-block;width: 510px; height:500px;padding: 40px;background:#fff;border-radius: 40px;vertical-align:middle; border:1px solid efefef;}
	.layer .blank{display:inline-block;width:0;height:100%;vertical-align:middle}
 	.layer ul {display: block; list-style-type: disc; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; padding-inline-start:0px;}
	.layer ul li{list-style:none;margin-top:20px; width:100%; display:inline;}
	.layer ul li label{font-size:16px;color:#333333;margin-bottom:10px; text-align:left; width:30%}
	.layer ul li input{width:40%;padding:15px 15px;height: 30px;line-height: 40px;margin-bottom:0;font-size:14px;border-radius:inherit;background-color:#fff;color:#333333;border-radius: 5px;-webkit-border-radius: 10px;-moz-border-radius: 5px;box-sizing:border-box;}	
	
    </style>
</head>

<body>
<div class="layer">
  <div class="content">
  	<h1>회원가입</h1>
  		<form name="joinForm" method="POST"></form>
  			<ul>
  				<li><label>아이디(ID)</label></li>
  				<li><input  name="userId" type="text"></li>
  				<li><button name="check" type='button' class='button btn_blk '>중복 검사</button></li>
  				
  			</ul>
  			 <ul>
  				<li><label>비밀번호(Password)</label></li>
  				<li><input name="userPwd" type="password" placeholder="PASSWORD"></li>
  			</ul>
  			 <ul>
  				<li><label>비밀번호 확인(Password Check)</label></li>
  				<li><input name="userPwdCheck" type="password" placeholder="PASSWORD"></li>
  			</ul>
  			 <ul>
  				 <li><label>이메일(Email)</label></li>
  				 <li><input name="userEmail" type="text"><button type="button" onclick="sendEmail()"></button></li>
  			</ul>
  			<ul>
  				<li><label>인증번호(Security Number)</label></li>
  				<li><input  name="security" type="text"><button type="button" onclick="securityCheck()"></button></li>
  			</ul>
  			 <ul>
				<li>
					<div class="btn_wrap view_btn">
						<button type='button' class='button btn_blk' onclick="submit()">다음 단계</button>
					</div>
				</li>			
  			</ul>
  			</div>
  </div>
  <div class="blank"></div>
</body>
</html>