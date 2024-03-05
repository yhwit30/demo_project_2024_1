<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAINTENANCE FEE"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>




<style type="text/css">
.underlineClick>td>a:hover {
	background-color: skyblue;
	text-decoration: underline;
}
</style>

<section class="mt-2 text-xl px-4">
<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../maintenanceFee/maintenanceFee?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>

<!-- 연도 변경 버튼todo -->
<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="maintenanceFee?bldgId=${param.bldgId }&year=${nowYear -1}"
>전년도 보기(todo)</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="maintenanceFee?bldgId=${param.bldgId }&year=${nowYear}"
>올해(todo) 보기</a>

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

				<c:forEach var="maintenanceFeeMonthly" items="${maintenanceFeeMonthly }">
					<tr class="hover underlineClick">
						<td>${maintenanceFeeMonthly.roomNum }</td>
						<td>${maintenanceFeeMonthly.tenantName }</td>
						<td>${maintenanceFeeMonthly.leaseType }</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=01">${maintenanceFeeMonthly.monthlyMaintenanceFee1 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=02">${maintenanceFeeMonthly.monthlyMaintenanceFee2 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=03">${maintenanceFeeMonthly.monthlyMaintenanceFee3 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=04">${maintenanceFeeMonthly.monthlyMaintenanceFee4 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=05">${maintenanceFeeMonthly.monthlyMaintenanceFee5 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=06">${maintenanceFeeMonthly.monthlyMaintenanceFee6 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=07">${maintenanceFeeMonthly.monthlyMaintenanceFee7 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=08">${maintenanceFeeMonthly.monthlyMaintenanceFee8 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=09">${maintenanceFeeMonthly.monthlyMaintenanceFee9 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=10">${maintenanceFeeMonthly.monthlyMaintenanceFee10 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=11">${maintenanceFeeMonthly.monthlyMaintenanceFee11 }</a>
						</td>
						<td>
							<a href="../maintenanceFee/maintenanceFeeDetail?bldgId=${param.bldgId }&month=12">${maintenanceFeeMonthly.monthlyMaintenanceFee12 }</a>
						</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</section>



<%@ include file="../../common/foot.jspf"%>