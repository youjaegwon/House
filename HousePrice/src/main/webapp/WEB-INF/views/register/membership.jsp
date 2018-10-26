<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.error{
		color:red;
	}
</style>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${path}/register/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${path}/register/js/messages_ko.min.js"></script>
<script type="text/javascript" src="${path}/register/js/additional-methods.min.js"></script>
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
                    
                
                } else {
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
                
                alert("error : " + error);
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
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
            },
            mpw: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            },
           
            mname: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            },
            mphone: {
            	required : "필수로입력하세요",
                digits : "숫자만입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            }
        }
    });
}); 

</script>
</head>
<%@ include file="../include/head.jsp" %>
<body>

<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
	<h1>회원가입</h1>
	<form action="membership" method="post" id="membership">
		<fieldset>
			<table>
				<tr>
					<th>아이디</th>
					 <td>
					 <input type="text" name="mid" id="mid" placeholder="아이디" />
					 <input type="button" id="idck" value="중복 검사">
						<div id="checkMsg"></div>
					</td> 
					
				</tr>
				
				<tr>
					<th>패스워드</th>
					 <td>
					 <input type="password" id="mpw" name="mpw" placeholder="패스워드"/> 
						
					</td> 
					
					
				</tr>
				<tr>
					<th>이름</th>
					 <td><input type="text" id="mname" name="mname" placeholder="이름"/>
						
					</td> 
					
				</tr>
				<tr>
					<th>휴대폰</th>
					 <td><input type="text" id="mphone" name="mphone" placeholder="휴대폰">
						
					</td> 
					
				</tr>
				
				<tr>
					<th>권한</th>
					 <td><input type="radio" name="mproyn" id="radio1" value="Y">
						<label for="radio1">전문가</label>
						<input type="radio" name="mproyn" id="radi2" value="N" checked="checked">
						<label for="radio2">일반</label>
					
					 </td> 
					
				</tr>
		<!-- 				권한 번호(ano) -->
				<tr>

				<td>
				<input type="hidden" name="ano" value="3">
				</td>
				</tr>
				
				<tr>
					
					<td><input id="send" type="submit" value="회원가입"/></td>
				</tr>
			</table>
		</fieldset>
	</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>