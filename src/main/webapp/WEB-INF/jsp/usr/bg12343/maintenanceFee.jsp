<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAINTENANCE FEE"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<!-- 건물 개수대로 가져오는 함수로 수정해야함 -->
<div>
	<a class="btn btn-sm btn-outline ${param.bldgId == 1 ? 'btn-active' : '' }" href="../bg12343/maintenanceFee?bldgId=1">건물1
		가나</a>
	<a class="btn btn-sm btn-outline ${param.bldgId == 2 ? 'btn-active' : '' }" href="../bg12343/maintenanceFee?bldgId=2">건물2
		다라</a>
</div>

<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }" href="maintenanceFee?bldgId=${param.bldgId }&year=${nowYear -1}">전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }" href="maintenanceFee?bldgId=${param.bldgId }&year=${nowYear}">올해(${nowYear}) 보기</a>


<style type="text/css">
	.underlineClick > td > a:hover{
		background-color: skyblue;
		text-decoration: underline;
	}
</style>

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

				<c:forEach var="maintenanceFeeMonthly" items="${maintenanceFeeMonthly }">
					<tr class="hover underlineClick">
						<td>${maintenanceFeeMonthly.roomNum }</td>
						<td>${maintenanceFeeMonthly.tenantName }</td>
						<td>${maintenanceFeeMonthly.leaseType }</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=1">${maintenanceFeeMonthly.monthlyMaintenanceFee1 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=2">${maintenanceFeeMonthly.monthlyMaintenanceFee2 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=3">${maintenanceFeeMonthly.monthlyMaintenanceFee3 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=4">${maintenanceFeeMonthly.monthlyMaintenanceFee4 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=5">${maintenanceFeeMonthly.monthlyMaintenanceFee5 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=6">${maintenanceFeeMonthly.monthlyMaintenanceFee6 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=7">${maintenanceFeeMonthly.monthlyMaintenanceFee7 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=8">${maintenanceFeeMonthly.monthlyMaintenanceFee8 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=9">${maintenanceFeeMonthly.monthlyMaintenanceFee9 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=10">${maintenanceFeeMonthly.monthlyMaintenanceFee10 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=11">${maintenanceFeeMonthly.monthlyMaintenanceFee11 }</a>
						</td>
						<td>
							<a href="../bg12343/maintenanceFeeDetail?bldgId=${param.bldgId }&month=12">${maintenanceFeeMonthly.monthlyMaintenanceFee12 }</a>
						</td>
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