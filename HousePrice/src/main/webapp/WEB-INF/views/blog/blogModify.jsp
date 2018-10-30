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
      var bno =${data.bno };
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
</head>
<body>
	<form id="form" action="blogUpdate" method="post">
		<input type="text" name="bno" value="${data.bno }" />
		<input type="hidden"name="mid" value="${data.mid }" />

		<div class="form-group"> <input type="text" id='btitle' class="form-control input-lg" name="btitle" value="${data.btitle }"/> </div>
		<textarea id="summernote" name="bcontent">
		${data.bcontent }
		</textarea>
		<input type="submit" class="btn btn-primary btn-lg" value="글수정" id="btn" />
	</form>
	<div id="result"></div>
	</body>
</html>
