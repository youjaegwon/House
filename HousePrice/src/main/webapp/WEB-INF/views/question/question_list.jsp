<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
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
						<div class="heading">
							<h2>질문 목록</h2>
						</div>
						<div class="box-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 30px; text-align:center;">번호</th>
										<th style="width: 250px; text-align:center;">제목</th>
										<th style="width: 100px; text-align:center;">작성자</th>
										<th style="width: 100px; text-align:center;">작성시간</th>
										<th style="width: 60px; text-align:center;">조회</th>
										<th style="width: 60px; text-align:center;">답변여부</th>
									</tr>
									<c:forEach items="${questions}" var="questions">
										<tr>
											<td style="text-align:center;">${questions.rnum}</td>
											<td style="text-align:center;"><a href="${path}/question/read?cno=${questions.cno}">${questions.ctitle}</a>
												<c:if test="${questions.qnew eq 1 }">
													<img src='${path}/question/img/new.jpg'>
												</c:if></td>
											<td style="text-align:center;">${questions.mid}</td>
											<td style="text-align:center;">${questions.cregdate}</td>
											<td style="text-align:center;"><span class="badge bg-red">${questions.chit}</span></td>
											<td style="text-align:center;">${questions.answered}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="box-footer">
							<div class="text-center">
								<!-- 5. paging view -->
								<ul class="pagination">
									<c:if test="${p.pageStartNum ne 1}">
										<!--맨 첫페이지 이동 -->
										<li class="page-item"><a class="page-link" onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
										<!--이전 페이지 이동 -->
										<li class="page-item"><a class="page-link" onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
									</c:if>

									<!--페이지번호 -->
									<c:forEach var='i' begin="${p.pageStartNum}"
										end="${p.pageLastNum}" step="1">
										<li class='pageIndex${i} page-item active'><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
									</c:forEach>

									<c:if test="${p.lastChk}">
										<!--다음 페이지 이동 -->
										<li class="page-item"><a class="page-link"
											onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
										<!--마지막 페이지 이동 -->
										<li class="page-item"><a class="page-link"
											onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
									</c:if>
								</ul>
								<form action="/question/list" method="get" id='frmPaging'>
									<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
									<input type='hidden' name='index' id='index' value='${p.index}'>
									<input type='hidden' name='pageStartNum' id='pageStartNum'
										value='${p.pageStartNum}'> <input type='hidden'
										name='listCnt' id='listCnt' value='${p.listCnt}'>
								</form>
							</div>
						</div>

						<div class="box-footer">
							<div class="pull-right">
								<c:if test="${not empty login }">
									<button type="button" class="btn btn-success btn-flat"
										id="writeBtn">
										<i class="fa fa-pencil"></i> 글쓰기
									</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
		var result = "${msg}";
		if (result == "writeSuccess") {
			alert("질문 등록이 완료되었습니다.");
		} else if (result == "modifySuccess") {
			alert("질문 수정이 완료되었습니다.");
		}
		$("#writeBtn").on("click", function() {
			self.location = "/question/write";
		});
	</script>
</body>
</html>