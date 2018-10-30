<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
	
<script src="http://code.jquery.com/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

</head>

<script type="text/javascript">
$(document).on("click", "#form1",function(){
	$("#form").submit(function(event) {
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
	$("#form").submit(function(event) {
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
	$("#form").submit(function(event) {
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
<div id="result"></div>
${message }
<form id="form" method="post">
<input id="form1" type="submit" value="선택게시">
<input id="form2" type="submit" value="게시취소">
<input id="form3" type="submit" value="선택삭제">

	<table>
		<tr>
		<td><input type="checkbox" id="checkall" name="checkall"></td><td>No.</td><td>제목</td><td>조회수</td><td>게시여부</td>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr >
		<td><input type="checkbox" name="chk" id="${list.bno }" value="${list.bno }"></td><td>${list.bno }</td><td><a href ="/blog/blogDetailSave?bno=${list.bno }">${list.btitle }</a></td><td>${list.hit }</td><td>${list.y_n }</td>
		</tr>
		</c:forEach>
	</table>
	</form>

<form action="/blog/" method="get"><input type="submit" value="목록으로"></form>
<form action="/blog/blogInsert" method="post"><input type="submit" value="글작성"> <input type="hidden" name="mid" value="kokoa223"></form>

<table>
		<tr>
			<c:if test="${pageGroupResult.beforePage ==true}">
				<td><a href="selectSave?reqPage=${pageGroupResult.selectPageNumber - 1}">[이전]</a>
				</td>
			</c:if>
			
			<c:forEach begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}" var="count" step="1">
				<td><a href="selectSave?reqPage=${count}">${count}</a></td>
			</c:forEach>
			<c:if test="${pageGroupResult.afterPage ==true}">
				<td><a href="selectSave?reqPage=${pageGroupResult.selectPageNumber + 1}">[다음]</a>
				</td>
			</c:if>
		</tr>
	</table>

</body>
</html>
