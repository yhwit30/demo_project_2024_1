<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPAIR"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>



<!-- 달력 스타일 -->
<style>
.calendar-container {
	width: 300px;
	margin: 30px auto;
	border: 1px solid #ccc;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	padding: 10px;
	background-color: #fdefde;
	text-align: center;
}

.calendar-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.calendar-days {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	/* 
  grid-template-columns : CSS의 Grid 레이아웃에서 사용되는 속성(property) 중 하나로, 
  그리드 컨테이너(grid container)의 열(column) 크기를 지정하는 것을 말한다.
  repeat(7, 1fr) : 1행에 7개의 열이 있으며, 
  각 열의 크기를 동일하게 1분의 1(fractional unit, fr)로 설정하라는 의미한다. */
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	padding-bottom: 5px;
}
/* grid-template-columns 속성을 사용하여 그리드 컨테이너의 열 크기를 유연하게 조정할 수 있으며, 
반응형 웹 디자인에서 유용하게 활용된다. 
이렇게 함으로써 웹페이지의 레이아웃을 다양한 화면 크기와 장치에 맞추는데 도움이 된다. */
.day {
	padding: 5px;
}

.calendar-dates {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	grid-gap: 5px;
}

.date {
	cursor: pointer;
	padding: 5px;
}

.date:hover {
	background-color: #f5f5f5;
}
</style>


<!-- 달력 태그 -->
	<div class="calendar-container h-80">
		<div class="calendar-header">
			<button id="prevBtn">이전</button>
			<h2 id="currentMonth"></h2>
			<button id="nextBtn">다음</button>
		</div>
		<div class="calendar-days">
			<div class="day">일</div>
			<div class="day">월</div>
			<div class="day">화</div>
			<div class="day">수</div>
			<div class="day">목</div>
			<div class="day">금</div>
			<div class="day">토</div>
		</div>
		<div class="calendar-dates" id="calendarDates"></div>
		<!-- 	동적으로 달력을 그려준다 -->
	</div>

<!-- 작업일지 목록 -->
<section class="mt-2 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${memoRepairCnt }개</div>
		<table class="table-box-1" border="1">
			<colgroup>
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>건물</th>
					<th>호실</th>
					<th>세입자</th>
					<th>보수 일자</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="memoRepair" items="${memoRepair }">
					<tr class="hover">
						<td>${memoRepair.id }</td>
						<td>${memoRepair.regDate.substring(0,10) }</td>
						<td>
							<a href="repairDetail?id=${memoRepair.id }">${memoRepair.title }</a>
						</td>
						<td>${memoRepair.bldgName }</td>
						<td>${memoRepair.roomNum }</td>
						<td>${memoRepair.tenantName }</td>
						<td>${memoRepair.repairDate }</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="mt-2">
			<a class="btn btn-m btn-outline" href="">추가</a>
		</div>

	</div>

</section>


<!-- 달력 스크립트 -->
<script>
const calendarDates = document.getElementById("calendarDates");
const currentMonthElement = document.getElementById("currentMonth");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

const today = new Date(); // 현재 날짜를 나타내는 Date 객체를 저장한다.
// 현재 월을 나타내는 값을 저장한다. getMonth() 메서드는 0부터 시작하는 월을 반환하므로 1월이면 0, 2월이면 1을 반환한다.
let currentMonth = today.getMonth();
//변수에 현재 연도를 나타내는 값을 저장한다.
let currentYear = today.getFullYear(); 

function renderCalendar() {
  // firstDayOfMonth 변수에 현재 월의 첫 번째 날짜를 나타내는 Date 객체를 저장한다. 해당 월의 첫 번째 날짜에 대한 정보를 얻는다.
  const firstDayOfMonth = new Date(currentYear, currentMonth, 1);
  // daysInMonth 변수에 현재 월의 총 일 수를 나타내는 값을 저장한다. 해당 월이 몇 일까지 있는지 알 수 있다.
  const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
  // 변수에 현재 월의 첫 번째 날짜의 요일을 나타내는 값을 저장한다. 해당 월의 첫 번째 날짜가 무슨 요일인지 알 수 있다.
  const startDayOfWeek = firstDayOfMonth.getDay();
  // 월을 나타내는 요소에 현재 월과 연도를 설정하여 표시한다.
  currentMonthElement.textContent = currentYear + "년 " + (currentMonth + 1) + "월";

  calendarDates.innerHTML = ""; // 월 변경 시 이전 월의 일자를 초기화한다.

  // 빈 날짜(이전 달)
  for (let i = 0; i < startDayOfWeek; i++) {
    //  빈 날짜를 나타내는 div 요소를 생성한다.
    const emptyDate = document.createElement("div");
    // 생성한 div 요소에 "date"와 "empty" 클래스를 추가한다. empty에 속성을 안줘도 기본 공백으로 나온다. 그냥 태그명으로만 사용.
    emptyDate.classList.add("date", "empty");
    // 생성한 빈 날짜 요소를 캘린더 그리드에 추가한다.
    calendarDates.appendChild(emptyDate);
  }

  // 현재 달의 날짜
  for (let i = 1; i <= daysInMonth; i++) {
    const dateElement = document.createElement("div");
    dateElement.classList.add("date");
    dateElement.textContent = i;
    calendarDates.appendChild(dateElement);
  }
  /* 
  1. for 문을 이용하여 현재 월의 총 일 수만큼 반복하여 월의 날짜를 순서대로 표시한다.
  2. const dateElement = document.createElement("div");를 통해 날짜를 나타내는 div 요소를 생성한다.
  3. dateElement.classList.add("date");를 통해 생성한 div 요소에 "date" 클래스를 추가한다.
  4. dateElement.textContent = i;를 통해 해당 날짜 값을 div 요소의 텍스트로 설정한다.
  5. calendarDates.appendChild(dateElement);를 통해 생성한 날짜 요소를 캘린더 그리드에 추가한다.
  */
}

renderCalendar();
// 페이지가 로드되면 renderCalendar 함수를 실행하여 초기 캘린더를 표시한다.

prevBtn.addEventListener("click", () => {
  currentMonth--;
  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  renderCalendar();
});
/* 
1. 이전 버튼(prevBtn)을 클릭하면 현재 월을 이전 월로 변경하고, 연도가 바뀌어야 한다면 연도를 변경한다.
2. 변경된 월과 연도를 바탕으로 renderCalendar 함수를 호출하여 이전 월의 캘린더를 표시한다.
*/

nextBtn.addEventListener("click", () => {
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  renderCalendar();
});
/* 
1. 다음 버튼(nextBtn)을 클릭하면 현재 월을 다음 월로 변경하고, 연도가 바뀌어야 한다면 연도를 변경한다.
2. 변경된 월과 연도를 바탕으로 renderCalendar 함수를 호출하여 다음 월의 캘린더를 표시한다.
*/
</script>




<%@ include file="../../common/foot.jspf"%>