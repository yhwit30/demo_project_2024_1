<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING DETAIL"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<h1 style="text-align: center">전체 건물 목록</h1>
<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1">
			<thead>
				<tr class="bgc">
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
							<a class="btn btn-sm btn-outline" href="../building/buildingModify?bldgId=${building.id }">수정</a>
							<a class="btn btn-sm btn-outline"
								onclick="if(confirm('건물과 호실정보가 모두 삭제됩니다.\n정말 삭제하시겠습니까?') == false) return false;"
								href="../building/doBuildingDelete?bldgId=${building.id}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="mt-2" style="text-align: left">
		<a class="btn btn-m btn-outline" href="/usr/bg12343/building/buildingAdd"> 건물 추가</a>
	</div>

	<br />

	<!-- 건물 카테고리 버튼 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="building?bldgId=${building.id }">${building.bldgName }</a>
		</c:forEach>
		호실 목록 1: 전자렌지 2: 냉장고 3: 침대 4: 전기렌지
	</div>

	<div class="badge badge-outline">${roomsCnt }개</div>
	<!-- 호실정보 가져오기 -->
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1" border="1">
			<thead>
				<tr>
					<th>호실</th>
					<th>형태</th>
					<th>면적(m2)</th>
					<th>기준 보증금</th>
					<th>기준 월세</th>
					<th>기준 전세</th>
					<th>비품(todo)</th>
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
						<td>
							<input class="input input-bordered input-sm max-w-xs w-10" value="1" />
							2
							<input type="checkbox" class="toggle toggle-sm" checked />
							3
							<input type="checkbox" checked="checked" class="checkbox checkbox-sm checkbox-primary" />
							4
							<div class="rating rating-xs">
								<input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" checked />
							</div>
						</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



</section>




<%@ include file="../../common/foot.jspf"%>