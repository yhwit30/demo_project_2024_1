<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<!-- 건물 개수대로 가져오는 함수로 수정해야함 -->
<div>
	<a class="btn btn-outline ${param.bldgId == 1 ? 'btn-active' : '' }" href="../bg12343/rentStatus?bldgId=1">건물1 가나</a>
	<a class="btn btn-outline ${param.bldgId == 2 ? 'btn-active' : '' }" href="../bg12343/rentStatus?bldgId=2">건물2 다라</a>
</div>

2024


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>호실번호</th>
					<th>세입자명</th>
					<th>임대형태</th>
					<th>현 보증금</th>
					<th>현 월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금 납부일</th>
					<th>납부일</th>
					<th>세입자휴대폰</th>
					<th>1월</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
					<th>9</th>
					<th>10</th>
					<th>11</th>
					<th>12</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="rentStatus" items="${rentStatus }">
					<tr class="hover">
						<td>${rentStatus.roomNum }</td>
						<td>${rentStatus.tenantName }</td>
						<td>${rentStatus.leaseType }</td>
						<td>${rentStatus.deposit }</td>
						<td>${rentStatus.rent }</td>
						<td>${rentStatus.maintenanceFee }</td>
						<td>${rentStatus.contractStartDate }</td>
						<td>${rentStatus.contractEndDate }</td>
						<td>${rentStatus.depositDate }</td>
						<td>${rentStatus.rentDate }</td>
						<td>${rentStatus.tenantPhone }</td>
						<td>${rentStatus.januaryPaymentStatus }</td>
						<td>${rentStatus.februaryPaymentStatus }</td>
						<td>${rentStatus.marchPaymentStatus }</td>
						<td>${rentStatus.aprilPaymentStatus }</td>
						<td>${rentStatus.mayPaymentStatus }</td>
						<td>${rentStatus.junePaymentStatus }</td>
						<td>${rentStatus.julyPaymentStatus }</td>
						<td>${rentStatus.augustPaymentStatus }</td>
						<td>${rentStatus.septemberPaymentStatus }</td>
						<td>${rentStatus.octoberPaymentStatus }</td>
						<td>${rentStatus.novemberPaymentStatus }</td>
						<td>${rentStatus.decemberPaymentStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







</section>






<%@ include file="../common/foot.jspf"%>