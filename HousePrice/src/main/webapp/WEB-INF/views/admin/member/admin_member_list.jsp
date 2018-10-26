<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/admin/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<body>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".ReadingInfoSelectBtn").click(function() {
				var formData = $("#ReadingInfoSelectForm").serialize();
				var mid = $(this).parent().parent().children().eq(0).text();
				$.ajax({
					type : "POST",
					url : "/admin/member/expertUpdate",
					cache : false,
					data : {"mid":mid},
					success : onSuccess
				});
			});
			$(".ReadingInfoSelectBtn2").click(function() {
				var formData2 = $("#ReadingInfoSelectForm2").serialize();
				var mid = $(this).parent().parent().children().eq(0).text();
				$.ajax({
					type : "POST",
					url : "/admin/member/userUpdate",
					cache : false,
					data : {"mid":mid},
					success : onSuccess2
				
				});
			});
 		});
		function onSuccess(){alert("전문가로 권한변경");
        self.location = "/admin/member/move?index="+${p.index};}
		function onSuccess2(){alert("사용자로 권한변경");
 	    self.location = "/admin/member/move?index="+${p.index};}
	</script>
	<%@ include file="../../include/admin/left_header.jsp"%>
	<%@ include file="../../include/admin/main_header.jsp"%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">회원관리</h4>
							<p class="category">전문가 등록을 위한 권한지정</p>
						</div>
						<form action="findBymid" method="get">
						<div>
						 	<input type='hidden' name='index' value='${p.index}'>
							<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
							<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'> 
							<input type="text" placeholder="아이디입력" id="mid" name="mid">
							<input type="submit" value="검색">
						</div>
						</form>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<th>아이디</th>
									<th>가입일</th>
									<th>전문가요청여부</th>
									<th>회원등급</th>
									<th>전문가등록</th>
								</thead>
								<tbody>
								<c:choose>
								<c:when test="${not empty searchId}">
										<c:forEach var="find" items="${idlist}">
											<tr>
												<td>${find.mid }</td>
												<td>${find.mdate }</td>
												<td>${find.mproyn }</td>
												<td>${find.aname}</td>
												<c:if test="${3 eq find.ano}">
													<td><input class="ReadingInfoSelectBtn" type="button" value="등록"></td>
												</c:if>
												<c:if test="${2 eq find.ano}">
													<td><input class="ReadingInfoSelectBtn2" type="button" value="해제"></td>
												</c:if>
											
												
											</tr>
										
										</c:forEach>
			
								</c:when>
								
								
								<c:otherwise>
									<c:forEach var="member" items="${member}">
										<tr>
											<td>${member.mid}</td>
											<td>${member.mdate}</td>
											<td>${member.mproyn}</td>
											<td>${member.aname}</td>
											<c:if test="${3 eq member.ano}">
												<td><input class="ReadingInfoSelectBtn" type="button" value="등록"></td>
											</c:if>
											<c:if test="${2 eq member.ano}">
												<td><input class="ReadingInfoSelectBtn2" type="button" value="해제"></td>
											</c:if>
										</tr>
									</c:forEach>
						
								</c:otherwise>
					
					
								</c:choose>
								
				
								</tbody>
								
							</table>
							
					<div class="box-footer">
						<div class="text-center">
					
						<ul class="pagination">
							<c:if test="${p.pageStartNum ne 1}">
								
								<li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
								
								<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
							</c:if>

							
							<c:forEach var='i' begin="${p.pageStartNum}"
								end="${p.pageLastNum}" step="1">
								<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
							</c:forEach>

							<c:if test="${p.lastChk}">
								
								<li><a
									onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
								
								<li><a
									onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
									 
							</c:if>
						</ul>
						<c:if test="${not empty searchId}">
						<form action="findBymid" method="get" id='frmPaging'>
							<input type='hidden' name='mid' value='${searchId}'>
							<input type='hidden' name='index' id='index' value='${p.index}'>
							<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
							<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>
						</form>
						</c:if>
						<c:if test="${empty searchId}">
						<form action="/admin/member/move" method="get" id='frmPaging'>
							<input type='hidden' name='index' id='index' value='${p.index}'>
							<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
							<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>
						</form>
						</c:if>
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