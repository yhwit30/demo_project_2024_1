<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${buildingsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>건물명</th>
					<th>건물주소</th>
					<th>전체호실수</th>
					<th>건물메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="building" items="${buildings }">
					<tr class="hover">
						<td>${building.id }</td>
						<td>${building.regDate.substring(0,10) }</td>
						<td>${building.bldgName }</td>
						<td>${building.bldgAdd }</td>
						<td>${building.roomTotal }</td>
						<td>${building.bldgMemo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../bg12343/buildingModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
	<a class="btn btn-outline" href="/usr/bg12343/buildingAdd"> 건물 추가</a>






</section>










<%@ include file="../common/foot.jspf"%>