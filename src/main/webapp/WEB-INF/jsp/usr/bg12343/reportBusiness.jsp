<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPORT BUSINESS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

사업장 현황신고 dashboard controller 위치 23년도 사업장 현황신고

<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../bg12343/reportBusiness?bldgId=${building.id }">${building.bldgName }</a>
	</c:forEach>
</div>

<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="rentStatus?bldgId=${param.bldgId }&year=${nowYear -1}">전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="rentStatus?bldgId=${param.bldgId }&year=${nowYear}">올해(${nowYear}) 보기</a>



<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<c:forEach var="rentStatus" items="${rentStatus }">
				<thead>

					<tr>
						<th>호실</th>
						<th>호실형태</th>
						<th>임대료</th>
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
					<tr>
						<td rowspan="2">${rentStatus.roomNum }</td>
						<td rowspan="2">${rentStatus.roomType }</td>
						<td>납부 보증금</td>
						<td>${rentStatus.deposit }</td>
					</tr>
					<tr>
						<td>납부 월세</td>
						<td>${rentStatus.rent }</td>
					</tr>
					<tr>
						<td>세입자 정보</td>
						<td>${rentStatus.tenantName }</td>
						<td>${rentStatus.tenantPhone }</td>
					</tr>
				</tbody>
				<tr>
					<td colspan="16">
						<br>
						<!-- 단위별로 줄바꿈 -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>