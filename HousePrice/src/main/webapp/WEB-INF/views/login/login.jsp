<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body class="hold-transition login-page">
	<%@ include file="../include/main_header.jsp"%>
	<div class="container-fluid">
		<div class="card card-container">
			<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
			<img id="profile-img" class="profile-img-card"
				src="https://png.pngtree.com/element_our/md/20180516/md_5afc6f72777ce.jpg" />
			<p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin" action="${path}/login/loginPost"
				method="post">
				<span id="reauth-email" class="reauth-email"></span> <input
					type="text" id="inputEmail" name="mid" class="form-control"
					placeholder="아이디" required autofocus> <input
					type="password" id="inputPassword" name="mpw" class="form-control"
					placeholder="비밀번호" required>
				<div id="remember" class="checkbox">
					<label> <input type="checkbox" value="remember-me">
						로그인 유지
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">로그인</button>
			</form>
			<!-- /form -->
			<p>비밀번호를 잊으셨나요? <a href="/login/findpw" class="forgot-password">비밀번호 찾기</a></p>
			<p>회원이 아니신가요? <a href="/register/membership" class="forgot-password">회원가입 </a></p>
		</div>
		<!-- /card-container -->
	</div>
	<!-- /.login-box -->
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script>
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