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
					<h1 class="h2">뉴스 크롤링</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">뉴스 크롤링</li>
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
							<h2>뉴스 기사 검색하기</h2>
							<form method="get" action="list">
								<input type="text" name="keyword" placeholder="검색어를 입력하세요">
								<input type="submit" value="검색">
							</form>
						</div>
						<div class="box-body">
							<form method="post" action="crawling_save">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 30px; text-align: center;">번호</th>
										<th style="width: 250px; text-align: center;">제목</th>
										<th style="width: 100px; text-align: center;">날짜</th>
										<th style="width: 30px; text-align: center;">선택</th>
									</tr>
									
									<c:forEach items="${news_crawling}" var="news">
										<tr data-ano="${news.ano}" data-atitle="${news.atitle}" data-aoriginallink="${news.aoriginallink}" data-apubDate="${news.apubDate}">
											<td style="text-align: center;">${news.ano}</td>
											<td style="text-align: center;"><a
												href="${news.aoriginallink}" target="_blank">${news.atitle} </a>
											<td style="text-align: center;">${news.apubDate}</td>
											<td style="text-align: center;"><input type="checkbox" name="selected_num" value="${news}"></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
							<input type="submit" value="저장하기">
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
</body>
</html>