<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<html>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<head>
	<title>Home</title>
</head>
<body>

<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">블로그</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">질문/답변</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
${data.bno }

${data.btitle }

${data.mid }

${data.bregdate }

${data.bcontent }

${data.hit }
<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>

<c:if test="${not empty login }">
<c:if test="${login.ano eq 1}">
<form action="/blog/blogDelete" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="삭제하기"></form>
<form action="/blog/updateSaveGO" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="수정하기"></form>
</c:if>
</c:if>

</body>
</html>
