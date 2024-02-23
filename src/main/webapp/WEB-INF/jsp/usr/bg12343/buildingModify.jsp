<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${buildingsCnt }개</div>


		<form action="../building/doModify" method="POST">

			<table class="modify-box table-box-1" border="1">
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
						<tr>
							<td>${building.id }</td>
							<input type="hidden" name="id" value="${building.id }" />
							<td>${building.regDate.substring(0,10) }</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="bldgName" value="${building.bldgName }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="bldgAdd" value="${building.bldgAdd }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="roomTotal" value="${building.roomTotal }"
								/>
							</td>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="내용을 입력해주세요" name="bldgMemo" value="${building.bldgMemo }"
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