<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING ROOM"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${roomsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>건물명</th>
					<th>호실</th>
					<th>호실형태</th>
					<th>호실메모</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="room" items="${rooms }">
					<tr class="hover">
						<td>${room.id }</td>
						<td>${room.regDate.substring(0,10) }</td>
						<td>${room.bldgId }</td>
						<td>${room.roomNum }</td>
						<td>${room.roomType }</td>
						<td>${room.roomMemo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







</section>










<%@ include file="../common/foot.jspf"%>