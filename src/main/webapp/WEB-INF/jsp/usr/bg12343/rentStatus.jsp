<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

스크립트 개행오류 있음 nowYear 데이터에. 나중에 납부현황 hover로수정삭제 넣기



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
		var year = 2024;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('text:' + text);
		console.log('month:' + month);
		console.log('methodNum:' + methodNum);

		$
				.post({
					url : '/usr/bg12343/doRentStatusModify',
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
		var year = 2024;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('form:' + form);
		console.log('text:' + text);
		console.log('month:' + month);
		console.log('methodNum:' + methodNum);

		// 세입자 없는 칸에 시험으로 alert했지만 마음에 안듦
		if (rentStatusTenantId == 0) {
			alert('세입자가 없습니다')
		}

		$.post({
			url : '/usr/bg12343/doRentStatusAdd',
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



<section class="mt-2 text-xl px-4">
	<!-- 건물 카테고리 버튼 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="../bg12343/rentStatus?bldgId=${building.id }">${building.bldgName }</a>
		</c:forEach>
	</div>

	<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
		href="rentStatus?bldgId=${param.bldgId }&year=${nowYear -1}">전년도 보기</a>
	<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
		href="rentStatus?bldgId=${param.bldgId }&year=${nowYear}">올해(${nowYear}) 보기</a>

	<!--수납현황표 -->
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>호실</th>
					<th>세입자명</th>
					<th>세입자휴대폰</th>
					<th>임대형태</th>
					<th>면적(m2)</th>
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
					<tr class="hover">
						<td>${rentStatus.roomNum }</td>
						<td>${rentStatus.tenantName }</td>
						<td>${rentStatus.tenantPhone }</td>
						<td>${rentStatus.leaseType }</td>
						<td>${rentStatus.roomArea }</td>
						<td>${rentStatus.deposit }</td>
						<td>${rentStatus.rent }</td>
						<td>${rentStatus.maintenanceFee }</td>
						<td>${rentStatus.contractStartDate }</td>
						<td>${rentStatus.contractEndDate }</td>
						<td>${rentStatus.rentDate }</td>



						<!-- January -->
						<td>
							<c:if test="${rentStatus.tenantId != 0}">
								<!-- 납부일자 그려주는 태그 -->
								<span id="1rent-${rentStatus.tenantId}">${rentStatus.paymentStatus1}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus1}">
									<form onsubmit="return false;" method="POST" id="1modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus1}" name="1rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '1');" id="1modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01', '1');"
										style="white-space: nowrap; display: none" id="1save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus1}">
									<form onsubmit="return false;" method="POST" id="1add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="1add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '1');" id="1add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '01', '1');"
										style="white-space: nowrap; display: none" id="1add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="1modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="1rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '1');" id="1modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01', '1');"
										style="white-space: nowrap; display: none" id="1save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- February -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="2rent-${rentStatus.tenantId}">${rentStatus.paymentStatus2}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus2}">
									<form onsubmit="return false;" method="POST" id="2modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus2}" name="2rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '2');" id="2modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '02', '2');"
										style="white-space: nowrap; display: none" id="2save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus2}">
									<form onsubmit="return false;" method="POST" id="2add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="2add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '2');" id="2add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '02', '2');"
										style="white-space: nowrap; display: none" id="2add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="2modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="2rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '2');" id="2modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '02', '2');"
										style="white-space: nowrap; display: none" id="2save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- March -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="3rent-${rentStatus.tenantId}">${rentStatus.paymentStatus3}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus3}">
									<form onsubmit="return false;" method="POST" id="3modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus3}" name="3rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '3');" id="3modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '03', '3');"
										style="white-space: nowrap; display: none" id="3save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus3}">
									<form onsubmit="return false;" method="POST" id="3add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="3add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '3');" id="3add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '03', '3');"
										style="white-space: nowrap; display: none" id="3add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="3modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="3rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '3');" id="3modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '03', '3');"
										style="white-space: nowrap; display: none" id="3save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- April -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="4rent-${rentStatus.tenantId}">${rentStatus.paymentStatus4}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus4}">
									<form onsubmit="return false;" method="POST" id="4modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus4}" name="4rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '4');" id="4modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '04', '4');"
										style="white-space: nowrap; display: none" id="4save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus4}">
									<form onsubmit="return false;" method="POST" id="4add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="4add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '4');" id="4add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '04', '4');"
										style="white-space: nowrap; display: none" id="4add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="4modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="4rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '4');" id="4modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '04', '4');"
										style="white-space: nowrap; display: none" id="4save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- May -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="5rent-${rentStatus.tenantId}">${rentStatus.paymentStatus5}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus5}">
									<form onsubmit="return false;" method="POST" id="5modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus5}" name="5rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '5');" id="5modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '05', '5');"
										style="white-space: nowrap; display: none" id="5save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus5}">
									<form onsubmit="return false;" method="POST" id="5add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="5add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '5');" id="5add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '05', '5');"
										style="white-space: nowrap; display: none" id="5add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="5modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="5rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '5');" id="5modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '05', '5');"
										style="white-space: nowrap; display: none" id="5save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>
						<!-- June -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="6rent-${rentStatus.tenantId}">${rentStatus.paymentStatus6}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus6}">
									<form onsubmit="return false;" method="POST" id="6modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus6}" name="6rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '6');" id="6modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '06', '6');"
										style="white-space: nowrap; display: none" id="6save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus6}">
									<form onsubmit="return false;" method="POST" id="6add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="6add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '6');" id="6add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '06', '6');"
										style="white-space: nowrap; display: none" id="6add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="6modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="6rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '6');" id="6modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '06', '6');"
										style="white-space: nowrap; display: none" id="6save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>


						<!-- July -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="7rent-${rentStatus.tenantId}">${rentStatus.paymentStatus7}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus7}">
									<form onsubmit="return false;" method="POST" id="7modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus7}" name="7rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '7');" id="7modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '07', '7');"
										style="white-space: nowrap; display: none" id="7save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus7}">
									<form onsubmit="return false;" method="POST" id="7add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="7add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '7');" id="7add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '07', '7');"
										style="white-space: nowrap; display: none" id="7add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="7modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="7rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '7');" id="7modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '07', '7');"
										style="white-space: nowrap; display: none" id="7save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- August -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="8rent-${rentStatus.tenantId}">${rentStatus.paymentStatus8}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus8}">
									<form onsubmit="return false;" method="POST" id="8modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus8}" name="8rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '8');" id="8modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '08', '8');"
										style="white-space: nowrap; display: none" id="8save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus8}">
									<form onsubmit="return false;" method="POST" id="8add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="8add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '8');" id="8add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '08', '8');"
										style="white-space: nowrap; display: none" id="8add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="8modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="8rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '8');" id="8modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '08', '8');"
										style="white-space: nowrap; display: none" id="8save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>


						<!-- September -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="9rent-${rentStatus.tenantId}">${rentStatus.paymentStatus9}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus9}">
									<form onsubmit="return false;" method="POST" id="9modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus9}" name="9rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '9');" id="9modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '09', '9');"
										style="white-space: nowrap; display: none" id="9save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus9}">
									<form onsubmit="return false;" method="POST" id="9add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="9add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '9');" id="9add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '09', '9');"
										style="white-space: nowrap; display: none" id="9add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="9modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="9rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '9');" id="9modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '09', '9');"
										style="white-space: nowrap; display: none" id="9save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- October -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="10rent-${rentStatus.tenantId}">${rentStatus.paymentStatus10}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus10}">
									<form onsubmit="return false;" method="POST" id="10modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus10}" name="10rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '10');" id="10modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '10', '10');"
										style="white-space: nowrap; display: none" id="10save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus10}">
									<form onsubmit="return false;" method="POST" id="10add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="10add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '10');" id="10add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '10', '10');"
										style="white-space: nowrap; display: none" id="10add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="10modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="10rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '10');" id="10modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '10', '10');"
										style="white-space: nowrap; display: none" id="10save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- November -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="11rent-${rentStatus.tenantId}">${rentStatus.paymentStatus11}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus11}">
									<form onsubmit="return false;" method="POST" id="11modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus11}" name="11rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '11');" id="11modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '11', '11');"
										style="white-space: nowrap; display: none" id="11save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus11}">
									<form onsubmit="return false;" method="POST" id="11add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="11add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '11');" id="11add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '11', '11');"
										style="white-space: nowrap; display: none" id="11add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="11modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="11rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '11');" id="11modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '11', '11');"
										style="white-space: nowrap; display: none" id="11save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- December -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
								<!-- 납부일자 그려주는 태그 -->
								<span id="12rent-${rentStatus.tenantId}">${rentStatus.paymentStatus12}</span>

								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.paymentStatus12}">
									<form onsubmit="return false;" method="POST" id="12modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.paymentStatus12}" name="12rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '12');" id="12modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '12', '12');"
										style="white-space: nowrap; display: none" id="12save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 추가기능 -->
								<c:if test="${empty rentStatus.paymentStatus12}">
									<form onsubmit="return false;" method="POST" id="12add-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="12add-rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleAddbtn('${rentStatus.tenantId}', '12');" id="12add-btn-${rentStatus.tenantId}"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '12', '12');"
										style="white-space: nowrap; display: none" id="12add-save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>

									<!-- 추가 후 즉각 수정기능 -->
									<form onsubmit="return false;" method="POST" id="12modify-form-${rentStatus.tenantId}" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" name="12rent-text-${rentStatus.tenantId}" />
									</form>
									<button onclick="toggleModifybtn('${rentStatus.tenantId}', '12');" id="12modify-btn-${rentStatus.tenantId}"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '12', '12');"
										style="white-space: nowrap; display: none" id="12save-btn-${rentStatus.tenantId}"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>



						<td>#</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</section>





<%@ include file="../common/foot.jspf"%>