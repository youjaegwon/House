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
					<h1 class="h2">마이 페이지</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="bar">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- MENUS AND WIDGETS -->
					<div class="panel panel-default sidebar-menu with-icons">
						<div class="panel-heading">
							<h3 class="h4 panel-title">Categories</h3>
						</div>
						<div class="panel-body">
							<ul class="nav nav-pills flex-column text-sm">
								<li class="nav-item"><a
									href="/question/mypage?mid=${login.mid}" class="nav-link">내
										질문</a></li>
								<li class="nav-item"><a href="/answer/mypage?mid=${login.mid}" class="nav-link">내 답변</a></li>
								<li class="nav-item"><a href="/register/detail"
									class="nav-link">회원정보 수정</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">내 답변</h3>
						</div>
						<div class="box-footer">
							<div class="form-group col-sm-6">
								<form action="/answer/mypagesearch" method="get">
									<div class="input-group">
										<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
										<input type='hidden' name='mid' value='${login.mid}'>
										<input type='hidden' name='index' value='${p.index}'>
										<input type='hidden' name='pageStartNum' id='pageStartNum'
											value='${p.pageStartNum}'> <input type='hidden'
											name='listCnt' value='${p.listCnt}'> <input
											type="text" class="form-control" name="keyword" width="200px"
											id="keywordInput" placeholder="제목"> <span
											class="input-group-btn">
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
										<th style="width: 60px; text-align:center;">번호</th>
										<th style="width: 250px; text-align:center;">제목</th>
										<th style="width: 100px; text-align:center;">작성시간</th>
									</tr>
									<c:if test="${empty answers }">
										<tr>
											<td colspan="4" style="text-align:center;"><h3>답변이 없습니다.</h3></td>
										</tr>
									</c:if>
									<c:if test="${not empty answers}">
										<c:forEach items="${answers}" var="answers">
											<tr>
												<td style="text-align:center;">${answers.rnum}</td>
												<td style="text-align:center;"><a
													href="${path}/question/read?cno=${answers.ano}">${answers.atitle}</a>
												</td>
												<td style="text-align:center;">${answers.aregdate}</td>
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
								<form action="/answer/mypage" method="get" id='frmPaging'>
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
		</div>
	</section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>