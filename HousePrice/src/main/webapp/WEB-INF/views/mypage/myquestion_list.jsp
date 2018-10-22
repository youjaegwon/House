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
					<h3 class="box-title">내 질문</h3>
				</div>
				<div class="box-footer">
					<div class="form-group col-sm-10">
						<form action="/question/mypagesearch" method="get">
							<div class="input-group">
								<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
								<input type='hidden' name='mid' value='${login.mid}'> <input
									type='hidden' name='index' value='${p.index}'> <input
									type='hidden' name='pageStartNum' id='pageStartNum'
									value='${p.pageStartNum}'> <input type='hidden'
									name='listCnt' value='${p.listCnt}'> <input type="text"
									class="form-control" name="keyword" id="keywordInput"
									placeholder="제목"> <span class="input-group-btn">
									<button type="submit" class="btn btn-primary btn-flat"
										id="searchBtn">
										<i class="fa fa-search"></i> 검색
									</button>
								</span>
							</div>
						</form>
					</div>
				</div>

				<div class="box-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style="width: 30px">번호</th>
								<th>제목</th>
								<th style="width: 150px">작성시간</th>
								<th style="width: 60px">답변여부</th>
							</tr>
							<c:if test="${empty questions }">
							<tr><td colspan="4"><h3>질문이 없습니다.</h3></td></tr>
							</c:if>
							<c:if test="${not empty questions }">
							<c:forEach items="${questions}" var="questions">
								<tr>
									<td>${questions.rnum}</td>
									<td><a href="${path}/question/read?cno=${questions.cno}">${questions.ctitle}</a>
									</td>
									<td>${questions.cregdate}</td>
									<td>${questions.answered}</td>
								</tr>
							</c:forEach>
							</c:if>
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
						<form action="/question/mypage" method="get" id='frmPaging'>
							<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
							<input type='hidden' name='mid' id='mid' value='${login.mid}'>
							<input type='hidden' name='index' id='index' value='${p.index}'>
							<input type='hidden' name='pageStartNum' id='pageStartNum'
								value='${p.pageStartNum}'> <input type='hidden'
								name='listCnt' id='listCnt' value='${p.listCnt}'>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>