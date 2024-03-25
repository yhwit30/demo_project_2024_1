<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="EXPENSES"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="expenses?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>

<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="expenses?bldgId=${param.bldgId }&year=${nowYear -1}"
>전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="expenses?bldgId=${param.bldgId }&year=${nowYear}"
>올해(${nowYear}) 보기</a>


24년도 지출내역

<!-- 지출내역 표 스타일 -->
<style>
.expenses-table {
	width: 400px;
}
</style>


<section class="mt-2 text-xl px-4">

	<div class="mt-2">
		<button class="btn btn-m btn-outline" id="modalOpen">추가</button>
	</div>

	<!-- 지출내역 월별 표 -->
	<div class="flex justify-evenly">

		1월
		<table class="table-box-1 expenses-table modalAdd-01" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate1 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>

		2월
		<table class="table-box-1 expenses-table modalAdd-02" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate2 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		3월
		<table class="table-box-1 expenses-table modalAdd-03" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate3 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		4월
		<table class="table-box-1 expenses-table modalAdd-04" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate4 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		5월
		<table class="table-box-1 expenses-table modalAdd-05" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate5 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		6월
		<table class="table-box-1 expenses-table modalAdd-06" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate6 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		7월
		<table class="table-box-1 expenses-table modalAdd-07" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate7 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		8월
		<table class="table-box-1 expenses-table modalAdd-08" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate8 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		9월
		<table class="table-box-1 expenses-table modalAdd-09" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate9 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		10월
		<table class="table-box-1 expenses-table modalAdd-10" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate10 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		11월
		<table class="table-box-1 expenses-table modalAdd-11" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate11 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		12월
		<table class="table-box-1 expenses-table modalAdd-12" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate12 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>#</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
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
		var bldgId = form.find('select[name="bldgId"]').val();
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
		// 숫자 체크
		if (isNaN(cost)) {
			alert('비용은 숫자만 입력 가능합니다');
			$('input[name="cost"]').focus();
			return;
		}

		$.post({
			url : '/usr/bg12343/memo/doMemoAddAjax',
			type : 'POST',
			data : {
				bldgId : bldgId,
				roomId : roomId,
				boardId : boardId,
				body : body,
				memoDate : memoDate,
				cost : cost
			},
			success : function(data) {

				// 태그이름찾기 위한 월 데이터 정제
				var split = data.memoDate.split('-');
				var date = split[1];

				// 데이터를 성공적으로 가져왔다면 각 요소에 데이터를 그려줍니다.
				// 빈 <tr> 태그 그리기
				var newMemoTag = $('<tr>');
				newMemoTag.append($('<td>').text(data.memoDate));
				newMemoTag.append($('<td>').text(data.cost));
				newMemoTag.append($('<td>').text(data.body));
				newMemoTag.append($('<td>'));
				$('.modalAdd-' + date).append(newMemoTag);

				// 모달 숨김(class 사용)
				$('#modalExpenses').hide();
				$('#modalBg').hide();
				$('#modalOpen').show();

			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		});
	}
</script>


<!-- 모달 투명한 배경용 태그 -->
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
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								name="memoDate"
							/>
							달력(todo)
						</td>
					</tr>
					<tr>
						<th>지출비용</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="지출비용을 입력해주세요" name="cost"
							/>
						</td>
					</tr>
					<tr>
						<th>지출내용</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="지출내용을 입력해주세요" name="body"
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


	<!-- 	달력용 스크립트 -->
	<script>
		var today = new Date(); // 현재 날짜를 가져옴
		function buildCalendar() {
			var row = null
			var cnt = 0; // 셀의 개수를 세는 변수
			var calendarTable = document.getElementById("calendar"); // 달력 테이블 요소 가져오기
			var calendarTableTitle = document.getElementById("calendarTitle"); // 달력 제목 요소 가져오기
			calendarTableTitle.innerHTML = today.getFullYear() + "년"
					+ (today.getMonth() + 1) + "월"; // 달력 제목 설정

			var firstDate = new Date(today.getFullYear(), today.getMonth(), 1); // 현재 달의 첫째 날
			var lastDate = new Date(today.getFullYear(), today.getMonth() + 1,
					0); // 현재 달의 마지막 날
			while (calendarTable.rows.length > 2) {
				calendarTable.deleteRow(calendarTable.rows.length - 1); // 달력의 행 삭제 (날짜 표시 부분만 남김)
			}

			var isFirstRow = true;
			for (var i = 1; i <= lastDate.getDate(); i++) { // 현재 달의 날짜만큼 반복
				if (isFirstRow) { // 첫 번째 행인지 확인
					row = calendarTable.insertRow(); // 새로운 행 추가
					isFirstRow = false;
					for (var j = 0; j < firstDate.getDay(); j++) {
						var cell = row.insertCell(); // 빈 셀 추가 (첫째 날 이전)
						cnt += 1;
					}
				}
				if (cnt % 7 == 0) { // 일주일이 지나면 새로운 행 추가
					row = calendarTable.insertRow();
				}
				var cell = row.insertCell(); // 날짜를 표시할 셀 추가
				cnt += 1;
				cell.setAttribute('id', i); // 셀의 ID 설정
				cell.innerHTML = i; // 셀에 날짜 표시
				cell.align = "center";

				cell.onclick = function() { // 셀 클릭 시
					var clickedYear = today.getFullYear();
					var clickedMonth = (1 + today.getMonth());
					var clickedDate = this.getAttribute('id'); // 클릭한 셀의 날짜 가져오기

					clickedDate = clickedDate >= 10 ? clickedDate : '0'
							+ clickedDate;
					clickedMonth = clickedMonth >= 10 ? clickedMonth : '0'
							+ clickedMonth;
					var clickedYMD = clickedYear + "-" + clickedMonth + "-"
							+ clickedDate; // 선택한 날짜를 YYYY-MM-DD 형식으로 변환

					opener.document.getElementById("date").value = clickedYMD; // 부모 창의 입력 필드에 선택한 날짜 설정
					self.close(); // 현재 창 닫기
				}

				if (cnt % 7 == 1) { // 일요일인 경우
					cell.innerHTML = "<font color=#F79DC2>" + i + "</font>"; // 일요일에는 빨간색으로 표시
				}

				if (cnt % 7 == 0) { // 토요일인 경우
					cell.innerHTML = "<font color=skyblue>" + i + "</font>"; // 토요일에는 파란색으로 표시
				}
			}
		}

		function prevCalendar() {
			today = new Date(today.getFullYear(), today.getMonth() - 1, today
					.getDate()); // 이전 달로 이동
			buildCalendar(); // 달력 다시 빌드
		}

		function nextCalendar() {
			today = new Date(today.getFullYear(), today.getMonth() + 1, today
					.getDate()); // 다음 달로 이동
			buildCalendar(); // 달력 다시 빌드
		}
	</script>



	<!-- 	달력 -->
	<table id="calendar" align="center">
		<tr>
			<td align="center">
				<label onclick="prevCalendar()"> ◀ </label>
			</td>
			<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
			<td align="center">
				<label onclick="nextCalendar()"> ▶ </label>
			</td>
		</tr>
		<tr>
			<td align="center">
				<font color="#F79DC2">일 
			</td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center">
				<font color="skyblue">토 
			</td>
		</tr>
		<script type="text/javascript">
			buildCalendar();
		</script>
	</table>





</section>






<%@ include file="../../common/foot.jspf"%>