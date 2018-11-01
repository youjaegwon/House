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
						<form id="writeForm" method="post"
							action="${path}/answer/modify">
							<div class="box-primary">
								<div class="heading">
									<h2>답변 수정</h2>
								</div>
								<div class="box-body">
									<input type="hidden" name="cno" value="${question.cno}">
									<input type="hidden" name="ano" value="${answer.ano}">
									<div class="form-group">
										<label for="title">제목</label> <input class="form-control"
											id="title" name="atitle" placeholder="제목을 입력해주세요"
											value="${answer.atitle}">
									</div>
									<div class="form-group">
										<label for="content">내용</label>
										<textarea class="form-control" id="content" name="acontent"
											rows="10" placeholder="내용을 입력해주세요" style="resize: none;">${answer.acontent}</textarea>
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> <input class="form-control"
											id="writer" name="mid" value="${answer.mid}" readonly>
									</div>
								</div>
								<div class="box-footer">
									<div class="pull-right">
										<button type="button" class="btn btn-warning cancelBtn">
											<i class="fa fa-trash"></i> 취소
										</button>
										<button type="submit" class="btn btn-success modBtn">
											<i class="fa fa-save"></i> 수정 저장
										</button>
									</div>
								</div>
							</div>
						</form>
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