<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<h2>비밀번호 확인</h2>
<h4>중요정보에 접근하므로 비밀번호를 다시 확인합니다.</h4>
<form action="/register/detail" method="post">
<h3>${login.mid}</h3>
<input type="hidden" name="mid" value="${login.mid}">
<input type="password" name="mpw">
<input type="submit" value="확인">
</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>