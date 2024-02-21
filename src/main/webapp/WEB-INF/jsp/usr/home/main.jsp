<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="page mt-20 main-page mx-auto">
	<div>
		임대현황
		<div class="menu">
		<a href="/usr/bg12343/building">
		건물 총 현황</a></div>
		<div class="menu"><a href="/usr/bg12343/room">건물 가나</a></div>
		<div class="menu"><a href="/usr/bg12343/room">건물 다라</a></div>

	</div>
	<div>
		<a href="/usr/article/list">커뮤니티</a>
		<div class="menu">인기글</div>
		<div class="menu">최신글</div>
		<div class="menu">자유글</div>
	</div>
	<div>
		뉴스
		<div class="menu">다음</div>
		<div class="menu">네이버</div>
		<div class="menu">구글</div>
	</div>


</div>


<style type="text/css">
.page {
	display: flex;
	border: 5px solid red;
	height: 500px;
	width: 1000px;
	justify-content: space-around;
}

.menu {
	width: 180px;
	height: 90px;
	background-color: pink;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 20px;
	margin-top: 10px;
	border-radius: 5px;
}

.main-page>div {
	text-align: center;
	width: 250px;
	height: 400px;
}

.main-page>div:nth-child(1) {
	background-color: blue;
}

.main-page>div:nth-child(2) {
	background-color: gold;
}

.main-page>div:nth-child(3) {
	background-color: green;
}
</style>



<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>