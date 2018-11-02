<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<style type="text/css">
.error {
	color: red;
}
</style>
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
								<li class="nav-item"><a href="/answer/mypage?mid=${login.mid}"class="nav-link">내 답변</a></li>
								<li class="nav-item"><a href="/register/detail"
									class="nav-link">회원정보 수정</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6"> 
				<form action="update" method="post" id="update">
				<hr>
				<h2 class="text-uppercase">Update</h2>
				 <p class="lead">회원정보 수정</p>
				 <hr>
					<div class="form-group">
						 <label for="mid">아이디</label>
						 <input class="form-control" name="mid" type="text" value="${member.mid }" readonly>
					</div>
				
					<div class="form-group">
						<label for="mpw">비밀번호</label>
						<input class="form-control" name="mpw" type="password" placeholder="패스워드">
					</div>
					<div class="form-group">
						<label for="mname">이름</label>
						<input class="form-control" name="mname" type="text" value=${member.mname } placeholder="이름">
					</div>

					<div class="form-group">
						<label for="mphone">핸드폰</label>
						<input class="form-control" name="mphone" type="text" value=${member.mphone } placeholder="휴대폰">
					</div>

					<input class="btn btn-lg btn-template-main" type="submit" value="수정">
					<hr>
				</form>
				</div>
				</div>
			  </div>
			 
			
	</section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript" src="${path}/register/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${path}/register/js/messages_ko.min.js"></script>
<script type="text/javascript" src="${path}/register/js/additional-methods.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#update").validate({
	    //validation이 끝난 이후의 submit 직전 추가 작업할 부분
	    submitHandler: function() {
        var f = confirm("수정을 완료하겠습니까?");
        if(f){
            return true;
        } else {
            return false;
        }
    },
    //규칙
    rules: {
       
        mpw: {
            required : true,
            minlength : 4
        },
       
        mname: {
            required : true,
            minlength : 2
        },
        mphone: {
        	required:true,
            digits : true,
            minlength : 10
        }
        
    },
    //규칙체크 실패시 출력될 메시지
    messages : {
      
        mpw: {
            required : "필수로 입력하세요",
            minlength : "최소 {0}글자이상이어야 합니다"
        },
       
        mname: {
            required : "필수로 입력하세요",
            minlength : "최소 {0}글자이상이어야 합니다"
        },
        mphone: {
        	required : "필수로 입력하세요",
            digits : "숫자만 입력하세요",
            minlength : "최소 {0}글자이상이어야 합니다"
        }
    }
});
}); 
</script>
</body>
</html>