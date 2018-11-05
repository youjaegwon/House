<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js" ></script>

<script>

$(document).ready(function() {
	var bno = '<c:out value="${bno }"/>';
	var form_data = new FormData();
	form_data.append('bno', bno);
	//alert(form_data.get('bno'));
	var url = "hitUpdate";
	$.ajax({
		url:url,	 
		type:"POST",		
		dataType:"json",
		timeout : 30000,
		data: form_data,
		processData: false,
        contentType: false,
		cache:false,
        async:false, //기본값은 true
		success:function(data){	// 성공
			
			$("#mid").html(data.mid);
			$("#nhit").html(data.hit);
			$("#bcontent").html(data.bcontent);
			$("#bregdate").html(data.bregdate);
			$("#btitle").html(data.btitle);
			$("#bno").html(data.bno);
			$("input[name='bno']").val(data.bno);
		},
		error: function (request,status,error) {
        	alert("error");
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	$("#nhit").html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
});
</script>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">상세페이지</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">질문/답변</li>
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
						<div class="box-body">
							<div class="form-group">
								<h3 class="box-title">제목 : <div id="btitle"/></h3>
							</div>
							<div class="form-group" style="height: 400px">
								<div id="bcontent"/>
							</div>
							<div class="box-footer">
								<div class="user-block">
									<span class="username">작성자 : <div id="mid"/> </span>
								</div>
								<div class="user-block">
									<span class="username">작성일자 : <div id="bregdate"/> </span>
								</div>
								<div class="user-block">
									<span class="username">조회수 : <div id="nhit"/> </span>
								</div>
							</div>
							<form action="/blog/blogDelete" method="post"><input type="hidden" name="bno" ><input type="submit" value="삭제하기"></form>
							<form action="/blog/updateGO" method="post"><input type="hidden" name="bno" ><input type="submit" value="수정하기"></form>
						</div>
						<br />
						<br />
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>