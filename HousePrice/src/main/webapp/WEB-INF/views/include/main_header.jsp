<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="all">
      <!-- Top bar-->
      <div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
              <c:if test="${not empty login}">
                <p>${login.mname} 님 환영합니다.</p>
              </c:if>
            </div>
            <div class="col-md-6">
              <div class="d-flex justify-content-md-end justify-content-between">
              <c:if test="${empty login}">
                <div class="login"><a href="#" data-toggle="modal" data-target="#login-modal" class="login-btn"><i class="fa fa-sign-in" style="margin-top:10px;"></i><span class="d-none d-md-inline-block">로그인</span></a><a href="/register/membership" class="signup-btn"><i class="fa fa-user" style="margin-top:10px;"></i><span class="d-none d-md-inline-block">회원가입</span></a></div>
              </c:if>
              <c:if test="${not empty login}">
                <c:choose>
                  <c:when test="${ 1 eq login.ano}">
                    <div class="login">
                      <a href="/admin/main/move" class="login-btn">
                        <span class="d-none d-md-inline-block">관리자페이지</span></a>
                      <a href="/mypage/move" class="signup-btn">
                        <span class="d-none d-md-inline-block">마이페이지</span></a>
                      <a href="/login/logout" class="signup-btn">
                        <span class="d-none d-md-inline-block">로그아웃</span></a>
                    </div>
                  </c:when>
                  <c:when test="${ 3 eq login.ano || 2 eq login.ano}">
                    <div class="login">
                      <a href="/mypage/move" class="signup-btn">
                        <span class="d-none d-md-inline-block">마이페이지</span></a>
                      <a href="/login/logout" class="signup-btn">
                        <span class="d-none d-md-inline-block">로그아웃</span></a>
                    </div>
                  </c:when>
                </c:choose>
              </c:if>
                <ul class="social-custom list-inline">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-facebook" style="margin-top:10px;"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus" style="margin-top:10px;"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-twitter" style="margin-top:10px;"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Top bar end-->
      <!-- Login Modal-->
      <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
        <div role="document" class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 id="login-modalLabel" class="modal-title">로그인</h4>
              <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
              <form action="${path}/login/loginPost" method="post">
                <div class="form-group">
                  <input id="email_modal" name="mid" type="text" placeholder="아이디" class="form-control">
                </div>
                <div class="form-group">
                  <input id="password_modal" name="mpw" type="password" placeholder="비밀번호" class="form-control">
                </div>
                <p class="text-center">
                  <button class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Log in</button>
                </p>
              </form>
              <p class="text-center text-muted">비밀번호를 잊으셨나요?&nbsp;<a href="/login/findpw"><strong>비밀번호찾기</strong></a></p>
              <p class="text-center text-muted">회원이 아니신가요?&nbsp;<a href="/register/membership"><strong>회원가입</strong></a></p>
            </div>
          </div>
        </div>
      </div>
      <!-- Login modal end-->
      <!-- Navbar Start-->
      <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="/" class="navbar-brand home"><img src="${path}/user/img/logo.png" alt="Universal logo" class="d-none d-md-inline-block"><img src="${path}/user/img/logo-small.png" alt="Universal logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown"><a href="javascript: void(0)">내년도 집값 예상</a>
                </li>
                <li class="nav-item dropdown menu-large"><a href="#" >블로그</a>
                </li>
                 <li class="nav-item dropdown menu-large"><a href="#" >뉴스</a>
                </li>
                 <li class="nav-item dropdown menu-large"><a href="/question/list" >질문/답변</a>
                </li>
                <!-- ========== Contact dropdown end ==================-->
              </ul>
            </div>
          </div>
        </div>
      </header>
      <!-- Navbar End-->