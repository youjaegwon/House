<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@ include file="../include/head.jsp"%>
<body>
<%@ include file="../include/main_header.jsp"%>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">질문/답변</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">블로그 수정</li>
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
						<div class="heading">
							<h2>블로그 작성</h2>
						</div>
						<form id="form" action="blogUpdate" method="post">
							<input type="hidden" name="bno" value="${data.bno }" /> <input
								type="hidden" name="mid" value="${data.mid}">

							<div class="form-group">
								<input type="text" id='btitle' class="form-control input-lg" name="btitle" value="${data.btitle }"/>
							</div>

							<textarea id="summernote" name="bcontent">
							${data.bcontent}
							</textarea>


							<input type="submit" class="btn btn-primary btn-lg" value="글작성" id="btn" />
							<input type="submit" class="btn btn-primary btn-lg" value="글저장" id="btn2" />
						</form>

						<div id="result"></div>
					</div>
				</div>
			</section>
		</div>
		</div>
</body>
<%@ include file="../include/main_footer.jsp"%>
<%@ include file="../include/plugin_js.jsp"%>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript" charset=utf-8>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	function sendFile(file, editor, welEditable) {
		var form_data = new FormData();
		var bno = '<c:out value="${data.bno }"/>';
		
		alert(bno);
		
		form_data.append('file', file);
		form_data.append('bno', bno);

		$.ajax({
			type : 'POST',
			enctype : 'multipart/form-data',
			url : 'uploadImage',
			data : form_data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				/* alert(data.data);
				var imgtag = $("<img />");
				imgtag.attr("src", data.data);
				imgtag.attr("style", "width: 50%;");
				$("#board").append(imgtag); */
				
				$(editor).summernote('insertImage', data.data);
				console.log("SUCCESS : ", data);
			},
			error : function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
			}
		});
	}
</script>

</html>
