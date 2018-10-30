<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>main</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- include livraries(jquery, bootstrap) -->

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script type="text/javascript" charset=utf-8>
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
    
    function sendFile(file, editor, welEditable) {
      var form_data = new FormData();
      var bno =${bno };
      form_data.append('file', file);
      form_data.append('bno',bno);
      
      $.ajax({
          type: 'POST',
          enctype: 'multipart/form-data',
          url: 'uploadImage',
          data: form_data,
          processData: false,
          contentType: false,
          cache: false,
          timeout: 600000,
          success: function (data) {
        	  /* alert(data.data);
              var imgtag = $("<img />");
              imgtag.attr("src", data.data);
              imgtag.attr("style", "width: 50%;");
              $("#board").append(imgtag); */
              
              $(editor).summernote('insertImage', data.data);
              console.log("SUCCESS : ", data);

          },
          error: function (e) {
              $("#result").text(e.responseText);
              console.log("ERROR : ", e);
          }
      });
    }
    
</script>

<script type="text/javascript" charset=utf-8>
	$(document).ready(function() {
		$(document).on("click", "#btn2",function(){
		$("#form").submit(function(event) {
			event.preventDefault();
			//alert("글저장");
			var bno = ${bno };
			 var form_data = new FormData();
		      form_data.append('btitle', $('#btitle').val());
		      form_data.append('bno', bno);
		      form_data.append('bcontent', $('#summernote').val());
		      
			//alert(bno);
			//alert($('#summernote').val());
			//alert($('#btitle').val());
			
		    $.ajax({
	            type: 'POST',
	            url: '/blog/update',
	            data: form_data,
	            enctype: 'multipart/form-data',
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {
	          //  	alert("success");
	            	window.location.href = 'http://localhost:8080/blog/blogDetailSave?bno='+bno;
	            },
	            error: function (request,status,error) {
	            	alert("error");
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            	$("#result").html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
		});
	 });
});

</script>

</head>
<body>

	<form id="form" action="blogUpdate" method="post">
		<input type="text" name="bno" value="${bno }" /> <input type="hidden"
			name="mid" value="kokoa223">

		<div class="form-group">
			<input type="text" id='btitle' class="form-control input-lg"
				name="btitle" placeholder="제목을 입력하세요" />
		</div>

		<textarea id="summernote" name="bcontent">
		</textarea>


		<input type="submit" class="btn btn-primary btn-lg" value="글작성" id="btn" />
		<input type="submit" class="btn btn-primary btn-lg" value="글저장" id="btn2" />
	</form>

	<div id="result"></div>
	</body>
</html>
