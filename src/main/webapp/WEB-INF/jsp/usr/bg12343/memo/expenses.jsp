<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="EXPENSES"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../bg12343/memo/expenses?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>

<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="expenses?bldgId=${param.bldgId }&year=${nowYear -1}"
>전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="expenses?bldgId=${param.bldgId }&year=${nowYear}"
>올해(${nowYear}) 보기</a>


23년도 지출내역

<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">

		1월
		<table class="table-box-1" border="1">
			<tr>
				<th>지출일</th>
				<th>비용</th>
				<th>지출내용</th>
				<th>비고</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
		</table>

		2월
		<table class="table-box-1" border="1">
			<tr>
				<th>지출일</th>
				<th>비용</th>
				<th>지출내용</th>
				<th>비고</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>#</td>
			</tr>
		</table>

월별로 1년치 나오도록

		<div class="mt-2">
			<a class="btn btn-m btn-outline" href="">추가</a>
		</div>


	</div>
</section>








<%@ include file="../../common/foot.jspf"%>