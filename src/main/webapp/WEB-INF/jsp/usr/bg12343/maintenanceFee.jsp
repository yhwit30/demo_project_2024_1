<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAINTENANCE FEE"></c:set>
<%@ include file="../common/head.jspf"%>



<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>건물명</th>
					<th>호실</th>
					<th>세입자</th>
					<th>임대형태</th>
					<th>공동전기</th>
					<th>공동수도</th>
					<th>엘레베이터</th>
					<th>인터넷티비</th>
					<th>소방안전</th>
					<th>수도사용</th>
					<th>수도단가</th>
					<th>수도금액</th>
					<th>전기사용</th>
					<th>전기단가</th>
					<th>전기금액</th>
					<th>가스사용</th>
					<th>가스단가</th>
					<th>가스금액</th>
					<th>당월계</th>
					<th>연체료</th>
					<th>납기후 금액</th>
					<th>납부일</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="maintenanceFee" items="${maintenanceFee }">
					<tr class="hover">
						<td>${maintenanceFee.bldgName }</td>
						<td>${maintenanceFee.roomNum }</td>
						<td>${maintenanceFee.tenantName }</td>
						<td>${maintenanceFee.leaseType }</td>
						<td>${maintenanceFee.commonElec }</td>
						<td>${maintenanceFee.commonWater }</td>
						<td>${maintenanceFee.elevater }</td>
						<td>${maintenanceFee.internetTV }</td>
						<td>${maintenanceFee.fireSafety }</td>
						<td>${maintenanceFee.waterUse }</td>
						<td>${maintenanceFee.waterCost }</td>
						<td>${maintenanceFee.waterBill }</td>
						<td>${maintenanceFee.elecUse }</td>
						<td>${maintenanceFee.elecCost }</td>
						<td>${maintenanceFee.elecBill }</td>
						<td>${maintenanceFee.gasUse }</td>
						<td>${maintenanceFee.gasCost }</td>
						<td>${maintenanceFee.gasBill }</td>
						<td>${maintenanceFee.monthlyMaintenanceFee }</td>
						<td>${maintenanceFee.lateFee }</td>
						<td>${maintenanceFee.lateMaintenanceFee }</td>
						<td>${maintenanceFee.maintenanceFeeDate }</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../bg12343/maintenanceFeeModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>

</section>



<%@ include file="../common/foot.jspf"%>