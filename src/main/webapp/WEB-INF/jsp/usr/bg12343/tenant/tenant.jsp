<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TENANT DETAIL"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>



<section class="mt-2 text-xl px-4">
<a class="btn btn-sm btn-outline ${0 == param.bldgId ? 'btn-active' : '' }" href="../tenant/tenant?bldgId=0"> 전체보기</a>
<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../tenant/tenant?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>

	<!-- 세입자표 -->
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${tenantsCnt }명</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>건물명</th>
					<th>호실</th>
					<th>세입자명</th>
					<th>세입자휴대폰</th>
					<th>세입자차량</th>
					<th>임대형태</th>
					<th>보증금</th>
					<th>월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금납부일</th>
					<th>납부일</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tenant" items="${tenants }">
					<tr class="hover">
						<td>${tenant.bldgName }</td>
						<td>${tenant.roomNum }</td>
						<td>${tenant.tenantName }</td>
						<td>${tenant.tenantPhone }</td>
						<td>${tenant.tenantCarNum }</td>
						<td>${tenant.leaseType }</td>
						<td>${tenant.deposit }</td>
						<td>${tenant.rent }</td>
						<td>${tenant.maintenanceFee }</td>
						<td>${tenant.contractStartDate }</td>
						<td>${tenant.contractEndDate }</td>
						<td>${tenant.depositDate }</td>
						<td>${tenant.rentDate }</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns mt-5">
		<a class="btn btn-outline" href="../tenant/tenantModify?bldgId=${param.bldgId }">전체 수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
	<a class="btn btn-outline" href="/usr/bg12343/tenant/tenantAdd"> 세입자 추가(todo)</a>

</section>










<%@ include file="../../common/foot.jspf"%>