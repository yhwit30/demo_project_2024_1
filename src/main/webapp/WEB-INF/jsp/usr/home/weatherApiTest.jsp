<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Add Find TEST"></c:set>
<%@ include file="../common/head.jspf"%>



<script>

const API_KEY = '2d1119c77c14a77fee290dd58e72b536';

const callbackOk= (position) =>{
    console.log(position)
    const lat = position.coords.latitude //위도
    const lon = position.coords.longitude //경도
		console.log("현재 위치는 위도:" + lat + ", 경도:" + lon);
		const url = 'https://api.openweathermap.org/data/2.5/weather?lat=' +lat+ '&lon='+lon+ '&appid='+API_KEY;
		console.log(url);
		fetch(url)
		.then(response => response.json())
		.then(data=>{
			console.log(data);
			
			
		})
		
}
	
const callbackError= () =>{
    alert("위치정보를 찾을 수 없습니다.")
}

	navigator.geolocation.getCurrentPosition(callbackOk, callbackError);


	
</script>



<%@ include file="../common/foot.jspf"%>