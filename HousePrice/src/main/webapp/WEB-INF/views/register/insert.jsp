<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/main_header.jsp" %>
<div class="container-fluid">
<div class="col-lg-12">
    <form role="form" id="writeForm" method="post" action="/register/insert">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">회원가입</h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="title">아이디</label>
                    <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="content">비밀번호</label>
                    <input type="password" class="form-control" id="mpw" name="mpw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="writer">이름</label>
                    <input type="text" class="form-control" id="mname" name="mname">
                </div>
                <div class="form-group">
                    <label for="writer">휴대폰</label>
                    <input type="text" class="form-control" id="mphone" name="mphone">
                </div>
            </div>
            <div class="box-footer">
                <button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
                <div class="pull-right">
                    <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 회원가입</button>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
<%@ include file="../include/main_footer.jsp" %>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>