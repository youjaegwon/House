<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="utf-8"%>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">블로그</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">블로그</li>
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
							<h2>블로그 목록</h2>
						</div>

<div id="blog-listing-medium" class="col-md-9">
              <section class="post">
               <div class="row">
               						<c:forEach var="list" items="${list}">
                  <div class="col-md-4">
						 <div class="image"><a href="/blog/blogDetail?bno=${list.bno }">
						 <img src="/blog/filedownload?id=${list.fid}" onERROR="this.src='${path}/resources/img/una_mattina.png'" alt="Example blog post alt" class="img-fluid" width="300px" height="300px"></a></div>
					</div>
					<div class="col-md-8">
								<h2 class="h3 mt-0"><a href="/blog/blogDetail?bno=${list.bno }">${list.btitle }</a></h2>
								<div class="d-flex flex-wrap justify-content-between text-xs">
								<p class="author-category">By <a href="#">${list.mid }</a></p>
							 	<p class="date-comments"><a href="blog-post.html"><i class="fa fa-calendar-o"></i> ${list.bregdate }</a><a href="blog-post.html"><i class="fa fa-comment-o"></i> 8 Comments</a></p>
							 	</div>
							 	</div>
						</c:forEach>
						</div>
						<div class="box-footer">
							<div class="text-center">
								<!-- 5. paging view -->
								<ul class="pagination">
									<c:if test="${pageGroupResult.beforePage ==true}">
										<!--이전 페이지 이동 -->
										<li class="page-item"><a class="page-link" href="/blog/?reqPage=${pageGroupResult.selectPageNumber - 1}">&lsaquo;</a></li>
									</c:if>

									<!--페이지번호 -->
									<c:forEach begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}" var="count" step="1">
										<li class='pageIndex${i} page-item active'><a class="page-link"  href="/blog/?reqPage=${count}">${count}</a></li>
									</c:forEach>

									<c:if test="${pageGroupResult.afterPage ==true}">
										<!--다음 페이지 이동 -->
										<li class="page-item"><a class="page-link" href="/blog/?reqPage=${pageGroupResult.selectPageNumber + 1}">&rsaquo;</a></li>
										<!--마지막 페이지 이동 -->
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
						
						</section>
						</div>
						<c:if test="${not empty login }">
							<c:if test="${login.ano eq 1}">
								<form action="/blog/blogInsert" method="post">
									<input type="submit" value="글작성"> <input type="hidden"
										name="mid" value="${login.mid}">
								</form>
							</c:if>
						</c:if>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>
