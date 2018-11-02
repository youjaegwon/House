<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
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
            url: 'updateY_N',
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
            url: 'updateN_Y',
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
            url: 'selectDelete',
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
	<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">마이 페이지</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="bar">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- MENUS AND WIDGETS -->
					<div class="panel panel-default sidebar-menu with-icons">
						<div class="panel-heading">
							<h3 class="h4 panel-title">Categories</h3>
						</div>
						<div class="panel-body">
							<ul class="nav nav-pills flex-column text-sm">
								<li class="nav-item"><a href="/question/mypage?mid=${login.mid}" class="nav-link">내 질문</a></li>
								<li class="nav-item"><a href="/answer/mypage?mid=${login.mid}" class="nav-link">내 답변</a></li>
								<li class="nav-item"><a href="/register/detail" class="nav-link">회원정보 수정</a></li>
								<li class="nav-item"><a href="/blog/selectSave" class="nav-link">저장된 게시물</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">블로그 관리</h3>
						</div>
						<div class="box-footer">
							<div class="form-group col-sm-6">
								<form action="/question/mypagesearch" method="get">
									<div class="input-group">
										<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
										<input type='hidden' name='mid' value='${login.mid}'>
										<input type='hidden' name='index' value='${p.index}'>
										<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
										<input type='hidden' name='listCnt' value='${p.listCnt}'> <input type="text" class="form-control" name="keyword" width="200px" id="keywordInput" placeholder="제목">
										 <span class="input-group-btn">
										 <button type="submit" class="btn btn-primary btn-flat"id="searchBtn"> <i class="fa fa-search"></i> 검색 </button>
										</span>
									</div>
								</form>
							</div>
						</div>

						<div class="box-body">
						<form id="formA" method="post">
							<input id="form1" type="submit" value="선택게시">
							<input id="form2" type="submit" value="게시취소">
							<input id="form3" type="submit" value="선택삭제"></p>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 60px; text-align:center;"><input type="checkbox" id="checkall" name="checkall"></th>
										<th style="width: 60px; text-align:center;">No.</th>
										<th style="width: 250px; text-align:center;">제목</th>
										<th style="width: 100px; text-align:center;">조회수</th>
										<th style="width: 170px; text-align:center;">작성시간</th>
										<th style="width: 80px; text-align:center;">게시여부</th>
									</tr>
									<%-- <c:if test="${empty questions }">
										<tr>
											<td colspan="6" style="text-align:center;"><h3>게시글이 없습니다.</h3></td>
										</tr>
									</c:if> 
									<%-- <c:if test="${not empty questions }"> --%>
										<c:forEach items="${list}" var="list">
											<tr>
												<td style="text-align:center;"><input type="checkbox" name="chk" id="${list.bno }" value="${list.bno }"></td>
												<td style="text-align:center;">${list.bno }</td>
												<td style="text-align:center;"><a href ="/blog/blogDetailSave?bno=${list.bno }">${list.btitle }</td>
												<td style="text-align:center;">${list.hit}</td>
												<td style="text-align:center;">${list.bregdate}</td>
												<td style="text-align:center;">${list.y_n}</td>
											</tr>
										</c:forEach>
									<%-- </c:if> --%>
								</tbody>
							</table>
							</form>
						</div>
						<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>
						<c:if test="${not empty login }">
							<c:if test="${login.ano eq 1}">
						<form action="/blog/blogInsert" method="post"> <input type="hidden" name="mid" value="${login.mid}"> </form>
							</c:if>
						</c:if>
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
	</section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>