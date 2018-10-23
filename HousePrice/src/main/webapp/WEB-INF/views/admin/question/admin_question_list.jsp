<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/admin/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<body>
	<%@ include file="../../include/admin/left_header.jsp"%>
	<%@ include file="../../include/admin/main_header.jsp"%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">질문관리</h4>
						</div>
						<form action="/admin/question/searchlist" method="get">
							<input type='hidden' name='index' value='${p.index}'> <input
								type='hidden' name='pageStartNum' id='pageStartNum'
								value='${p.pageStartNum}'> <input type='hidden'
								name='listCnt' id='listCnt' value='${p.listCnt}'>
							<div class="box-footer">
								<div class="form-group col-sm-2">
									<select class="form-control" name="searchType" id="searchType">
										<option value="n">:::::: 선택 ::::::</option>
										<option value="t">제목</option>
										<option value="c">내용</option>
										<option value="w">작성자</option>
									</select>
								</div>
								<div class="form-group col-sm-10">
									<div class="input-group">
										<input type="text" class="form-control" name="keyword"
											id="keywordInput" placeholder="검색어"> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-primary btn-flat"
												id="searchBtn">
												<i class="fa fa-search"></i> 검색
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
						<div class="content table-responsive table-full-width">
							<form action="/admin/question/delete" method="get" id='userForm'
								name='userForm'>
								<button type="submit" class="btn btn-success btn-flat"
									id="writeBtn">
									<i class="fa fa-pencil"></i> 선택삭제
								</button>

								<table class="table table-hover table-striped">
									<thead>
										<th><input type="checkbox" id="allCheck"
											onclick="allChk(this);" /></th>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자아이디</th>
										<th>등록일자</th>
									</thead>
									<tbody>
										<c:if test="${empty questions}">
										<tr>
										<td colspan="5">
										<h2>질문이 없습니다.</h2>
										</td>
										</tr>
										</c:if>
										<c:if test="${not empty questions}">
											<c:forEach var="question" items="${questions}">
												<tr>
													<td><input ﻿ name="RowCheck" type="checkbox"
														value="${question.cno}" /></td>
													<td>${question.ctitle}</td>
													<td>${question.ccontent}</td>
													<td>${question.mid}</td>
													<td>${question.cregdate}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</form>
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
								<form action="/admin/question/list" method="get" id='frmPaging'>
									<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
									<input type='hidden' name='index' id='index' value='${p.index}'>
									<input type='hidden' name='pageStartNum' id='pageStartNum'
										value='${p.pageStartNum}'> <input type='hidden'
										name='listCnt' id='listCnt' value='${p.listCnt}'>
								</form>
							</div>
						</div>
						<div class="box-footer">
							<div class="pull-right"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../include/admin/plugin_js.jsp"%>
	<script type="text/javascript">

	// 1.모두 체크
	  function allChk(obj){
	      var chkObj = document.getElementsByName("RowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true; 
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false; 
	           }
	          }
	      }
	  } ﻿
	</script>
</body>
</html>