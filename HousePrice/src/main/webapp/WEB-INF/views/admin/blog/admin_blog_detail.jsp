<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../include/admin/head.jsp"%>
<script type="text/javascript" src="${path}/question/js/paging.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
$(document).on("click", "#form1",function(){
	$("#formA").submit(function(event) {
		event.preventDefault();
		var checkArr = []; //배열 초기화
		
		$("input[name='chk']:checked").each(function(i){
			checkArr.push($(this).val()); //check true인것만 뽑아서 배열에 push!!
		});
		
	    $.ajax({
            type: 'POST',
            url: '/blog/updateY_N',
            data: {
            	checkArrRoom: checkArr 
            },
            cache: false,
            timeout: 600000,
            success: function (data) {
           	alert("게시 완료");
           	location.reload();
            },
            error: function (request,status,error) {
            	alert("error");
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            	$("#result").html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
	});
});

$(document).on("click", "#form2",function(){
	$("#formA").submit(function(event) {
		event.preventDefault();
		var checkArr = []; //배열 초기화
		
		$("input[name='chk']:checked").each(function(i){
			checkArr.push($(this).val()); //check true인것만 뽑아서 배열에 push!!
		});
		
	    $.ajax({
            type: 'POST',
            url: '/blog/updateN_Y',
            data: {
            	checkArrRoom: checkArr 
            },
            cache: false,
            timeout: 600000,
            success: function (data) {
           	alert("게시 취소");
           	location.reload();
            },
            error: function (request,status,error) {
            	alert("error");
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            	$("#result").html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
	});
});

$(document).on("click", "#form3",function(){
	$("#formA").submit(function(event) {
		event.preventDefault();
		var checkArr = []; //배열 초기화
		
		$("input[name='chk']:checked").each(function(i){
			checkArr.push($(this).val()); //check true인것만 뽑아서 배열에 push!!
		});
		
	    $.ajax({
            type: 'POST',
            url: '/blog/selectDelete',
            data: {
            	checkArrRoom: checkArr 
            },
            cache: false,
            timeout: 600000,
            success: function (data) {
           	alert("삭제 완료");
           	location.reload();
            },
            error: function (request,status,error) {
            	alert("error");
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            	$("#result").html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
	});
});

</script>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
});
</script>
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
						<hr>


	<div id="content">
		<div class="container">
			<section class="bar">
				<div class="row">
					<div class="col-lg-12">
						<div class="box-body">
						
						<div>[글번호 : ${data.bno }]</div>
						
							<div class="form-group">
								<h3 class="box-title">제목 : ${data.btitle }</h3>
							</div>
							<hr>
							<div class="form-group" style="width: 350px">
								${data.bcontent }
							</div>
							<hr>
							<div class="box-footer">
								<div class="user-block">
									<span class="username">번호  : ${data.bno } </span>
								</div>
								<div class="user-block">
									<span class="username">작성자 : ${data.mid } </span>
								</div>
								<div class="user-block">
									<span class="username">작성일자 : ${data.bregdate } </span>
								</div>
								<div class="user-block">
									<span class="username">조회수 : ${data.hit } </span>
								</div>
							</div>
						</div>
						<br />
						<br />
					</div>
				</div>
			</section>
		</div>
	</div>

<form action="/admin/blog/selectSave" method="get"><input type="submit" value="목록으로"></form>
<form action="/blog/adminBlogDelete" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="삭제하기"></form>
<form action="/blog/updateSaveGO" method="post"><input type="hidden" name="bno" value="${data.bno }"><input type="submit" value="수정하기"></form>

						<div class="content table-responsive table-full-width">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../../include/admin/plugin_js.jsp"%>
</body>
</html>