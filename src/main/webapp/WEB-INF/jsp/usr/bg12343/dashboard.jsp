<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DASHBOARD"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<section class="mt-2 text-xl px-4 ">
	<div class="mx-auto overflow-x-auto inline-block">
		<table class="table-box-1 table " border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>건물명</th>
					<th>보증금 합계</th>
					<th>월세 합계</th>
					<th>관리비 합계</th>
					<th>수익률(연)</th>
					<th>입주율</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="dashboard" items="${dashboard }">
					<tr class="hover">
						<td>${dashboard.bldgName }</td>
						<td>#</td>
						<td>#</td>
						<td>#</td>
						<td>#</td>
						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
		<div class="weather">
날씨 부분
<i class="fa-solid fa-sun"></i>
</div>
</section>







<%@ include file="../common/foot.jspf"%>