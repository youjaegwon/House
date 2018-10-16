<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "${path}/smarteditor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#blogSubmit").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#Bloginsert").submit();
        });
    });
</script>
<body>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fulid">
<form action="/blog/insert" method="post" id="Bloginsert" enctype="multipart/form-data">
		<input type="text" name="title"/>
        <textarea name="editor" id="editor" style="width: 700px; height: 400px;"></textarea>
        <input type="button" id="blogSubmit" value="등록" />
</form>
</div>
<%@ include file="../include/main_footer.jsp" %>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>