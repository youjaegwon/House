<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/admin/head.jsp"%>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#ReadingInfoSelectBtn").click(function() {
				var formData = $("#ReadingInfoSelectForm").serialize();
				$.ajax({
					type : "POST",
					url : "/admin/member/exportUpdate",
					cache : false,
					data : formData,
					success : onSuccess
				});
			});
			$("#ReadingInfoSelectBtn2").click(function() {
				var formData2 = $("#ReadingInfoSelectForm2").serialize();
				$.ajax({
					type : "POST",
					url : "/admin/member/userUpdate",
					cache : false,
					data : formData2,
					success : onSuccess2
				});
			});
		});
		function onSuccess(){alert("전문가로 권한변경");
        self.location = "/admin/member/move";}
		function onSuccess2(){alert("사용자로 권한변경");
	    self.location = "/admin/member/move";}
	</script>
	<%@ include file="../../include/admin/left_header.jsp"%>
	<%@ include file="../../include/admin/main_header.jsp"%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">회원관리</h4>
							<p class="category">전문가 등록을 위한 권한지정</p>
						</div>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<th>아이디</th>
									<th>가입일</th>
									<th>전문가요청여부</th>
									<th>회원등급</th>
									<th>전문가등록</th>
								</thead>
								<tbody>
									<c:forEach var="member" items="${member}">
										<tr>
											<td>${member.mid}</td>
											<td>${member.mdate}</td>
											<td>${member.mproyn}</td>
											<td>${member.aname}</td>
											<c:if test="${3 eq member.ano}">
												<td><form id="ReadingInfoSelectForm">
														<input type="hidden" value="${member.mid}" name="mid"><input
															id="ReadingInfoSelectBtn" type="button" value="등록">
													</form></td>
											</c:if>
											<c:if test="${2 eq member.ano}">
												<td><form id="ReadingInfoSelectForm2">
														<input type="hidden" value="${member.mid}" name="mid"><input
															id="ReadingInfoSelectBtn2" type="button" value="해제">
													</form></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../include/admin/plugin_js.jsp"%>
</body>
</html>