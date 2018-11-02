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
							<h4 class="title">블로그관리</h4>
							<p class="category">블로그를 위한 게시지정</p>
						</div>
						<form action="findBymid" method="get">
						<div>
						 	<input type='hidden' name='index' value='${p.index}'>
							<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
							<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'> 					
							
							<div class="form-group col-sm-10">
							<div class="input-group">
							<input type="text" class="form-control" name="mid" id="mid" placeholder="제목입력"> <span class="input-group-btn">
							<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-search"></i> 검색
							</button>
							</span>
							</div>
							</div>
						</div>
						</form>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<th><input type="checkbox" id="checkall" name="checkall"></th>
									<th>No.</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성시간</th>
									<th>게시여부</th>
								</thead>
								<tbody>
								
									<c:forEach var="list" items="${list}">
										<tr>
											<td><input type="checkbox" name="chk" id="${list.bno }" value="${list.bno }"></td>
											<td>${list.bno }</td>
											<td><a href ="/blog/blogDetailSave?bno=${list.bno }">${list.btitle }</td>
											<td>${list.hit}</td>
											<td>${list.bregdate}</td>
											<td>${list.y_n}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="box-footer">
							<div class="text-center">
								<!-- 5. paging view -->
								<ul class="pagination">
									<c:if test="${pageGroupResult.beforePage ==true}">
										<!--이전 페이지 이동 -->
										<li class="page-item"><a class="page-link" href="selectSave?reqPage=${pageGroupResult.selectPageNumber - 1}">&lsaquo;</a></li>
									</c:if>

									<!--페이지번호 -->
									<c:forEach begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}" var="count" step="1">
										<li class='pageIndex${i} page-item active'><a class="page-link"  href="selectSave?reqPage=${count}">${count}</a></li>
									</c:forEach>

									<c:if test="${pageGroupResult.afterPage ==true}">
										<!--다음 페이지 이동 -->
										<li class="page-item"><a class="page-link" href="selectSave?reqPage=${pageGroupResult.selectPageNumber + 1}">&rsaquo;</a></li>
										<!--마지막 페이지 이동 -->
									</c:if>
								</ul>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../../include/admin/plugin_js.jsp"%>
</body>
</html>