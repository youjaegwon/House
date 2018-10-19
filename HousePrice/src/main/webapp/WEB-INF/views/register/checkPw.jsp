<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<h2>비밀번호 확인</h2>
<h4>중요정보에 접근하므로 비밀번호를 다시 확인합니다.</h4>
<form action="detail" method="post">
<h3><input type="text" value="${check.mid }"></h3>
<input type="password" name="mpw">
<input type="submit" value="확인">
</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>