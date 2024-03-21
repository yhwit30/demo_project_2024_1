<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMO ADD"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<!-- 건물을 선택할 때 해당 호실을 불러오기 -->
<script>
	// 페이지 로드 시 기본값으로 bldgId를 1로 설정하고 호실 목록을 가져옴
	window.onload = function() {
		var defaultBldgId = 1;
		buildingSelect(defaultBldgId);
	};
	function buildingSelect(bldgId) {
		console.log('bldgId:' + bldgId);
		$.post({
			url : '/usr/bg12343/contract/getRoomsForContract',
			type : 'POST',
			data : {
				bldgId : bldgId
			},
			success : function(data) {
				console.log(data);
				// 기존 option태그 초기화
				var roomSelect = document.getElementById("roomNum");
				roomSelect.innerHTML = "";
				// 가져온 호실데이터를 option 태그로 그려주기
				data.forEach(function(room) {
					var option = document.createElement("option");
					option.value = room.id;
					option.text = room.roomNum;
					roomSelect.appendChild(option);
				});
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		});
	}
</script>

<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
		<form action="../bg12343/memo/doMemoAdd" method="POST">
			<table class="table-box-detail" border="1">
				<tbody>
					<tr>
						<th>건물명</th>
						<td>
							<select class="select select-bordered select-sm w-20 max-w-xs" name="bldgId"
								onchange="buildingSelect(this.value)"
							>
								<c:forEach var="building" items="${buildings }">
									<option value="${building.id }">${building.bldgName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>호실</th>
						<td>
							<!-- 호실 선택 -->
							<select class="select select-bordered select-sm w-20 max-w-xs" name="roomId" id="roomNum">
								<!--ajax에서 option 태그를 그려준다 -->
							</select>
						</td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select class="select select-bordered select-sm max-w-xs" name="boardId" onchange="boardSelect(this.value)">
								<option value="5">작업일지</option>
								<option value="6">지출내역</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title"
							/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="메모내용을 입력해주세요" name="body"
							/>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="완료" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>





<%@ include file="../../common/foot.jspf"%>