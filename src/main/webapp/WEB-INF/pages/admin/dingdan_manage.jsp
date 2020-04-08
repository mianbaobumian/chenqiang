<%--
  Created by IntelliJ IDEA.
  User: 50535
  Date: 2020/4/3
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<meta name="content-type" content="text/html; charset=UTF-8">
<head>
    <title>订单管理</title>
    <%@include file="../common/head.jsp" %>
</head>
<body>订单管理<br>
${requestScope.ddIndex.ddh}<br>
${requestScope.ddIndex.jyrq}<br>
${requestScope.ddIndex.ddzt}<br>
${requestScope.ddIndex.psfs}<br>

<div id="win"></div>
<table id="dg"></table>
</body>
</html>
