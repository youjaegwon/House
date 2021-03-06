<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">질문/답변</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">질문/답변</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<section class="bar">
				<div class="row">
					<div class="col-lg-12">
						<div class="box-body">
							<div class="form-group">
								<h3 class="box-title">질문 : ${question.ctitle}</h3>
							</div>
							<div class="form-group" style="height: 400px">
								${question.ccontent}</div>
							<div class="box-footer">
								<div class="user-block">
									<span class="username">작성자 : ${question.mid} </span><br />작성일자
									: ${question.cregdate}<br />
								</div>
							</div>
							<div class="box-footer">
								<form role="form" method="get">
									<input type="hidden" name="cno" value="${question.cno}">
								</form>
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> 목록
								</button>
								<c:if test="${login.mid eq question.mid }">
									<div class="pull-right">
										<button type="submit" class="btn btn-warning modBtn">
											<i class="fa fa-edit"></i> 수정
										</button>
									</div>
								</c:if>
							</div>
						</div>
						<br />
						<br />
						<c:if test="${empty answer}">
							<div class="box-body">
								<h4>답변이 없습니다.</h4>
							</div>
							<form action="${path}/answer/write" method="get">
								<input type="hidden" name="cno" value="${question.cno}">
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> 답변등록
								</button>
							</form>
						</c:if>
						<c:if test="${not empty answer}">
							<div class="box-body">
								<div class="form-group">
									<h3 class="box-title">답변 : ${answer.atitle}</h3>
								</div>
								<div class="form-group" style="height: 400px">
									<c:out value=" ${answer.acontent}"></c:out> </div>
								<div class="box-footer">
									<div class="user-block">
										<span class="username">작성자 : ${answer.mid} </span><br />작성일자 :
										${answer.aregdate}<br />
									</div>
								</div>
								<div class="box-footer">
									<c:if test="${login.mid eq answer.mid }">
										<div class="pull-right">
											<form action="${path}/answer/modify" method="get">
												<input type="hidden" name="cno" value="${answer.cno}">
												<button type="submit" class="btn btn-warning modBtn">
													<i class="fa fa-edit"></i> 수정
												</button>
											</form>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</section>
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