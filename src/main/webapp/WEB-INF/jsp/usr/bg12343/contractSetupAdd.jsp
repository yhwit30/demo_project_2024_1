<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTRACT SETUP ADD"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<style>
.hidden-placeholder {
	color: transparent;
}
</style>


<!-- 입력값 유효성 검사 아직 : 이게 공실을 해줘야 하는 문제가 있다.-->
<script>
	function contractAdd__submit(form) {
		// 각 필드에 대한 값을 가져옵니다.
		var fields = [ 'tenantName', 'tenantPhone', 'tenantCarNum', 'deposit',
				'rent', 'maintenanceFee', 'contractStartDate',
				'contractEndDate', 'depositDate', 'rentDate' ];

		// 빈 값인 경우 0으로 설정합니다.
		for (var i = 0; i < fields.length; i++) {
			var fieldName = fields[i];
			var fieldValue = form[fieldName].value.trim();

			if (fieldValue === '') {
				form[fieldName].value = '0';
			}
		}

		// 폼을 서버로 제출합니다.
		form.submit();

		// 폼 제출 후에 브라우저가 다른 동작을 수행하지 못하도록 기본 이벤트를 중지합니다.
		return false;
	}

	// 사용자가 입력한 값이 존재하는 경우에만 값을 유지합니다.
	window.onload = function() {
		var inputs = document.querySelectorAll('input[type="text"]');
		inputs.forEach(function(input) {
			if (input.value.trim() === '') {
				input.value = '0';
				input.classList.add('hidden-placeholder');
			}
			input.addEventListener('focus', function() {
				if (input.value === '0') {
					input.value = '';
					input.classList.remove('hidden-placeholder');
				}
			});
			input.addEventListener('blur', function() {
				if (input.value.trim() === '') {
					input.value = '0';
					input.classList.add('hidden-placeholder');
				}
			});
		});
	}
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

				</tr>
			</tbody>
		</table>


		<br />

		<div class="badge badge-outline">${addedBuilding.roomTotal }개</div>
		<form action="../bg12343/doContractSetupAdd" method="POST" onsubmit="contractAdd__submit(this); return false;">
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