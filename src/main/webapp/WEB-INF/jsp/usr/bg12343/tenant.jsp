<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TENANT DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${tenantsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>세입자관리번호</th>
					<th>세입자명</th>
					<th>세입자휴대폰</th>
					<th>세입자차량</th>
					<th>세입자메모</th>
					<th>건물명</th>
					<th>호실</th>
					<th>보증금</th>
					<th>월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금납부일</th>
					<th>세 납기일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tenant" items="${tenants }">
					<tr class="hover">
						<td>${tenant.id }</td>
						<td>${tenant.tenantName }</td>
						<td>${tenant.tenantPhone }</td>
						<td>${tenant.tenantCarNum }</td>
						<td>${tenant.tenantMemo }</td>
						<td>${tenant.bldgName }</td>
						<td>${tenant.roomNum }</td>
						<td>${tenant.deposit }</td>
						<td>${tenant.rent }</td>
						<td>${tenant.maintenanceFee }</td>
						<td>${tenant.contractStartDate }</td>
						<td>${tenant.contractEndDate }</td>
						<td>${tenant.depositDate }</td>
						<td>${tenant.rentDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../bg12343/tenantModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>


</section>










<%@ include file="../common/foot.jspf"%>