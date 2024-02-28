<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DASHBOARD"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<section class="mt-2 text-xl px-4 flex justify-around">
	<div class="overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>건물명</th>
					<th>보증금 합계</th>
					<th>월세 합계</th>
					<th>관리비 합계</th>
					<th>수익률(연)</th>
					<th>입주율</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="dashboard" items="${dashboard }">
					<tr class="hover">
						<td>${dashboard.bldgName }</td>
						<td>${dashboard.depositSum }</td>
						<td>${dashboard.rentSum }</td>
						<td>${dashboard.maintenanceFeeSum }</td>
						<td>#</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<div class="bg-yellow-400">입주율 부분</div>
	<div class="bg-yellow-400">수익률 부분</div>
	<div class="bg-yellow-400">
		날씨 부분
		<i class="fa-solid fa-sun"></i>
	</div>

</section>

<br />
<div>
	<a class="btn btn-sm btn-outline ${param.bldgId == 1 ? 'btn-active' : '' }" href="../bg12343/dashboard?bldgId=1">건물1 가나</a>
	<a class="btn btn-sm btn-outline ${param.bldgId == 2 ? 'btn-active' : '' }" href="../bg12343/dashboard?bldgId=2">건물2 다라</a>
</div>
<section class="mt-2 text-xl px-4">
	<div class="badge badge-outline">${roomsCnt }개</div>
	<table class="table-box-1 table" border="1">
		<thead>
			<tr>
				<th>호실</th>
				<th>호실형태</th>
				<th>면적(m2)</th>
				<th>세입자명</th>
				<th>현 보증금</th>
				<th>현 월세</th>
				<th>현 관리비</th>
				<th>비품</th>
				<th>호실메모</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach var="room" items="${rooms }">
				<tr class="hover">
					<td>${room.roomNum }</td>
					<td>${room.roomType }</td>
					<td>${room.roomArea }</td>
					<td>${room.tenantName }</td>
					<td>${room.deposit }</td>
					<td>${room.rent }</td>
					<td>${room.maintenanceFee }</td>
					<td>
						전자렌지
						<input type="checkbox" class="toggle toggle-sm" checked />
						냉장고
						<input type="checkbox" class="toggle toggle-sm" checked />
						침대
						<input type="checkbox" class="toggle toggle-sm" checked />
						기타
					</td>
					<td>#</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>


<%@ include file="../common/foot.jspf"%>