<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="header-login-signup">

	<div class="header-limiter">

		<h1>
			<a href="#">HP<span>company</span></a>
		</h1>

		<nav>
			<a href="#">내년도 집값 예상</a> <a href="#">블로그</a> <a href="#">뉴스</a>
		</nav>
		<c:if test="${not empty login}">
			<ul>
				<li><p>${login.mname} 님 환영합니다.</p></li>
				<li><a href="/login/logout">로그아웃</a></li>
			</ul>
		</c:if>
		<c:if test="${empty login}">
			<ul>
				<li><a href="/login/login">로그인</a></li>
				<li><a href="/register/insert">회원가입</a></li>
			</ul>
		</c:if>
	</div>

</header>