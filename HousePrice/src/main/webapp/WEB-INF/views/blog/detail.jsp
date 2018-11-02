<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
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
<div id="btitle"></div>
<div id="nhit"></div>
<div id="bno"></div>
<div id="bregdate"></div>
<div id="bcontent"></div>


<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>
<form action="/blog/blogDelete" method="post"><input type="hidden" name="bno" ><input type="submit" value="삭제하기"></form>
<form action="/blog/updateGO" method="post"><input type="hidden" name="bno" ><input type="submit" value="수정하기"></form>

</body>
</html>
