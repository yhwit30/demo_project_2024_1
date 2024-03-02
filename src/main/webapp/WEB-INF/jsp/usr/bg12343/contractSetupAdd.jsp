<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTRACT SETUP ADD"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<!-- 입력값 유효성 검사 아직 : 이게 공실을 해줘야 하는 문제가 있다.-->
<script>

// 	var contractAdd__submitDone = false;

// 	function contractAdd__submit(form) {
// 		if (contractAdd__submitDone) {
// 			alert('이미 처리중입니다');
// 			return;
// 		}

// 		for (var i = 0; i < form.roomNum.length; i++) {
// 			var roomNumField = form.roomNum[i];
// 			var roomTypeField = form.roomType[i];
// 			var roomAreaField = form.roomArea[i];
// 			var standardDepositField = form.standardDeposit[i];
// 			var standardRentField = form.standardRent[i];
// 			var standardJeonseField = form.standardJeonse[i];

// 			 // 숫자가 아닌 데이터 체크
//             if (isNaN(roomNumField.value)) {
//                 alert('호실에는 숫자만 입력 가능합니다');
//                 roomAreaField.focus();
//                 return;
//             }

// 			 if (isNaN(roomAreaField.value)) {
//                 alert('방 면적에는 숫자(소수점가능)만 입력 가능합니다');
//                 roomAreaField.focus();
//                 return;
//             }

//             if (isNaN(standardDepositField.value)) {
//                 alert('기준 보증금에는 숫자만 입력 가능합니다');
//                 standardDepositField.focus();
//                 return;
//             }

//             if (isNaN(standardRentField.value)) {
//                 alert('기준 월세에는 숫자만 입력 가능합니다');
//                 standardRentField.focus();
//                 return;
//             }

//             if (isNaN(standardJeonseField.value)) {
//                 alert('기준 전세에는 숫자만 입력 가능합니다');
//                 standardJeonseField.focus();
//                 return;
//             }
			
// 			// 빈칸에 대한 유효성 검사 추가
// 			if (roomNumField.value.length < 1) {
// 				alert('호실을 입력해주세요');
// 				roomNumField.focus();
// 				return;
// 			}

// 			if (roomTypeField.value === "") {
// 				alert('방 형태를 선택해주세요');
// 				roomTypeField.focus();
// 				return;
// 			}

// 			if (roomAreaField.value.length < 1) {
// 				alert('면적을 입력해주세요');
// 				roomAreaField.focus();
// 				return;
// 			}

// 			if (standardDepositField.value.length < 1) {
// 				alert('기준 보증금을 입력해주세요');
// 				standardDepositField.focus();
// 				return;
// 			}

// 			if (standardRentField.value.length < 1) {
// 				alert('기준 월세를 입력해주세요');
// 				standardRentField.focus();
// 				return;
// 			}

// 			if (standardJeonseField.value.length < 1) {
// 				alert('기준 전세를 입력해주세요');
// 				standardJeonseField.focus();
// 				return;
// 			}
// 		}

// 		contractAdd__submitDone = true;
// 		form.submit();

// 	}

</script>

<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
		<table class="table-box-1 table" border="1">
			<thead>
				<tr>
					<th>건물명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${addedBuilding.bldgName }</td>

					</td>
				</tr>
			</tbody>
		</table>


		<br />

		<div class="badge badge-outline">${addedBuilding.roomTotal }개</div>
		<form action="../bg12343/doContractAdd" method="POST" onsubmit="contractAdd__submit(this); return false;">
			<table class="table-box-1 table" border="1">
				<thead>
					<tr>
						<th>호실</th>
						<th>세입자명</th>
						<th>세입자휴대폰</th>
						<th>세입자차량번호</th>
						<th>임대형태</th>
						<th>보증금</th>
						<th>월세</th>
						<th>관리비</th>
						<th>계약시작일</th>
						<th>계약만료일</th>
						<th>보증금납부일</th>
						<th>월세 납부일</th>
					</tr>
				</thead>


				<tbody>
					<c:forEach var="room" items="${rooms }">
						<input type="hidden" name="roomId" value="${room.id }" />
						<tr>
							<td>${room.roomNum }</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="세입자명을 입력해주세요" name="tenantName" />
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="세입자번호를 입력해주세요" name="tenantPhone" />
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="세입자번호를 입력해주세요" name="tenantCarNum" />
							</td>
							<td>
								<select class="select select-bordered select-sm w-20 max-w-xs" name="leaseType">
									<option value="월세">월세</option>
									<option value="전세">전세</option>
									<option value="반전세">반전세</option>
								</select>
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="보증금을 입력해주세요" name="deposit" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="월세를 입력해주세요" name="rent" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="관리비를 입력해주세요" name="maintenanceFee" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="계약시작일을 입력해주세요" name="contractStartDate" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="계약만료일을 입력해주세요" name="contractEndDate" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="보증금납부일을 입력해주세요" name="depositDate" />
							</td>
							<td>
								<input size="3" autocomplete="off" type="text" placeholder="월세 납부일을 입력해주세요" name="rentDate" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input class="btn btn-outline btn-info" type="submit" value="완료" />
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>