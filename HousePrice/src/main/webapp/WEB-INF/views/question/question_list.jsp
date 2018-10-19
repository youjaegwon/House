<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div class="container-fluid">
		<div class="col-lg-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">게시글 목록</h3>
				</div>

				<div class="box-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style="width: 30px">번호</th>
								<th>제목</th>
								<th style="width: 100px">작성자</th>
								<th style="width: 150px">작성시간</th>
								<th style="width: 60px">조회</th>
								<th style="width: 60px">답변여부</th>
							</tr>
							<c:forEach items="${questions}" var="questions">
								<tr>
									<td>${questions.rnum}</td>
									<td><a href="${path}/question/read?cno=${questions.cno}">${questions.ctitle}</a>
									<c:if test="${year eq 1 }">
									<img src='${path}/question/img/new.jpg'>
									</c:if>
									</td>
									<td>${questions.mid}</td>
									<td>${questions.cregdate}</td>
									<td><span class="badge bg-red">${questions.chit}</span></td>
									<td>${questions.answered}</td>
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
								<li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
								<!--이전 페이지 이동 -->
								<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
							</c:if>

							<!--페이지번호 -->
							<c:forEach var='i' begin="${p.pageStartNum}"
								end="${p.pageLastNum}" step="1">
								<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
							</c:forEach>

							<c:if test="${p.lastChk}">
								<!--다음 페이지 이동 -->
								<li><a
									onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
								<!--마지막 페이지 이동 -->
								<li><a
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
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
		var result = "${msg}";
		if (result == "writeSuccess") {
			alert("질문 등록이 완료되었습니다.");
		} else if (result == "modifySuccess") {
			alert("질문 수정이 완료되었습니다.");
		})
	</script>
</body>
</html>