<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Add Find TEST"></c:set>

<%@ include file="../common/head.jspf"%>


<div id="wrap" style="border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative"></div>

<div id="map" style="width: 100%; height: 350px;"></div>
<p>
	<button onclick="setCenter()">지도 중심좌표 이동시키기</button>
	<button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>
</p>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=426dd75f75d2eb88e4ae8811cf3bce62&libraries=services"
></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var lat;
var lon;


  // 우편번호 찾기 화면을 넣을 element
  const element_wrap = document.getElementById('wrap');

  const daumPostcode = () => {
    new daum.Postcode({
      oncomplete: data => {
        console.log('도로명주소 : ' + data.roadAddress);
        console.log('지번주소 : ' + data.jibunAddress);
        console.log('우편번호 : ' + data.zonecode);

        // 위도 및 경도 좌푯값 구하기
       var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(data.roadAddress, (result, status) => {
          if (status === kakao.maps.services.Status.OK) {
            console.log('위도 : ' + result[0].y);
            console.log('경도 : ' + result[0].x);
            
            lat = result[0].y;
			lon = result[0].x;
            
          }
        });
      },
      // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
      onresize: size => {
        element_wrap.style.height = size.height + 'px';
      },
      width: '100%',
      height: '100%'
    }).embed(element_wrap, {autoClose: false});
  }

  
  function setCenter() {            
      // 이동할 위도 경도 위치를 생성합니다 
      var moveLatLon = new kakao.maps.LatLng(lat, lon);
      
      // 지도 중심을 이동 시킵니다
      map.setCenter(moveLatLon);
  }
  
  
  daumPostcode();
</script>




<%@ include file="../common/foot.jspf"%>