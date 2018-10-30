<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">마이 페이지</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="bar">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- MENUS AND WIDGETS -->
					<div class="panel panel-default sidebar-menu with-icons">
						<div class="panel-heading">
							<h3 class="h4 panel-title">Categories</h3>
						</div>
						<div class="panel-body">
							<ul class="nav nav-pills flex-column text-sm">
								<li class="nav-item"><a
									href="/question/mypage?mid=${login.mid}" class="nav-link">내
										질문</a></li>
								<li class="nav-item"><a href="#" class="nav-link">내 답변</a></li>
								<li class="nav-item"><a href="/register/detail"
									class="nav-link">회원정보 수정</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<form action="update" method="post">
						<table>

							<tr>
								<td><input name="mid" type="hidden" value="${member.mid }"></td>
							</tr>

							<tr>
								<td>비밀번호<input name="mpw" type="password"></td>
							</tr>

							<tr>
								<td>이름<input name="mname" type="text"
									value=${member.mname }></td>
							</tr>

							<tr>
								<td>핸드폰<input name="mphone" type="text"
									value=${member.mphone }></td>
							</tr>

							<tr>
								<td><input type="submit" value="수정"></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>