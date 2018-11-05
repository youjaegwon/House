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
						<form action="/blog/findByBtitle" method="get">
						<div>
							<div class="form-group col-sm-10">
							<div class="input-group">
							<input type="text" class="form-control" name="btitle" id="btitle" placeholder="제목입력"> <span class="input-group-btn">
							<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-search"></i> 검색
							</button>
							</span>
							</div>
							</div>
						</div>
						</form>
						<div class="content table-responsive table-full-width">
						<form id="formA" method="post">
							<input id="form1" type="submit" value="선택게시">
							<input id="form2" type="submit" value="게시취소">
							<input id="form3" type="submit" value="선택삭제"></p>
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
							</form>
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
						<c:if test="${not empty login }">
							<c:if test="${login.ano eq 1}">
								<form action="/blog/adminBlogInsert" method="post">
									<input type="submit" value="글작성"> <input type="hidden"
										name="mid" value="${login.mid}">
								</form>
							</c:if>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../../include/admin/plugin_js.jsp"%>
</body>
</html>