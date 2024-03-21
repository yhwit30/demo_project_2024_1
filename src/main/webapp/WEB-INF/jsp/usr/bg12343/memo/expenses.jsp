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

	<div class="mt-2">
		<button class="btn btn-m btn-outline" id="modalOpen">추가</button>
	</div>

	<div class="mx-auto overflow-x-auto">

		1월
		<table class="table-box-1" border="1">
			<tr>
				<th>지출일</th>
				<th>비용</th>
				<th>지출내용</th>
				<th>비고</th>
			</tr>

			<c:forEach var="expenses" items="${expenses }">
				<tr>
					<td>${expenses.memoDate }</td>
					<td>${expenses.cost }</td>
					<td>${expenses.title }</td>
					<td>${expenses.body }</td>
				</tr>

			</c:forEach>

			<tr>
				<td id="memoDate"></td>
				<td id="cost"></td>
				<td id="body"></td>
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




	</div>
</section>


<!-- 지출내역 추가 모달 -->
<style>
#modalExpenses {
	position: absolute;
	left: 50%;
	top: 40%;
	transform: translateX(-50%) translateY(-50%);
	display: none;
	background-color: #ffffff;
	width: 700px;
	height: 450px;
	z-index: 51;
	border-radius: 10px;
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

.modalTable {
	margin-top: 20px;
}
</style>


<!-- 모달 toggle 컨트롤 -->
<script>
	$(document).ready(function() {
		// 모달 띄우기
		$('#modalOpen').click(function() {
			$('#modalExpenses').show();
			$('#modalBg').show();
		});
		// 모달 닫기
		$('#modalClose').click(function() {
			$('#modalExpenses').hide();
			$('#modalBg').hide();
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

<!-- 지출내역 추가 함수 -->
<script>
	// 추가 함수
	function doAddMemo() {

		// 해당 contractId를 가진 form 요소를 선택합니다.
		var form = $('#memoAddForm');

		// 수정할 데이터를 가져옵니다.
		var roomId = form.find('select[name="roomId"]').val();
		var boardId = form.find('input[name="boardId"]').val();
		var body = form.find('input[name="body"]').val();
		var memoDate = form.find('input[name="memoDate"]').val();
		var cost = form.find('input[name="cost"]').val();

		// 공백 체크
		if (String(roomId).trim() === '' || String(boardId).trim() === ''
				|| String(body).trim() === '' || String(memoDate).trim() === ''
				|| String(cost).trim() === '') {
			alert('공백을 채워주세요');
			return;
		}

		$.post({
			url : '/usr/bg12343/memo/doMemoAddAjax',
			type : 'POST',
			data : {
				roomId : roomId,
				boardId : boardId,
				body : body,
				memoDate : memoDate,
				cost : cost
			},
			success : function(data) {

				// 데이터를 성공적으로 가져왔다면 각 요소에 데이터를 그려줍니다.(id 사용)
				$('#memoDate').text(data.memoDate);
				$('#cost').text(data.cost);
				$('#body').text(data.body);

				// 모달 숨김(class 사용)
				$('#modalExpenses').hide();
				$('#modalBg').hide();
				$('#modalOpen').show();

				// 수정된 데이터 보여주기(id 사용)
				// 				$('#memoDate').show();
				// 				$('#cost').show();
				// 				$('#body').show();

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
	<div>
		<form id="memoAddForm" onsubmit="return false;" action="../bg12343/memo/doMemoAdd" method="POST">
			<table class="table-box-detail modalTable" border="1">
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
						<input type="hidden" name="boardId" value="6" />
						<td>지출내역</td>
					</tr>
					<tr>
						<th>지출연월</th>
						<!-- 						예시 -->
						<input type="hidden" name="memoDate" value="2024-2-4" />
						<td>달력(todo)</td>
					</tr>
					<tr>
						<th>지출비용</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="cost"
							/>
						</td>
					</tr>
					<tr>
						<th>지출내용</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="메모내용을 입력해주세요" name="body"
							/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button onclick="doAddMemo();" class="btn btn-outline btn-info">완료</button>
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