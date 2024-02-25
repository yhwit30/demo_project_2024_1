<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ROOM DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${roomsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>호실관리번호</th>
					<th>건물명</th>
					<th>호실</th>
					<th>호실형태</th>
					<th>호실메모</th>
					<th>기준보증금</th>
					<th>기준월세</th>
					<th>기준전세</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="room" items="${rooms }">
					<tr class="hover">
						<td>${room.id }</td>
						<td>${room.bldgName }</td>
						<td>${room.roomNum }</td>
						<td>${room.roomType }</td>
						<td>${room.roomMemo }</td>
						<td>${room.standardDeposit }</td>
						<td>${room.standardRent }</td>
						<td>${room.standardJeonse }</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../bg12343/roomModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
	<a class="btn btn-outline" href="/usr/bg12343/roomAdd"> 호실 추가</a>





</section>










<%@ include file="../common/foot.jspf"%>