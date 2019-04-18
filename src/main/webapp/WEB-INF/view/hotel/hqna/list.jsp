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
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  // alert(e.target); // newly activated tab
		  // e.relatedTarget // previous active tab
		  var tab=$(this).attr("aria-controls");
		  var id=$("#tabContent"+tab);
		  
		  var url;
		  if(tab=="1") {
			  url="<%=cp%>/hotel/hqna/tab1";
		  } else if(tab=="2") {
			  url="<%=cp%>/hotel/hqna/tab2";
		  } else if(tab=="3") {
			  url="<%=cp%>/hotel/hqna/tab3";
		  }
		  
		  viewTabContent(id, url);
	});	
});

function viewTabContent(id, url) {
	$.post(url, {}, function(data){
		  id.html(data);
	  });
}


//전역변수
var pageNo = 1;
var key = "all";
var value = "";

function ajaxHTML(url, type, query, id) {//url에 query를갖고 처리한 data를 리턴한 jsp에 뿌려주고 해당 jsp의 html을 해당 id자리에 뿌려줌
	
	$.ajax({ 
		type:type
		,url:url
		,data:query
		,success:function(data){
			$("#"+id).html(data);
		
		}
		,beforeSend:function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e) {
			if(e.status==403){  
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}		
	});
}

function ajaxJSON(url, type, query, mode) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data){
			if(mode=="delete") {
				if(data.state=="flase"){
					alert("삭제 권한이 없습니다.");
				}else{
					listPage(pageNo);
				}
			}
			
		}
		,beforeSend:function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e) {
			if(e.status==403){  
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}		
	});
}


$(function () {
	listPage(1);
});

function  listPage2(page) {
	//페이징
	pageNo=page; 
	
	var id="tabContent1";
	var url="<%=cp%>/hotel/hqna/tab1";
	var query="pageNo="+page;
	if(value!="") {
		query +="&key="+key+"&value="+encodeURIComponent(value);
	}
	
	ajaxHTML(url, "get", query, id);
}

function reloadHqna() {
	key=$("all")
	value="";
	
	listPage(1);
}

function HqnaBoard(qnaCode){
	var id="tabContent1";
	var url="<%=cp%>/hotel/hqna/article";
	var query="qnaCode="+qnaCode+"&pageNo="+pageNo;
	if(value !="") {
		query+="&key="+key+"&value="+encodeURIComponent(value);
	}
	
	ajaxHTML(url, "get", query, id);
}

function updateHqna(qnaCode) {
	var url="<%=cp%>/hotel/hqna/update";
	var query="qnaCode="+qnaCode+"&pageNo="+pageNo;
	if(value !="") {
		query +="&key="+key+"&value="+encodeURIComponent(value);
	}
	
	ajaxHTML(url, "get", query, "tabContent1");
}

function deleteHqna(qnaCode) {
	
	if(!confirm("글을 삭제하시겠습니까?")){
		return;
	}
	var url="<%=cp%>/hotel/hqna/delete";
	var query="qnaCode="+qnaCode;
	
	ajaxJSON(url, "post", query, "delete");
}
</script>

</head>
<body>

	
<div style="margin: 30px auto; width:60%;">
	<div role="tabpanel">
	  <ul id="myTab" class="nav nav-tabs" role="tablist">
	      <li role="presentation"  class="active"><a href="#tabContent1" aria-controls="1" role="tab" data-toggle="tab">질&nbsp;문&nbsp;답&nbsp;변</a></li>
	      <li role="presentation"><a href="#tabContent2" aria-controls="2" role="tab" data-toggle="tab">공&nbsp;지&nbsp;사&nbsp;항</a></li>
	      <li role="presentation"><a href="#tabContent3" aria-controls="3" role="tab" data-toggle="tab">F&nbsp;A&nbsp;Q</a></li>
	  </ul>
	
	  <div class="tab-content">
	      <div role="tabpanel" class="tab-pane active" id="tabContent1"></div>
	      <div role="tabpanel" class="tab-pane" id="tabContent2"></div>
	      <div role="tabpanel" class="tab-pane" id="tabContent3"></div>
	  </div>
    </div>
</div>	
</body>
</html>