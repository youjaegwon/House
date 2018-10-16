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