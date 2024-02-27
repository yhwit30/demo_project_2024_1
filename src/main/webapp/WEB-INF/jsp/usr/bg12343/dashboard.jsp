<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DASHBOARD"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<a class="btn btn-outline"  href="/usr/bg12343/memoAdd">메모</a>
<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>
						<a class="btn btn-outline" href="/usr/bg12343/building">건물명</a>
					</th>
					<th>
						<a class="btn btn-outline"  href="/usr/bg12343/room">호실번호</a>
					</th>
					<th>기준 보증금</th>
					<th>기준 월세</th>
					<th>기준 전세</th>
					<th>
						<a class="btn btn-outline"  href="/usr/bg12343/tenant">세입자명</a>
					</th>
					<th>임대형태</th>
					<th>현 보증금</th>
					<th>현 월세</th>
					<th>보증금</th>
					<th>월세</th>
					<th>
						<a class="btn btn-outline"  href="/usr/bg12343/maintenanceFee">관리비</a>
					</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금 납부일</th>
					<th>세 납기일</th>
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
					<th>12월</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="dashboard" items="${dashboard }">
					<tr class="hover">
						<td>${dashboard.bldgName }</td>
						<td>${dashboard.roomNum }</td>
						<td>${dashboard.standardDeposit }</td>
						<td>${dashboard.standardRent }</td>
						<td>${dashboard.standardJeonse }</td>
						<td>${dashboard.tenantName }</td>
						<td>${dashboard.leaseType }</td>
						<td>${dashboard.deposit }</td>
						<td>${dashboard.rent }</td>
						<td>${dashboard.deposit }</td>
						<td>${dashboard.rent }</td>
						<td>${dashboard.maintenanceFee }</td>
						<td>${dashboard.contractStartDate }</td>
						<td>${dashboard.contractEndDate }</td>
						<td>${dashboard.depositDate }</td>
						<td>${dashboard.rentDate }</td>
						<td>${dashboard.tenantPhone }</td>
						<td>${dashboard.paymentStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







</section>






<%@ include file="../common/foot.jspf"%>