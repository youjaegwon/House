<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ include file="include/head.jsp"%>
<body>
	<%@ include file="include/main_header.jsp"%>
	<section
		style="background: url('${path}/user/img/photogrid.jpg') center center repeat; background-size: cover;"
		class="bar background-white relative-positioned">
		<div class="container">
			<!-- Carousel Start-->
			<div class="home-carousel">
				<div class="dark-mask mask-primary"></div>
				<div class="container">
					<div class="homepage owl-carousel">
						<div class="item">
							<div class="row">
								<div class="col-md-5 text-right">
									<p>
										<img src="${path}/user/img/logo.png" alt="" class="ml-auto">
									</p>
									<h1>끈질긴 허위매물 뿌리 뽑는다.</h1>
									<p>
										Business. Corporate. Agency.<br>Portfolio. Blog.
										E-commerce.
									</p>
								</div>
								<div class="col-md-7">
									<img src="${path}/user/img/template-homepage.png" alt=""
										class="img-fluid">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-7 text-center">
									<img src="${path}/user/img/template-mac.png" alt=""
										class="img-fluid">
								</div>
								<div class="col-md-5">
									<h2>'VR홈투어'로 매물정보 생생하게 본다.</h2>
									<ul class="list-unstyled">
										<li>Sliders and carousels</li>
										<li>4 Header variations</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-md-5 text-right">
									<h1>빅데이터,가상현실 서비스 강화</h1>
									<ul class="list-unstyled">
										<li>Clean and elegant design</li>
										<li>Full width and boxed mode</li>
									</ul>
								</div>
								<div class="col-md-7">
									<img src="${path}/user/img/template-easy-customize.png" alt="" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Carousel End-->
		</div>
	</section>
	<section class="bg-white bar">
		<div class="container">
			<div class="heading text-center">
				<h2>Blog</h2>
			</div>
			<div class="row">
			
			<c:forEach var="list" items="${list }">
				<div class="col-lg-3">
					<div class="home-blog-post">
						<div class="image">
							<img src="/blog/filedownload?id=${list.fid}" onERROR="this.src='${path}/resources/img/una_mattina.png'" alt="Example blog post alt" class="img-fluid" width="300px" height="300px" class="img-fluid">
							<div class="overlay d-flex align-items-center justify-content-center">
								<a href="/blog/blogDetail?bno=${list.bno }" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a>
							</div>
						</div>
						
						<div class="text">
							<h4>
								<a href="/blog/blogDetail?bno=${list.bno }">${list.btitle}</a>
							</h4>
							<p class="author-category">
								By <a href="/blog/blogDetail?bno=${list.bno }">${list.mid}</a> in <a href="blog.html">${list.bregdate}</a>
							</p>
							<a href="/blog/blogDetail?bno=${list.bno }" class="btn btn-template-outlined">더보기</a>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<section
		style="background: url(${path}/user/img/fixed-background-2.jpg) center top no-repeat; background-size: cover;"
		class="bar no-mb color-white text-center bg-fixed relative-positioned">
		<div class="dark-mask"></div>
		<div class="container">
			<div class="icon icon-outlined icon-lg">
				<i class="fa fa-adjust" style="margin-top: 25px;"></i>
			</div>
			<h3 class="text-uppercase">현재 이슈에 대한 더 많은 정보가 필요하신가요?</h3>
			<p class="text-center">
				<a href="index2.html" class="btn btn-template-outlined-white btn-lg">See More</a>
			</p>
		</div>
	</section>
	<section class="bar background-white">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-desktop" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">추구하는 가치</h3>
						<p>합리적인 사고/능동적인 태도/빠른 소통/성장욕구/정직함. 이러한 것들을 중요하게 생각하는 사람들입니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-print" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">프로의식</h3>
						<p>우리는 가족이나 동아리가 아닌, 프로팀입니다. 각자의 역할에 충실하고, 약속한 것은 책임 있게 실천합니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-globe" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">팀워크</h3>
						<p>하나의 목표를 위해 서로 다른 역활의 다양한 사람이 함께 한다는 것을 인정합니다. 서로가 최고가 될 수
							있도록 서로를 돕습니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-lightbulb-o" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">DNA</h3>
						<p>우리는 운좋은 한번의 성공을 바라지 않습니다. 성공을 반복할 수 있는 '방법'을 습득하고 체계화, 시스템화
							하고자 합니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-adn" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">DNA</h3>
						<p>우리는 운좋은 한번의 성공을 바라지 않습니다. 성공을 반복할 수 있는 '방법'을 습득하고 체계화, 시스템화
							하고자 합니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="box-simple">
						<div class="icon-outlined">
							<i class="fa fa-android" style="margin-top: 30px;"></i>
						</div>
						<h3 class="h4">DNA</h3>
						<p>우리는 운좋은 한번의 성공을 바라지 않습니다. 성공을 반복할 수 있는 '방법'을 습득하고 체계화, 시스템화
							하고자 합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="include/main_footer.jsp"%>
	<%@ include file="include/plugin_js.jsp"%>
</body>
</html>
