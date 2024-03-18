<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="mainSearch">
	<form action="">
		<input type="hidden" name="boardId" value="${param.boardId }" />

		<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm max-w-xs"
			name="searchKeywordTypeCode"
		>
			<option value="title">제목</option>
			<option value="extra__writer">작성자</option>
			<option value="body">내용</option>
		</select>
		<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="What is your searchKeyword?"
			class="input-sm input input-bordered w-60 max-w-xs mt-3"
		/>
		<button class="btn btn-primary btn-sm" type="submit">검색</button>
	</form>
</div>



<div class="page mt-10 mx-auto">
	<div>
		<a class="btn btn-outline w-full" href="/usr/bg12343/dashboard/dashboard?bldgId=1"> 임대현황DAHBOARD</a>
		<img src="/resource/building.jpg" alt="" />
	</div>
	<div>
		<a class="btn btn-outline w-full" href="/usr/article/list">커뮤니티</a>
		<img src="/resource/community.png" alt="" />
	</div>
	<div>
		<a class="btn btn-outline w-full" href="/usr/news/news">부동산 관련 뉴스</a>
		<div class="menu">다음</div>
		<img src="/resource/daum.png" alt="" />
		<div class="menu">네이버</div>
		<img src="/resource/naver.png" alt="" />
		<div class="menu">구글</div>
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

.menu {
	width: 180px;
	border-radius: 5px;
}

.page>div>a {
	background: linear-gradient(to right, #536976, #292e49); /* 로얄블루 색상 */
	color: white;
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