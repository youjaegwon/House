<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div class="container fluid">
		<div class="col-lg-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">글제목 : ${question.ctitle}</h3>
				</div>
				<div class="box-body" style="height: 700px">
					${question.ccontent}</div>
				<div class="box-footer">
					<div class="user-block">
						<span
							class="username"> <a href="#">${question.mid}</a>
						</span>${question.cregdate}
					</div>
				</div>
				<div class="box-footer">
					<form role="form" method="get">
						<input type="hidden" name="cno" value="${question.cno}">
					</form>
					<button type="submit" class="btn btn-primary listBtn">
						<i class="fa fa-list"></i> 목록
					</button>
					<div class="pull-right">
						<button type="submit" class="btn btn-warning modBtn">
							<i class="fa fa-edit"></i> 수정
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			var mid = "${login.mid}"
			console.log(formObj);

			$(".modBtn").on("click", function() {
				formObj.attr("action", "/question/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".listBtn").on("click", function() {
				self.location = "/question/list";
			});

		});
	</script>
</body>
</html>