<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>


<!-- 현재 연도 선언 -->
<script>
	var currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var setYear = ${param.year};

	if (setYear == null || setYear === "") {
		setYear = currentYear;
	}
</script>


<!-- 수납현황 수정 ajax -->
<script>
	//버튼 토글 함수
	function toggleModifybtn(rentStatusTenantId, methodNum) {
		console.log('TogglerentStatusTenantId:' + rentStatusTenantId);
		console.log('TogglemethodNum:' + methodNum);

		$('#' + methodNum + 'modify-btn-' + rentStatusTenantId).hide();
		$('#' + methodNum + 'save-btn-' + rentStatusTenantId).show();
		$('#' + methodNum + 'rent-' + rentStatusTenantId).hide();
		$('#' + methodNum + 'modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정
		var value = $('#' + methodNum + 'rent-' + rentStatusTenantId).text();
		$(
				'#' + methodNum + 'modify-form-' + rentStatusTenantId
						+ ' input[name="' + methodNum + 'rent-text-'
						+ rentStatusTenantId + '"]').val(value);
	}

	// 수정 함수
	function doModifyRentStatus(rentStatusTenantId, month, methodNum) {
		var form = $('#' + methodNum + 'modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="' + methodNum + 'rent-text-' + rentStatusTenantId
						+ '"]').val();
		var year = setYear;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('text:' + text);
		console.log('month:' + month);
		console.log('methodNum:' + methodNum);
		console.log('year:' + year);

		// 추가에 빈칸으로 넘어왔을 때 삭제쿼리 날림
		if (text === null || text.trim() === '') {
			$.post({
				url : '/usr/bg12343/dashboard/doRentStatusDelete',
				type : 'POST',
				data : {
					tenantId : rentStatusTenantId,
					body : text,
					year : year,
					month : month
				},
				success : function(data) {
					console.log('수납현황 삭제되었습니다');
				},
				error : function(xhr, status, error) {
					alert('수정에 실패했습니다: ' + error);
				}
			});

			$('#' + methodNum + 'modify-form-' + rentStatusTenantId).hide();
			$('#' + methodNum + 'modify-btn-' + rentStatusTenantId).hide();
			$('#' + methodNum + 'save-btn-' + rentStatusTenantId).hide();
			$('#' + methodNum + 'add-form-' + rentStatusTenantId).hide();
			$('#' + methodNum + 'add-btn-' + rentStatusTenantId).show();
			$('#' + methodNum + 'add-save-btn-' + rentStatusTenantId).hide();
			return;
		}

		$
				.post({
					url : '/usr/bg12343/dashboard/doRentStatusModify',
					type : 'POST',
					data : {
						tenantId : rentStatusTenantId,
						body : text,
						year : year,
						month : month
					},
					success : function(data) {
						$('#' + methodNum + 'modify-form-' + rentStatusTenantId)
								.hide();
						$('#' + methodNum + 'rent-' + rentStatusTenantId).text(
								data);
						$('#' + methodNum + 'rent-' + rentStatusTenantId)
								.show();
						$('#' + methodNum + 'save-btn-' + rentStatusTenantId)
								.hide();
						$('#' + methodNum + 'modify-btn-' + rentStatusTenantId)
								.show();
					},
					error : function(xhr, status, error) {
						alert('수정에 실패했습니다: ' + error);
					}
				});
	}
</script>


<!-- 수납현황 추가 ajax -->
<script>
	//add 토글 함수
	function toggleAddbtn(rentStatusTenantId, methodNum) {

		$('#' + methodNum + 'add-btn-' + rentStatusTenantId).hide();
		$('#' + methodNum + 'add-save-btn-' + rentStatusTenantId).show();
		$('#' + methodNum + 'add-form-' + rentStatusTenantId).show();
	}

	// add 함수
	function doAddRentStatus(rentStatusTenantId, month, methodNum) {
		var form = $('#' + methodNum + 'add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="' + methodNum + 'add-rent-text-'
						+ rentStatusTenantId + '"]').val();
		var year = setYear;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('form:' + form);
		console.log('text:' + text);
		console.log('month:' + month);
		console.log('methodNum:' + methodNum);

		// 세입자 없는 칸에 시험으로 alert했지만 마음에 안듦
		if (rentStatusTenantId == 0) {
			alert('세입자가 없습니다')
		}

		// 추가에 빈칸으로 넘어왔을 때 체크
		if (text === null || text.trim() === '') {
			$('#' + methodNum + 'add-form-' + rentStatusTenantId).hide();
			$('#' + methodNum + 'add-btn-' + rentStatusTenantId).show();
			$('#' + methodNum + 'add-save-btn-' + rentStatusTenantId).hide();
			return;
		}

		$.post({
			url : '/usr/bg12343/dashboard/doRentStatusAdd',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#' + methodNum + 'add-form-' + rentStatusTenantId).hide();
				$('#' + methodNum + 'add-btn-' + rentStatusTenantId).hide();
				$('#' + methodNum + 'add-save-btn-' + rentStatusTenantId)
						.hide();
				$('#' + methodNum + 'rent-' + rentStatusTenantId).text(data);
				$('#' + methodNum + 'modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		});
	}
</script>


<!-- 연도 선택할 때 해당하는 데이터 불러오기 -->
<script>
	$(document).ready(function() {
		$('#year').change(function() {
			var bldgId = "${param.bldgId}"; // bldgId를 해당 파라미터 값으로 설정
			var selectedYear = $(this).val(); // 선택된 연도 값 가져오기
			yearSelect(bldgId, selectedYear); // yearSelect 함수 호출
		});
	});

	function yearSelect(bldgId, year) {
		var url = "rentStatus?bldgId=" + bldgId + "&year=" + year; // 연도를 포함한 URL 생성
		window.location.href = url; // URL로 이동
	}
</script>






<!-- 수정버튼 hover -->
<style type="text/css">
.ctrlBtn {
	display: none;
	position: absolute;
	background-color: white;
	z-index: 1;
}

.ctrlBtnHover:hover .ctrlBtn {
	display: block;
}
</style>


<section class="mt-2 text-xl px-4">
	<!-- 건물 선택 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="rentStatus?bldgId=${building.id }&year=${param.year}"
			>${building.bldgName }</a>
		</c:forEach>
	</div>

	<div>현재 설정 연도 : ${param.year}</div>

	<!-- 건물에 해당하는 데이터 있는 연도만큼 그리기 <script>에 함수-->
	<c:choose>
		<c:when test="${not empty rentYears}">
			<select data-value="${param.year }" class=" select select-bordered select-sm w-20 max-w-xs" name="year" id="year">
				<c:forEach var="rentYear" items="${rentYears }">
					<option value="${rentYear }">${rentYear }</option>
				</c:forEach>
			</select>
			<p>* 수납현황을 수정하려면 해당 월에 마우스를 올리세요</p>
		</c:when>
		<c:otherwise>
			<p>계약 및 수납현황을 추가하십시오.</p>
		</c:otherwise>
	</c:choose>




	<!--수납현황표 -->
	<table class="table-box-1">
		<thead>
			<tr>
				<th>호실</th>
				<th>세입자명</th>
				<th>세입자휴대폰</th>
				<th>임대형태</th>
				<!-- 					<th>면적(m2)</th> -->
				<th>현 보증금</th>
				<th>현 월세</th>
				<th>관리비</th>
				<th>계약시작일</th>
				<th>계약만료일</th>
				<th>납부일</th>
				<th>1월</th>
				<th>2월</th>
				<th>3월</th>
				<th>4월</th>
				<th>5월</th>
				<th>6월</th>
				<th>7월</th>
				<th>8월</th>
				<th>9월</th>
				<th>10월</th>
				<th>11월</th>
				<th>12월</th>
				<th>메모</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="rentStatus" items="${rentStatus }">
				<!-- rentStartDate를 이용하여 연도와 월 추출 -->
				<c:set var="rentStartDate" value="${rentStatus.contractStartDate}" />
				<!-- rentEndDate를 이용하여 연도와 월 추출 -->
				<c:set var="rentEndDate" value="${rentStatus.contractEndDate}" />

				<!-- 표 그리기 -->
				<tr class="hover">
					<td>${rentStatus.roomNum }</td>
					<td>${rentStatus.tenantName }</td>
					<td>${rentStatus.tenantPhone }</td>
					<td>${rentStatus.leaseType }</td>
					<%-- 						<td>${rentStatus.roomArea }</td> --%>
					<td>${rentStatus.deposit }</td>
					<td>${rentStatus.rent }</td>
					<td>${rentStatus.maintenanceFee }</td>
					<td>${rentStatus.contractStartDate }</td>
					<td>${rentStatus.contractEndDate }</td>
					<td>${rentStatus.rentDay }</td>

					<c:forEach var="month" begin="1" end="12">
						<c:set var="paymentStatusVar" value="paymentStatus${month}" />
						<td
							class="ctrlBtnHover highlightContract contractStart-${rentStartDate } contractEnd-${rentEndDate } tagYear-${param.year } tagMonth-${month}"
						>
							<c:if test="${rentStatus.tenantId != 0}">
								<!-- 납부일자 그려주는 태그 -->
								<span id="${month}rent-${rentStatus.tenantId}">${rentStatus[paymentStatusVar]}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus[paymentStatusVar]}">
									<form onsubmit="return false;" method="POST" id="${month}modify-form-${rentStatus.tenantId}"
										style="display: none" action="/usr/bg12343/dashboard/doRentStatusModify"
									>
										<input size="1" type="text" value="${rentStatus[paymentStatusVar]}"
											name="${month}rent-text-${rentStatus.tenantId}" autocomplete="off"
										/>
									</form>
									<div class="ctrlBtn">
										<button onclick="toggleModifybtn('${rentStatus.tenantId}', '${month}');"
											id="${month}modify-btn-${rentStatus.tenantId}" style="white-space: nowrap" class="btn btn-xs btn-outline"
										>수정</button>
									</div>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '0${month}', '${month}');"
										style="white-space: nowrap; display: none" id="${month}save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline"
									>저장</button>

									<!--수정 공백 저장 후 즉각 추가기능 -->
									<form onsubmit="return false;" method="POST" id="${month}add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/dashboard/doRentStatusAdd"
									>
										<input size="1" type="text" name="${month}add-rent-text-${rentStatus.tenantId}" autocomplete="off" />
									</form>
									<div class="ctrlBtn">
										<button onclick="toggleAddbtn('${rentStatus.tenantId}', '${month}');"
											id="${month}add-btn-${rentStatus.tenantId}" style="white-space: nowrap; display: none"
											class="btn btn-xs btn-outline"
										>추가</button>
									</div>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '0${month}', '${month}');"
										style="white-space: nowrap; display: none" id="${month}add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline"
									>저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus[paymentStatusVar]}">
									<form onsubmit="return false;" method="POST" id="${month}add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/dashboard/doRentStatusAdd"
									>
										<input size="1" type="text" name="${month}add-rent-text-${rentStatus.tenantId}" autocomplete="off" />
									</form>
									<div class="ctrlBtn">
										<button onclick="toggleAddbtn('${rentStatus.tenantId}', '${month}');"
											id="${month}add-btn-${rentStatus.tenantId}" style="white-space: nowrap" class="btn btn-xs btn-outline"
										>추가</button>
									</div>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '0${month}', '${month}');"
										style="white-space: nowrap; display: none" id="${month}add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline"
									>저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="${month}modify-form-${rentStatus.tenantId}"
										style="display: none" action="/usr/bg12343/dashboard/doRentStatusModify"
									>
										<input size="1" type="text" name="${month}rent-text-${rentStatus.tenantId}" autocomplete="off" />
									</form>
									<div class="ctrlBtn">
										<button onclick="toggleModifybtn('${rentStatus.tenantId}', '${month}');"
											id="${month}modify-btn-${rentStatus.tenantId}" style="white-space: nowrap; display: none"
											class="btn btn-xs btn-outline"
										>수정</button>
									</div>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '0${month}', '${month}');"
										style="white-space: nowrap; display: none" id="${month}save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline"
									>저장</button>
								</c:if>
							</c:if>
						</td>
					</c:forEach>

					<td>#</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>


