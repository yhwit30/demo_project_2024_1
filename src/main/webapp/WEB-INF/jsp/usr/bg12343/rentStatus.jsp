<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<h1>수납관리 페이지</h1>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>건물명</th>
					<th>호실번호</th>
					<th>기준 보증금</th>
					<th>기준 월세</th>
					<th>기준 전세</th>
					<th>세입자명</th>
					<th>임대형태</th>
					<th>현 보증금</th>
					<th>현 월세</th>
					<th>보증금</th>
					<th>월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금 납부일</th>
					<th>세 납기일</th>
					<th>세입자휴대폰</th>
					<th>1월</th>
					<th>2</th>
					<th>3</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="rentStatus" items="${rentStatus }">
					<tr class="hover">
						<td>${rentStatus.bldgName }</td>
						<td>${rentStatus.roomNum }</td>
						<td>${rentStatus.standardDeposit }</td>
						<td>${rentStatus.standardRent }</td>
						<td>${rentStatus.standardJeonse }</td>
						<td>${rentStatus.tenantName }</td>
						<td>${rentStatus.leaseType }</td>
						<td>${rentStatus.deposit }</td>
						<td>${rentStatus.rent }</td>
						<td>${rentStatus.deposit }</td>
						<td>${rentStatus.rent }</td>
						<td>${rentStatus.maintenanceFee }</td>
						<td>${rentStatus.contractStartDate }</td>
						<td>${rentStatus.contractEndDate }</td>
						<td>${rentStatus.depositDate }</td>
						<td>${rentStatus.rentDate }</td>
						<td>${rentStatus.tenantPhone }</td>
						<td>${rentStatus.paymentStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







</section>






<%@ include file="../common/foot.jspf"%>