<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<style type="text/css">
	.error{
		color:red;
	}
</style>
<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
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
            url : "/register/membership",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#userid").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#userpwd").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});
 
 
</script>


<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
	<h1>회원가입</h1>
	<form:form action="membership" method="post" commandName="membership">
		<fieldset>
			<table>
				<tr>
					<th>아이디</th>
					 <td><input type="text" name="mid" placeholder="아이디" />
						<form:errors path="mid" cssClass="error"/>
						<input type="button" id="idck" value="중복 검사">
					</td> 
					
				</tr>
				<tr>
					<th>패스워드</th>
					 <td><input type="password" name="mpw" placeholder="패스워드"/>
						<form:errors path="mpw" cssClass="error"/>
					</td> 
					
					
				</tr>
				<tr>
					<th>이름</th>
					 <td><input type="text" name="mname" placeholder="이름"/>
						<form:errors path="mname" cssClass="error"/>
					</td> 
					
				</tr>
				<tr>
					<th>휴대폰</th>
					 <td><input type="text" name="mphone" placeholder="휴대폰">
						<form:errors path="mphone" cssClass="error"/>
					</td> 
					
				</tr>
				
				<tr>
					<th>권한</th>
					 <td><input type="radio" name="mproyn" id="radio1" value="P">
						<label for="radio1">전문가</label>
						<input type="radio" name="mproyn" id="radi2" value="N">
						<label for="radio2">일반</label>
						<form:errors path="mproyn" cssClass="error"/>
					 </td> 
					
				</tr>
		<!-- 				권한 번호(ano) -->
				<tr>

				<td>
				<input type="hidden" name="ano" value="3">
				</td>
				</tr>
				
				<tr>
					
					<td><input type="submit" value="회원가입"/></td>
				</tr>
			</table>
		</fieldset>
	</form:form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>