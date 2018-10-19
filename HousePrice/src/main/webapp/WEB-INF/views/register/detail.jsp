<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>

<title>수정 페이지</title>
</head>
<body>

<%@ include file="../include/head.jsp" %>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<form action="update" method="post" >
<table>

<tr>
<td><input name="mid" type="hidden" value="${member.mid }"></td>
</tr>

<tr>
<td>비밀번호<input name="mpw" type="password" ></td>
</tr>

<tr>
<td>이름<input name="mname" type="text" value=${member.mname }></td>
</tr>

<tr>
<td>핸드폰<input name="mphone" type="text" value=${member.mphone }></td>
</tr>

<tr>
<td><input type="submit" value="수정"></td>
</tr>
	
</table>
</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>