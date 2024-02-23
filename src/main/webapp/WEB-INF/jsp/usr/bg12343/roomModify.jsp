<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ROOM MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${roomsCnt }개</div>


		<form action="../bg12343/doRoomModify" method="POST">

			<table class="modify-box table-box-1 table" border="1">
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
						<tr>
							<td>${room.id }
								<input type="hidden" name="id" value="${room.id }" />
							</td>
							<td>${room.bldgName }
								<input type="hidden" name="bldgId" value="${room.bldgId }" />
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="roomNum" value="${room.roomNum }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="roomType" value="${room.roomType }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="roomMemo" value="${room.roomMemo }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="standardDeposit" value="${room.standardDeposit }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="standardRent" value="${room.standardRent }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="standardJeonse" value="${room.standardJeonse }"
								/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input class="btn btn-info" type="submit" value="수정" />
			</div>
		</form>

	</div>


</section>










<%@ include file="../common/foot.jspf"%>