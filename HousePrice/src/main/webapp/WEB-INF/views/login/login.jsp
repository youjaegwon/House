<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body class="hold-transition login-page">
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">로그인</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">로그인</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<section class="bar">
				<div class="row">
					<div role="document" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 id="login-modalLabel" class="modal-title">로그인</h4>
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="${path}/login/loginPost" method="post">
									<div class="form-group">
										<input id="email_modal" name="mid" type="text"
											placeholder="아이디" class="form-control">
									</div>
									<div class="form-group">
										<input id="password_modal" name="mpw" type="password"
											placeholder="비밀번호" class="form-control">
									</div>
									<p class="text-center">
										<button class="btn btn-template-outlined">
											<i class="fa fa-sign-in"></i> Log in
										</button>
									</p>
								</form>
								<p class="text-center text-muted">
									비밀번호를 잊으셨나요?&nbsp;<a href="/login/findpw"><strong>비밀번호찾기</strong></a>
								</p>
								<p class="text-center text-muted">
									회원이 아니신가요?&nbsp;<a href="/register/membership"><strong>회원가입</strong></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- /.login-box -->
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>