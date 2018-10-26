<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
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
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<form action="update" method="post" id="update">
<table>

<tr>
<td><input name="mid" id="mid" type="hidden" value="${member.mid }"></td>
</tr>

<tr>
<td>비밀번호<input name="mpw" id="mpw"  type="password" ></td>
</tr>

<tr>
<td>이름<input name="mname" id="mname" type="text" value=${member.mname }></td>
</tr>

<tr>
<td>핸드폰<input name="mphone" id="mphone" type="text" value=${member.mphone }></td>
</tr>

<tr>
<td><input type="submit" value="수정"></td>
</tr>
	
</table>
</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
</body>
</html>