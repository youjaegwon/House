<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<title>Home</title>	
<script src="http://code.jquery.com/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
${message }

<form action="/blog/selectSave" method="get"><input type="submit" value="저장된 게시글"></form>

	<c:forEach var="list" items="${list }">
		<ul>
			<a href ="/blog/blogDetail?bno=${list.bno }"><li id="img${list.bno}"><img src="/blog/filedownload?id=${list.fid}"  onERROR="this.src='${path}/resources/img/una_mattina.png'" style="width: 20%;"></li></a>
			<li>[번호]${list.bno }</li>
			<li>[제목]${list.btitle }</li>
			<li>[작성자]${list.mid }</li>
			<li>[작성날자]${list.bregdate }</li>
		</ul>
	</c:forEach>

<form action="/blog/blogInsert" method="post"><input type="submit" value="글작성">
<input type="hidden" name="mid" value="${login.mid}"></form>
</form>
</body>
</html>
