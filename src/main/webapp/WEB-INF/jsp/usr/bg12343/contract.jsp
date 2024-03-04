<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTRACT DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<a href="../bg12343/contract?bldgId=0" class="btn btn-sm btn-outline">전체보기</a>
<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../bg12343/contract?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${contractsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>계약번호</th>
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
					<th>보증금 납부일</th>
					<th>월세 납부일</th>
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
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="btns mt-5">
		<a class="btn btn-outline" href="../bg12343/contractSetupAdd">추가(지금은 setup, 나중에 링크 그냥 Add로 또 만들어야함)</a>
		<a class="btn btn-outline" href="../bg12343/contractModify?bldgId=${param.bldgId }">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>





</section>










<%@ include file="../common/foot.jspf"%>