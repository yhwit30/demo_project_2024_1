<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAINTENANCE FEE"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<!-- 건물 개수대로 가져오는 함수로 수정해야함 -->
<div>
	<a class="btn btn-outline ${param.bldgId == 1 ? 'btn-active' : '' }" href="../bg12343/maintenanceFee?bldgId=1">건물1
		가나</a>
	<a class="btn btn-outline ${param.bldgId == 2 ? 'btn-active' : '' }" href="../bg12343/maintenanceFee?bldgId=2">건물2
		다라</a>
</div>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>호실</th>
					<th>세입자</th>
					<th>임대형태</th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="maintenanceFee" items="${maintenanceFee }">
					<tr class="hover">
						<td>${maintenanceFee.roomNum }</td>
						<td>${maintenanceFee.tenantName }</td>
						<td>${maintenanceFee.leaseType }</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }">${maintenanceFee.monthlyMaintenanceFee1 }</a>
						</td>
						<td>${maintenanceFee.monthlyMaintenanceFee2 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee3 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee4 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee5 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee6 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee7 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee8 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee9 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee10 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee11 }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee12 }</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns mt-5">
		<a class="btn btn-outline" href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }">자세히 보기</a>
	</div>

	<div class="btns mt-5">
		<a class="btn btn-outline" href="../bg12343/maintenanceFeeModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>

</section>



<%@ include file="../common/foot.jspf"%>