</section>



<!-- 계약시작일과 계약만료일 기준 하이라이트 -->
<script>
	//각 td 태그에 대해 반복문 수행
	$(".highlightContract").each(
			function() {
				// td 태그의 클래스에서 연도와 월 추출
				var classes = $(this).attr("class").split(" ");
				var tagContractStart = null;
				var tagContractEnd = null;
				var tagYear = null;
				var tagMonth = null;
				for (var i = 0; i < classes.length; i++) {
					if (classes[i].indexOf("tagYear-") === 0) {
						tagYear = parseInt(classes[i].substring(8));
					} else if (classes[i].indexOf("tagMonth-") === 0) {
						tagMonth = parseInt(classes[i].substring(9));
					} else if (classes[i].indexOf("contractStart-") === 0) {
						tagContractStart = classes[i].substring(14);
					} else if (classes[i].indexOf("contractEnd-") === 0) {
						tagContractEnd = classes[i].substring(12);
					}
				}

				// tagContractStart와 tagContractEnd를 사용하여 Date 객체 생성
				var startDateParts = tagContractStart.split("-"); // '-'를 기준으로 문자열을 분리하여 배열로 저장
				var endDateParts = tagContractEnd.split("-");

				// 년, 월, 일을 가지고 Date 객체 생성
				var thisDate = new Date(tagYear, tagMonth - 1, 15); // 월은 0부터 시작하므로 tagMonth에서 1을 빼줍니다.
				var contractStartDate = new Date(parseInt(startDateParts[0]),
						parseInt(startDateParts[1]) - 1, 1);
				var contractEndDate = new Date(parseInt(endDateParts[0]),
						parseInt(endDateParts[1]) - 1, 20);

				// 만료일로부터 3개월 전 날짜 계산
				var endDateMinus3 = new Date(contractEndDate);
				endDateMinus3.setMonth(endDateMinus3.getMonth() - 3);

				// 	    console.log('endDateMinus3: '+endDateMinus3);

				// 하이라이트할 td태그 조건
				if (thisDate == contractStartDate) {
					$(this).css("background-color", "gold");
				}
				if (thisDate > contractStartDate && thisDate < endDateMinus3) {
					$(this).css("background-color", "skyblue");
				}
				if (thisDate >= endDateMinus3 && thisDate <= contractEndDate) {
					$(this).css("background-color", "pink");
				}
			});
</script>





<%@ include file="../../common/foot.jspf"%>