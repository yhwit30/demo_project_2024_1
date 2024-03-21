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
			<button class="btn btn-m btn-outline" id="modalOpen">추가</button>
		</div>


	</div>
</section>


<!-- 지출내역 추가 모달 -->
<style>
#modalExpenses {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translateX(-50%) translateY(-50%);
	display: none;
	background-color: #ffffff;
	width: 700px;
	height: 400px;
	z-index: 51;
}

#modalContent {
	display: flex;
	justify-content: center;
}

#modalBg {
	display: none;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	position: absolute;
	left: 0;
	top: 0;
	z-index: 50;
}
</style>


<!-- 모달 toggle 컨트롤 -->
<script>
	$(document).ready(function() {
		// 모달 띄우기
		$('#modalOpen').click(function() {
			$('#modalExpenses').show();
			$('#modalBg').show();
			$('#modalOpen').hide();
		});
		// 모달 닫기
		$('#modalClose').click(function() {
			$('#modalExpenses').hide();
			$('#modalBg').hide();
			$('#modalOpen').show();
		});
	});
</script>


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

<!-- 모달 투명한 배경용 -->
<div id="modalBg"></div>
<!-- 지출내역 추가 입력란 -->
<section class="text-lg" id="modalExpenses">
	<div id="modalContent">
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


	</div>
		<div class="mt-2">
			<button class="btn btn-outline" id="modalClose">닫기</button>
		</div>
</section>






<%@ include file="../../common/foot.jspf"%>