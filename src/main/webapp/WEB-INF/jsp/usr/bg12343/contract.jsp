<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTRACT DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${contractsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>계약관리번호</th>
					<th>등록일</th>
					<th>갱신일</th>
					<th>건물명</th>
					<th>호실번호</th>
					<th>세입자명</th>
					<th>임대형태</th>
					<th>보증금</th>
					<th>월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금 납기일</th>
					<th>월세 납기일</th>
					<th>계약메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="contract" items="${contracts }">
					<tr class="hover">
						<td>${contract.id }</td>
						<td>${contract.regDate.substring(0,10) }</td>
						<td>${contract.updateDate.substring(0,10) }</td>
						<td>${contract.bldgName }</td>
						<td>${contract.roomNum }</td>
						<td>${contract.tenantName }</td>
						<td>${contract.leaseType }</td>
						<td>${contract.deposit }</td>
						<td>${contract.rent }</td>
						<td>${contract.maintenanceFee }</td>
						<td>${contract.contractStartDate }</td>
						<td>${contract.contractEndDate }</td>
						<td>${contract.depositDate }</td>
						<td>${contract.rentDate }</td>
						<td>${contract.contractMemo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







</section>










<%@ include file="../common/foot.jspf"%>