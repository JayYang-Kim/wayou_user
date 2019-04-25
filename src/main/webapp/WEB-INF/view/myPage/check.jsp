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
	.layer .content{display:inline-block;width: 510px; height:160px;padding: 40px;background:#fff;border-radius: 40px;vertical-align:middle; border:1px solid efefef; margin-top:150px;}
	.layer .blank{display:inline-block;width:0;height:100%;vertical-align:middle}
	
    </style>
    
 <script type="text/javascript">
	var n=0;
 
	function checked(){
		var f=document.checkForm;
		var content=f.userPwdCheck.value;
		if(content!=f.userPwd.value){
			f.userPwd.focus();
			alert("비밀번호가 틀립니다");
			return;
		}
		alert("확인 완료");
		n=1;
	}
 
 
   function checkSubmit(){
	   var f=document.checkForm;
    	if(n==0){
    		alert("비밀번호를 확인하세요");
    		return;
    	}
    	
    	f.action="<%=cp%>/myPage/check";
    	f.submit();
    }

</script>
    
    
    
</head>

<body>
<div class="layer">
  <div class="content">
  	<div style="padding-bottom:20px">
  	<h1>비밀번호 재확인</h1>
  		</div>
  		<form name="checkForm" method="POST">
			<table class="table left_tbl form_tbl">
				<colgroup>
					<col style="width:30%" />
					<col style="width:40%" />
					<col />
				</colgroup>			
					<tr>
						<th scope="row"><b class="t_red">*</b> 비밀번호<br>(Password)</th>
						<td colspan="2">
							<input name="userIdx" type="hidden" value="${userIdx}">
							<input name="userPwd" type="hidden" value="${userPwd}">
							<input name="userPwdCheck" type="password" placeholder="PASSWORD" style="width:210px">
						</td>
						<td>
							<button type="button" class='button btn_yellow' onclick="checked()">확인</button>
						</td>
					</tr>
			</table> 
				<div class="btn_wrap view_btn" style="margin-top:25px">
					<button type='button' class='button btn_yellow' onclick="checkSubmit()">다음 단계</button>
				</div>

  			</form>
  		</div>
  </div>
  <div class="blank"></div>
</body>
</html>