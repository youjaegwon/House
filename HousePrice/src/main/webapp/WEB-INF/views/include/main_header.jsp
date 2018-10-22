<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="header-login-signup">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="header-limiter">

		<h1>
			<a href="#">HP<span>company</span></a>
		</h1>

		<nav>
			<a href="#">내년도 집값 예상</a><a href="#">블로그</a><a href="#">뉴스</a><a href="/question/list">질문/답변</a>
		</nav>
		<c:if test="${not empty login}">
		    <c:choose>
                <c:when test="${ 1 eq login.ano}">
                    <ul>
                        <li><p>${login.mname} 님 환영합니다.</p></li>
                        <li><a href="/admin/main/move">관리자 페이지</a></li>
                        <li><a href="/mypage/move">마이 페이지</a></li>
                        <li><a href="/login/logout">로그아웃</a></li>
                    </ul>
                </c:when>
                <c:when test="${ 3 eq login.ano || 2 eq login.ano}">
                    <ul>
                        <li><p>${login.mname} 님 환영합니다.</p></li>
                        <li><a href="/mypage/move">마이 페이지</a></li>
                        <li><a href="/login/logout">로그아웃</a></li>
                    </ul>
                </c:when>
            </c:choose>
		</c:if>
		<c:if test="${empty login}">
			<ul>
				<li><a href="/login/login">로그인</a></li>
				<li><a href="/register/membership">회원가입</a></li>
			</ul>
		</c:if>
	</div>

</header>