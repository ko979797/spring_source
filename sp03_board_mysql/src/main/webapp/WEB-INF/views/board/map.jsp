<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회사위치</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xictyyxyyb"></script>
<script type="text/javascript">
	$(function(){
		$('#btnGeocoding').on('click',function(){
			var addr = $('#addr').val();
			
			$.ajax({
				type:'get',
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				url:'${path}/board/geocodingFind?addr='+addr,
				dataType:'json',
				success:function(result){
					mapDraw(result.x,result.y);
				},
				error:function(result){
					alert('실패');
				}
				
			})
		})
		
		//지도불러오기
		function mapDraw(x,y) {
			var mapOptions = {
				    center: new naver.maps.LatLng(y, x),
				    zoom: 15
				};

			//옵션을 이용한 맵만들기
			var map = new naver.maps.Map('map', mapOptions);
			
			//마커 만들기
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(y, x),
			    map: map
			});
			
			//마커 이동
			naver.maps.Event.addListener(map, 'click', function(e) {
			    marker.setPosition(e.latlng);
			});
			//마커정보
			var infowindow = new naver.maps.InfoWindow({
			    content: "Comparny"
			});
			//정보창 오픈
			naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindow.open(map, marker);
			    }
			});
		}
		

		
	})
</script>
</head>
<body>
	회사주소 : <input type="text" id="addr">
	<button id="btnGeocoding">찾기</button>
	
	<div id="map" style="width:50%;height:500px;"></div>
</body>
</html>