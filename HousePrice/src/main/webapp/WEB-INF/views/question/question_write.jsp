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
						<form role="form" id="writeForm" method="post"
							action="${path}/question/write">
							<div class="box-primary">
								<div class="col-md-7">
									<h1 class="h2">질문 작성</h1>
								</div>
								<div class="box-body">
									<div class="form-group">
										<label for="title">제목</label> <input class="form-control"
											id="title" name="ctitle" placeholder="제목을 입력해주세요">
									</div>
									<div class="form-group">
										<label for="content">내용</label>
										<textarea class="form-control" id="content" name="ccontent"
											rows="10" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
									</div>
									<div class="form-group">
										<label for="writer">작성자</label> <input type="hidden"
											name="mid" value="${login.mid}">
										<p>${login.mid}</p>
									</div>
								</div>
								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="listbtt">
										<i class="fa fa-list"></i> 목록
									</button>
									<div class="pull-right">
										<button type="reset" class="btn btn-warning">
											<i class="fa fa-reply"></i> 초기화
										</button>
										<button type="submit" class="btn btn-success">
											<i class="fa fa-save"></i> 저장
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

			$("#listbtt").on("click", function() {
				self.location = "/question/list";
			});

		});
	</script>
</body>
</html>