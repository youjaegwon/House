<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>

<title>수정 페이지</title>
</head>
<body>
<sf:form action="update" method="post" >
아이디<input name="mid" type="text" value="${member.mid }">
비밀번호<input name="mpw" type="text" value=${member.mpw }>
이름<input name="mname" type="text" value=${member.mname }>
핸드폰<input name="mphone" type="text" value=${member.mphone }>
	<input type="submit" value="수정">
	<a href="delete?mid=${member.mid }">탈퇴</a>
</sf:form>
</body>
</html>