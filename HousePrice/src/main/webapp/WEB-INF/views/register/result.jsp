<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<h2>${result}</h2>
<h3>다시 로그인 해주세요!</h3>
<a href="/include/main_header">홈으로</a>
<a href="/login/login">로그인</a>
</div>
<%@ include file="../include/main_footer.jsp" %>
</html>