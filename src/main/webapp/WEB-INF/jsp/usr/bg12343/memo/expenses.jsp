<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="EXPENSES"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<section class="mt-2 text-xl px-4">

	<!-- 건물 카테고리 버튼 -->
	<div class="btn btn-sm btn-outline ${param.bldgId == 0 ? 'btn-active' : '' }">
		<a href="expenses?bldgId=0&year=${param.year}">전체 건물 보기</a>
	</div>
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="expenses?bldgId=${building.id }&year=${param.year}">${building.bldgName }</a>
		</c:forEach>
	</div>



	<p>${param.year }년도지출내역</p>


	<a class="btn btn-sm btn-outline ${param.year < nowYear ? 'btn-active' : '' }"
		href="expenses?bldgId=${param.bldgId }&year=${param.year -1}">◀</a>
	<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
		href="expenses?bldgId=${param.bldgId }&year=${nowYear}">올해 보기</a>
	<a class="btn btn-sm btn-outline ${param.year > nowYear ? 'btn-active' : '' }"
		href="expenses?bldgId=${param.bldgId }&year=${param.year + 1}">▶</a>


	<div class="mt-2">
		<button class="btn btn-m btn-outline" id="modalOpen">추가</button>
	</div>

	<!-- 지출내역 월별 표 -->
	<div class="flex justify-evenly">

		<p class="months">1월</p>
		<table class="table-box-1 expenses-table modalAdd-01" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate1 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>

		<p class="months">2월</p>
		<table class="table-box-1 expenses-table modalAdd-02" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate2 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">3월</p>
		<table class="table-box-1 expenses-table modalAdd-03" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate3 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		<p class="months">4월</p>
		<table class="table-box-1 expenses-table modalAdd-04" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate4 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">5월</p>
		<table class="table-box-1 expenses-table modalAdd-05" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate5 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">6월</p>
		<table class="table-box-1 expenses-table modalAdd-06" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate6 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		<p class="months">7월</p>
		<table class="table-box-1 expenses-table modalAdd-07" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate7 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">8월</p>
		<table class="table-box-1 expenses-table modalAdd-08" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate8 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">9월</p>
		<table class="table-box-1 expenses-table modalAdd-09" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate9 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>
	<div class="flex justify-evenly">
		<p class="months">10월</p>
		<table class="table-box-1 expenses-table modalAdd-10" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate10 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">11월</p>
		<table class="table-box-1 expenses-table modalAdd-11" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate11 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>

				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
		<p class="months">12월</p>
		<table class="table-box-1 expenses-table modalAdd-12" border="1">
			<thead>
				<tr>
					<th>지출일</th>
					<th>비용</th>
					<th>지출내용</th>
					<th>건물</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expenses" items="${expenses }">
					<c:if test="${expenses.memoDate12 != null }">
						<tr>
							<td>${expenses.memoDate }</td>
							<td>${expenses.cost }</td>
							<td>${expenses.body }</td>
							<td>${expenses.bldgName }</td>
						</tr>
					</c:if>
				</c:forEach>
				<!-- 새로 추가한 지출내역 동적으로 그리는 부분 -->
			</tbody>
		</table>
	</div>

</section>


<!-- 지출내역 추가 모달 -->

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
								onchange="buildingSelect(this.value)">
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
						<td>

							<!-- 제이쿼리 ui 달력 -->
							<input class="input input-bordered input-sm" autocomplete="off"  type="text" id="datepicker" placeholder="클릭하면 달력이 열립니다" name="memoDate" readonly>

						</td>
					</tr>
					<tr>
						<th>지출비용</th>
						<td>
							<input class="input input-bordered input-secondary input-sm" autocomplete="off" type="text"
								placeholder="숫자만 입력" name="cost" />
						</td>
					</tr>
					<tr>
						<th>지출내용</th>
						<td>
							<input class="input input-bordered input-secondary input-sm" autocomplete="off" type="text"
								placeholder="지출내용 입력" name="body" />
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


<!-- 지출내역 표 스타일 -->
<style>
.expenses-table {
	width: 400px;
}
</style>

<!-- 지출표 보기 좋게 맞추는 중 -->
<style>
.months {
	white-space: nowrap;
}
</style>


<!-- 지출내역 추가 모달 스타일 -->
<style>
#modalExpenses {
	position: absolute;
	left: 50%;
	top: 40%;
	transform: translateX(-50%) translateY(-50%);
	display: none;
	background-color: #ffffff;
	width: 600px;
	height: 400px;
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


<!-- 지출연월 달력 ui -->
<script>
	$(function() {
		$("#datepicker")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd', //Input Display Format 변경
							showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							showMonthAfterYear : true, //년도 먼저 나오고, 뒤에 월 표시
							changeYear : true, //콤보박스에서 년 선택 가능
							changeMonth : true, //콤보박스에서 월 선택 가능                
// 							showOn : "both", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
// 							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
							buttonImageOnly : true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
							buttonText : "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
							yearSuffix : "년", //달력의 년도 부분 뒤에 붙는 텍스트
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ], //달력의 월 부분 텍스트
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 Tooltip 텍스트
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //달력의 요일 부분 텍스트
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ], //달력의 요일 부분 Tooltip 텍스트
							minDate: "-10Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						    maxDate: "+10y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});
	});
</script>



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

			var form = $('#memoAddForm');

			// 입력 값들 초기화
			form.find('input[name="body"]').val('');
			form.find('input[name="memoDate"]').val('');
			form.find('input[name="cost"]').val('');
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
				var newMemoTag = $('<tr style="background-color:gold">');
				newMemoTag.append($('<td>').text(data.memoDate));
				newMemoTag.append($('<td>').text(data.cost));
				newMemoTag.append($('<td>').text(data.body));
				newMemoTag.append($('<td>'));
				$('.modalAdd-' + date).append(newMemoTag);

				// 모달 숨김(class 사용)
				$('#modalExpenses').hide();
				$('#modalBg').hide();
				$('#modalOpen').show();

				// 입력 값들 초기화
				form.find('input[name="body"]').val('');
				form.find('input[name="memoDate"]').val('');
				form.find('input[name="cost"]').val('');

			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		});
	}
</script>

<!-- 지출내역 수정 ajax -->







<%@ include file="../../common/foot.jspf"%>