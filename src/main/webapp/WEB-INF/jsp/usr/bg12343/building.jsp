<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>등록날짜</th>
					<th>건물명</th>
					<th>건물주소</th>
					<th>전체호실수</th>
					<th>건물메모</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="building" items="${buildings }">
					<tr class="hover">
						<td>${building.id }</td>
						<td>${building.regDate.substring(0,10) }</td>
						<td>${building.bldgName }</td>
						<td>${building.bldgAdd }</td>
						<td>${building.roomTotal }</td>
						<td>#</td>
						<td>
							<a class="btn btn-sm btn-outline" href="../bg12343/buildingModify?bldgId=${building.id }">수정</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br />

	<!-- 건물 카테고리 버튼 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="../bg12343/building?bldgId=${building.id }"
			>${building.bldgName }</a>
		</c:forEach>
	</div>

	<div class="badge badge-outline">${roomsCnt }개</div>
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

				<c:forEach var="room" items="${rooms }">
					<tr class="hover">
						<td>${room.roomNum }</td>
						<td>${room.roomType }</td>
						<td>${room.roomArea }</td>
						<td>${room.standardDeposit }</td>
						<td>${room.standardRent }</td>
						<td>${room.standardJeonse }</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<a class="btn btn-outline" href="/usr/bg12343/buildingAdd"> 건물 추가</a>
	<div class="btns mt-5">
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제(todo)</a>
	</div>






</section>










<%@ include file="../common/foot.jspf"%>