<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="page mt-10 mx-auto">
	<div>
		<a class="btn btn-outline w-full" href="/usr/bg12343/dashboard/dashboard?bldgId=1"> 임대현황 보기</a>
		<img src="/resource/building.jpg" alt="" />
	</div>
	<div>
		<a class="btn btn-outline w-full" href="/usr/article/list">커뮤니티 보기</a>
		<img src="/resource/community.png" alt="" />
	</div>
	<div>
		<a class="btn btn-outline w-full" href="/usr/news/news">부동산 관련 뉴스 보기</a>
		<div>다음</div>
		<img src="/resource/daum.png" alt="" />
		<div>네이버</div>
		<img src="/resource/naver.png" alt="" />
		<div>구글</div>
		<img src="/resource/google.png" alt="" />
	</div>


</div>


<style type="text/css">
.mainSearch {
	text-align: center;
}

.page {
	display: flex;
	/* 	border: 5px solid red; */
	height: 500px;
	width: 1000px;
	justify-content: space-around;
	align-items: center;
}

.page>div>a {
	background: linear-gradient(to right, #536976, #292e49); /* 로얄블루 색상 */
	color: white;
	margin-bottom: 10px;
}

.page>div {
	text-align: center;
	width: 250px;
	height: 400px;
}

.page>div:nth-child(1) {
	/* 	border: 3px solid blue; */
	
}

.page>div:nth-child(2) {
	/* 	border: 3px solid gold; */
	
}

.page>div:nth-child(3) {
	/* 	border: 3px solid green; */
	
}
</style>



<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>