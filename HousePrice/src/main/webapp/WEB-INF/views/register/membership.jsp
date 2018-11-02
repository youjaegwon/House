<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp"%>



<body>
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">회원가입</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">회원가입</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="box">
						<h2 class="text-uppercase">New account</h2>
						<p class="lead">회원이 아니신가요?</p>
						<hr>
						<form action="membership" method="post" id="membership">
							<div class="form-group">
								<label for="email-login">아이디</label>
								<div class="input-group">

									<input id="mid" type="text" class="form-control" name="mid"
										placeholder="아이디"> <input name="mid"
										class="btn btn-lg btn-outline-primary" type="button" id="idck"
										value="중복 검사">
								</div>

								<div id="checkMsg"></div>
							</div>
							<div class="form-group">
								<label for="password-login">패스워드</label> <input id="mpw"
									name="mpw" type="password" class="form-control"
									placeholder="패스워드">
							</div>
							<div class="form-group">
								<label for="name-login">이름</label> <input id="mname"
									name="mname" type="text" class="form-control" placeholder="이름">
							</div>
							<div class="form-group">
								<label for="name-login">휴대폰</label> <input id="mphone"
									name="mphone" type="text" class="form-control"
									placeholder="휴대폰">
							</div>
							<div class="form-group">
								<input type="radio" name="mproyn" id="radio1" value="Y">
								<label for="radio1">전문가</label> <input type="radio"
									name="mproyn" id="radio2" value="N" checked="checked">
								<label for="radio2">일반</label> <input type="hidden" name="ano"
									value="3">
							</div>
							<div class="text-center">
								<button id="send" type="submit"
									class="btn btn-template-outlined">
									<i class="fa fa-user-md"></i> 회원가입
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript"
		src="${path}/register/js/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${path}/register/js/messages_ko.min.js"></script>
	<script type="text/javascript"
		src="${path}/register/js/additional-methods.min.js"></script>
	<script type="text/javascript">
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        //userid 를 param.
        var mid =  $("#mid").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : mid,
            url : "/register/idcheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#mid").focus();
                    
                
                }               
                else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#mid").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("아이디를 입력해주세요.");
            }
        });
    });
    
    $("#membership").validate({
        //validation이 끝난 이후의 submit 직전 추가 작업할 부분
        submitHandler: function() {
            var f = confirm("회원가입을 완료하겠습니까?");
            if(f){
                return true;
            } else {
                return false;
            }
        },
        //규칙
        rules: {
            mid: {
                required : true,
                minlength : 5,
                
            },
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
            mid: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
            },
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