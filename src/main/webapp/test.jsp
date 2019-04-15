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
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Default functionality</title>
  <style>
  #draggable { width: 150px; height: 150px; padding: 0.5em; }
  </style>
      <script src="<%=cp%>/resources/js/lib/jquery.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/jquery-ui-1.12.1.min.js"></script>
  <script>
  $( function() {
    $( ".ui-widget-content" ).draggable();
  } );
  </script>
</head>
<body>
 
<div id="draggable" class="ui-widget-content">
  <p>Drag me around</p>
</div>
 
 
</body>
</html>