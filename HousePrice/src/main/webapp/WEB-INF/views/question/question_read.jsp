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
						<img class="img-circle img-bordered-sm"
							src="/dist/img/user1-128x128.jpg" alt="user image"> <span
							class="username"> <a href="#">${question.mid}</a>
						</span> <span class="description"><fmt:formatDate
								pattern="yyyy-MM-dd a HH:mm" value="${question.cregdate}" /></span>
					</div>
				</div>
				<div class="box-footer">
					<form role="form" method="post">
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
				self.location = "/question/list;
			});

		});
	</script>
</body>
</html>