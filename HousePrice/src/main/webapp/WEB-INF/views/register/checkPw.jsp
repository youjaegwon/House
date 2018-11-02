<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<li class="nav-item"><a href="/answer/mypage?mid=${login.mid}"  class="nav-link">내 답변</a></li>
								<li class="nav-item"><a href="/register/detail"
									class="nav-link">회원정보 수정</a></li>
							</ul>
						</div>
					</div>
				</div>
				
			<div class="col-lg-5">
				<div class="panel-heading">
					<h2  class="h4 panel-title">비밀번호 확인</h2>
				</div>
					<h4>중요정보에 접근하므로 비밀번호를 다시 확인합니다.</h4>
					<form action="/register/detail" method="post">
						
						<h3><input class="form-control" type="text" name="mid" value="${login.mid}" readonly></h3>
					<div class="input-group">
						<input class="form-control" type="password" name="mpw"  placeholder="비밀번호를 입력하세요">
						<input class="btn btn-template-main" type="submit" value="확인">
					</div> 
						
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>