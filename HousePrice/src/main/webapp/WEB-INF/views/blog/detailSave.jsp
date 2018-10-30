<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

${data.bno }

${data.btitle }

${data.mid }

${data.bregdate }

${data.bcontent }

${data.hit }
<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>
<form action="/blog/blogDelete" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="삭제하기"></form>
<form action="/blog/updateSaveGO" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="수정하기"></form>

</body>
</html>
