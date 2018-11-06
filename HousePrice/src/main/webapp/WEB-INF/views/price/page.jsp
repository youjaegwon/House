<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rcxWChybIwDjS7E6AWWU&callback=initMap"></script>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">주택 공시가격 데이터 분석</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">주택 공시가격 데이터 분석</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content" class="container">
		<h1 class="h2">내게 맞는 주택 분석</h1>
		
		<h1 class="h4 mt-4">넓이를 기준으로 분류한 서울시 주택 가격</h1>
		<img src="/img/00_price_by_area.png" alt="넓이기준공시가격">

		<h1 class="h4 mt-2">가격 10억 이하의 넓이를 기준으로 분류한 서울시 주택 가격</h1>
		<img src="/img/01_price_by_area_1.png" alt="최적화된넓이기준공시가격">
		
		<h1 class="h4 mt-2">구단위를 기준으로 분류한 서울시 주택 가격</h1>
		<img src="/img/02_price_by_locale.png" alt="지역기준공시가격">
		
		<h1 class="h4 mt-2">가격 10억 이하의 구단위를 기준으로 분류한 서울시 주택 가격</h1>
		<img src="/img/03_price_by_locale_1.png" alt="최적화된지역기준공시가격">
		
		<a href="http://124.53.48.9:8889/notebook/editor?editor=523">HIVE 쿼리에디터로 이동</a>
	</div>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
		var map = null;
	
	    function initMap() {
	    	//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
			var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일

			//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 11 레벨의 지도가 생성됩니다.
			map = new naver.maps.Map(mapDiv);
	        
	    }
	    function getQueryData(isSearchInMap,keyword){
	    	var bounds = null;
	    	if(isSearchInMap){
	    		var nowBounds = map.getBounds();
	    		var ne = nowBounds.getNE();
	    		var sw = nowBounds.getSW();	    		
	    		var utmk_ne = naver.maps.UTMK.fromLatLngToUTMK(ne);
	    		var utmk_sw = naver.maps.UTMK.fromLatLngToUTMK(sw);
	    		console.log('nowBounds:'+nowBounds);
	    		console.log('ne:'+ne);
	    		console.log('sw:'+sw);
	    		console.log('ne:'+utmk_ne);
	    		console.log('sw:'+utmk_sw);
	    		bounds = 	{
			    				'sw':
		    					{
		    						'x':utmk_sw.x,
		    						'y':utmk_sw.y
		    					},
		    					'ne':
		    					{
		    						'x':utmk_ne.x,
		    						'y':utmk_ne.y
		    					}
			    			}
	    		console.log('bounds:'+bounds);
	    	}
	    	var trimedKeyword = keyword.trim();
	    	trimedKeyword = trimedKeyword.length==0?null:trimedKeyword;
	    	var queryData ={
	    			"keyword": trimedKeyword,
	    			"bounds": bounds
	    			};
	    	console.log('trimedKeyword:'+trimedKeyword);
	    	return queryData;
	    }
		$(document).ready(function() {
			$("#searchForm").submit(function(event){
				event.preventDefault();
				var searchKeyword = $("#searchKeyword").val();
				var isSearchInMap = $("#checkinmap").prop("checked");
				var queryData = JSON.stringify(getQueryData(isSearchInMap,searchKeyword));
				$.ajax({
				  url:"/price/search",
				  type:"POST",
				  data:queryData,
				  contentType:"application/json; charset=utf-8",
				  dataType:"json",
				  success: function(){
					  console.log(data);
				  }
				});
				
			});
			
		});
	</script>
</body>
</html>