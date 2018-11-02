<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
	<title>Home</title>
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

</head>
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
						<li class="breadcrumb-item active">질문/답변</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<div id="btitle"></div>
<div id="nhit"></div>
<div id="bno"></div>
<div id="bregdate"></div>
<div id="bcontent"></div>


<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>
<form action="/blog/blogDelete" method="post"><input type="hidden" name="bno" ><input type="submit" value="삭제하기"></form>
<form action="/blog/updateGO" method="post"><input type="hidden" name="bno" ><input type="submit" value="수정하기"></form>
<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>
