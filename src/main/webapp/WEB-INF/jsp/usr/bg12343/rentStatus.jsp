<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../bg12343/rentStatus?bldgId=${building.id }"
		>${building.bldgName }</a>
	</c:forEach>
</div>

<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="rentStatus?bldgId=${param.bldgId }&year=${nowYear -1}"
>전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="rentStatus?bldgId=${param.bldgId }&year=${nowYear}"
>올해(${nowYear}) 보기</a>


<section class="mt-2 text-xl px-4">
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
						<td>
							<span id="reply-${rentStatus.tenantId }">${rentStatus.januaryPaymentStatus }</span>
							<form method="POST" id="modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input type="text" value="${rentStatus.januaryPaymentStatus }" name="reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn('${rentStatus.tenantId}');" id="modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01');" style="white-space: nowrap; display: none"
								id="save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<td>
							<span id="reply-${rentStatus.tenantId }">${rentStatus.februaryPaymentStatus }</span>
							<form method="POST" id="modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input type="text" value="${rentStatus.februaryPaymentStatus }" name="reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn('${rentStatus.tenantId}');" id="modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01');" style="white-space: nowrap; display: none"
								id="save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>
						<td>${rentStatus.marchPaymentStatus }</td>
						<td>${rentStatus.aprilPaymentStatus }</td>
						<td>${rentStatus.mayPaymentStatus }</td>
						<td>${rentStatus.junePaymentStatus }</td>
						<td>${rentStatus.julyPaymentStatus }</td>
						<td>${rentStatus.augustPaymentStatus }</td>
						<td>${rentStatus.septemberPaymentStatus }</td>
						<td>${rentStatus.octoberPaymentStatus }</td>
						<td>${rentStatus.novemberPaymentStatus }</td>
						<td>${rentStatus.decemberPaymentStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</section>

<script>
	function toggleModifybtn(rentStatusId) {

		console.log(rentStatusId);

		$('#modify-btn-' + rentStatusId).hide();
		$('#save-btn-' + rentStatusId).show();
		$('#reply-' + rentStatusId).hide();
		$('#modify-form-' + rentStatusId).show();
	}

	function doModifyRentStatus(rentStatusId, month) {
		console.log(rentStatusId); // 디버깅을 위해 replyId를 콘솔에 출력

		// form 요소를 정확하게 선택
		var form = $('#modify-form-' + rentStatusId);
		console.log(form); // 디버깅을 위해 form을 콘솔에 출력

		// form 내의 input 요소의 값을 가져옵니다
		var text = form.find('input[name="reply-text-' + rentStatusId + '"]')
				.val();
		console.log(text); // 디버깅을 위해 text를 콘솔에 출력

		// form의 action 속성 값을 가져옵니다
		var action = form.attr('action');
		console.log(action); // 디버깅을 위해 action을 콘솔에 출력

		var year = $
		{
			nowYear
		}
		;
		console.log(year);

		$.post({
			url : '/usr/bg12343/doRentStatusModify', // 수정된 URL
			type : 'POST', // GET에서 POST로 변경
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			}, // 서버에 전송할 데이터
			success : function(data) {
				$('#modify-form-' + rentStatusId).hide();
				$('#reply-' + rentStatusId).text(data);
				$('#reply-' + rentStatusId).show();
				$('#save-btn-' + rentStatusId).hide();
				$('#modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}
</script>




<%@ include file="../common/foot.jspf"%>