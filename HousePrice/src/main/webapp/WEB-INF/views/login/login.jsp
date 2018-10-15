<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body class="hold-transition login-page">
	<%@ include file="../include/main_header.jsp"%>
<div class="container-fluid">
	<div class="login-box">
		<div class="login-logo">
			<a href="${path}/"> <b>hp</b>&nbsp company
			</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">로그인 페이지</p>

			<form action="${path}/login/loginPost" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="mid" class="form-control"
						placeholder="아아디"> <span
						class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="mpw" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" name="usercookie">
								로그인유지
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">
							<i class="fa fa-sign-in"></i> 로그인
						</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<a href="#">비밀번호 찾기</a><br> <a href="${path}/register/insert"
				class="text-center">회원가입</a>

		</div>
		<!-- /.login-box-body -->
	</div>
</div>
	<!-- /.login-box -->
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script>

    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~");
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>