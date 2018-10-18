<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
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
								<th style="width: 60px; text-align:center;">번호</th>
								<th style="width: 100px">제목</th>
								<th style="width: 100px">작성자</th>
								<th style="width: 150px">작성시간</th>
								<th style="width: 60px">조회</th>
								<th style="width: 60px">답변여부</th>
							</tr>
							<c:forEach items="${questions}" var="questions">
								<tr>
									<td>${questions.rnum}</td>
									<td><a href="${path}/question/read?cno=${questions.cno}">${questions.ctitle}</a></td>
									<td>${questions.mid}</td>
									<td><fmt:formatDate value="${questions.cregdate}"
											pattern="yyyy-MM-dd a HH:mm" /></td>
									<td><span class="badge bg-red">${questions.chit}</span></td>
									<td>${questions.answered}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="${path}/question/list?page=${pageMaker.startPage - 1}">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li>
									<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>
									<a href="${path}/question/list?page=${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${path}/question/list?page=${pageMaker.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
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
		}
	</script>
</body>
</html>