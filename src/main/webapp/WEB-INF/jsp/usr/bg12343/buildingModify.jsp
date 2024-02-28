<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

<section class="mt-2 text-xl px-4">
	<form action="../bg12343/doBuildingModify" method="POST">
		<div class="mx-auto overflow-x-auto">
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
					<tr>
						<td>${buildingRd.id }
							<input type="hidden" name="bldgId" value="${buildingRd.id }" />
						</td>
						<td>${buildingRd.regDate.substring(0,10) }</td>
						<td>
							<input size="3" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="bldgName"
								value="${buildingRd.bldgName }" />
						</td>
						<td>
							<input size="5" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="bldgAdd"
								value="${buildingRd.bldgAdd }" />
						</td>
						<td>
							<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="roomTotal"
								value="${buildingRd.roomTotal }" />
						</td>
						<td>
							<input size="30" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="bldgMemo"
								value="#" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<br />
		<!-- 호실정보 가져오기 -->
		<div class="mx-auto overflow-x-auto">
			<table class="table-box-1 table" border="1">
				<thead>
					<tr>
						<th>호실</th>
						<th>형태</th>
						<th>면적(m2)</th>
						<th>기준 보증금</th>
						<th>기준 월세</th>
						<th>기준 전세</th>
						<th>메모</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="room" items="${rooms }">
					<input type="hidden" name="roomId" value="${room.id }" />
						<tr class="hover">
							<td>
								<input size="1" autocomplete="off" type="text" name="roomNum" value="${room.roomNum }" />
							</td>
							<td>
								<input size="2" autocomplete="off" type="text" name="roomType" value="${room.roomType }" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" name="roomArea" value="${room.roomArea }" />
							</td>
							<td>
								<input size="5" autocomplete="off" type="text" name="standardDeposit" value="${room.standardDeposit }" />
							</td>
							<td>
								<input size="4" autocomplete="off" type="text" name="standardRent" value="${room.standardRent }" />
							</td>
							<td>
								<input size="6" autocomplete="off" type="text" name="standardJeonse" value="${room.standardJeonse }" />
							</td>
							<td>#</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div>
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			<input class="btn btn-info" type="submit" value="수정" />
		</div>
	</form>




</section>










<%@ include file="../common/foot.jspf"%>