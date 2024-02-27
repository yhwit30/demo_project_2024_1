<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<!-- 건물 개수대로 가져오는 함수로 수정해야함 -->
<div>
	<a class="btn btn-outline ${param.bldgId == 1 ? 'btn-active' : '' }" href="../bg12343/building?bldgId=1">건물1 가나</a>
	<a class="btn btn-outline ${param.bldgId == 2 ? 'btn-active' : '' }" href="../bg12343/building?bldgId=2">건물2 다라</a>
</div>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>건물명</th>
					<th>건물주소</th>
					<th>전체호실수</th>
					<th>건물메모</th>
				</tr>
			</thead>
			<tbody>
					<tr class="hover">
						<td>${buildingRd.id }</td>
						<td>${buildingRd.regDate.substring(0,10) }</td>
						<td>${buildingRd.bldgName }</td>
						<td>${buildingRd.bldgAdd }</td>
						<td>${buildingRd.roomTotal }</td>
						<td>${buildingRd.bldgMemo }</td>
					</tr>
			</tbody>
		</table>
	</div>
	
	<br />

<!-- 호실정보 가져오기 -->
<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>호실</th>
					<th>형태</th>
					<th>면적(m2)</th>
					<th>기준 보증금</th>
					<th>기준 월세</th>
					<th>기준 전세</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="building" items="${buildings }">
					<tr class="hover">
						<td>${building.roomNum }</td>
						<td>${building.roomType }</td>
						<td>${building.roomArea }</td>
						<td>${building.standardDeposit }</td>
						<td>${building.standardRent }</td>
						<td>${building.standardJeonse }</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<div class="btns mt-5">
		<a class="btn btn-outline" href="../bg12343/buildingModify?bldgId=${param.bldgId }">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
	<a class="btn btn-outline" href="/usr/bg12343/buildingAdd"> 건물 추가</a>






</section>










<%@ include file="../common/foot.jspf"%>