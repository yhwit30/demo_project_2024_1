<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

스크립트 개행오류 있음 nowYear 데이터에.
나중에 납부현황 hover로 수정삭제 넣기

<!-- 월별 수납 수정기능 및 버튼토글 -->
<script>
	// 1월 버튼 토글 함수
	function toggleModifybtn(rentStatusId, month) {
		console.log(rentStatusId);
		$('#modify-btn-' + rentStatusId).hide();
		$('#save-btn-' + rentStatusId).show();
		$('#reply-' + rentStatusId).hide();
		$('#modify-form-' + rentStatusId).show();
	}

	// 1월 수정 함수
	function doModifyRentStatus(rentStatusId, month) {
		var form = $('#modify-form-' + rentStatusId);
		var text = form.find('input[name="reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
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

	// 2월 버튼 토글 함수
	function toggleModifybtn2(rentStatusId, month) {
		console.log(rentStatusId);
		$('#2modify-btn-' + rentStatusId).hide();
		$('#2save-btn-' + rentStatusId).show();
		$('#2reply-' + rentStatusId).hide();
		$('#2modify-form-' + rentStatusId).show();
	}

	// 2월 수정 함수
	function doModifyRentStatus2(rentStatusId, month) {
		var form = $('#2modify-form-' + rentStatusId);
		var text = form.find('input[name="2reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#2modify-form-' + rentStatusId).hide();
				$('#2reply-' + rentStatusId).text(data);
				$('#2reply-' + rentStatusId).show();
				$('#2save-btn-' + rentStatusId).hide();
				$('#2modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 3월 버튼 토글 함수
	function toggleModifybtn3(rentStatusId, month) {
		console.log(rentStatusId);
		$('#3modify-btn-' + rentStatusId).hide();
		$('#3save-btn-' + rentStatusId).show();
		$('#3reply-' + rentStatusId).hide();
		$('#3modify-form-' + rentStatusId).show();
	}

	// 3월 수정 함수
	function doModifyRentStatus3(rentStatusId, month) {
		var form = $('#3modify-form-' + rentStatusId);
		var text = form.find('input[name="3reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#3modify-form-' + rentStatusId).hide();
				$('#3reply-' + rentStatusId).text(data);
				$('#3reply-' + rentStatusId).show();
				$('#3save-btn-' + rentStatusId).hide();
				$('#3modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 4월 버튼 토글 함수
	function toggleModifybtn4(rentStatusId, month) {
		console.log(rentStatusId);
		$('#4modify-btn-' + rentStatusId).hide();
		$('#4save-btn-' + rentStatusId).show();
		$('#4reply-' + rentStatusId).hide();
		$('#4modify-form-' + rentStatusId).show();
	}

	// 4월 수정 함수
	function doModifyRentStatus4(rentStatusId, month) {
		var form = $('#4modify-form-' + rentStatusId);
		var text = form.find('input[name="4reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#4modify-form-' + rentStatusId).hide();
				$('#4reply-' + rentStatusId).text(data);
				$('#4reply-' + rentStatusId).show();
				$('#4save-btn-' + rentStatusId).hide();
				$('#4modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 5월 버튼 토글 함수
	function toggleModifybtn5(rentStatusId, month) {
		console.log(rentStatusId);
		$('#5modify-btn-' + rentStatusId).hide();
		$('#5save-btn-' + rentStatusId).show();
		$('#5reply-' + rentStatusId).hide();
		$('#5modify-form-' + rentStatusId).show();
	}

	// 5월 수정 함수
	function doModifyRentStatus5(rentStatusId, month) {
		var form = $('#5modify-form-' + rentStatusId);
		var text = form.find('input[name="5reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#5modify-form-' + rentStatusId).hide();
				$('#5reply-' + rentStatusId).text(data);
				$('#5reply-' + rentStatusId).show();
				$('#5save-btn-' + rentStatusId).hide();
				$('#5modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 6월
	function toggleModifybtn6(rentStatusId, month) {
		console.log(rentStatusId);
		$('#6modify-btn-' + rentStatusId).hide();
		$('#6save-btn-' + rentStatusId).show();
		$('#6reply-' + rentStatusId).hide();
		$('#6modify-form-' + rentStatusId).show();
	}

	function doModifyRentStatus6(rentStatusId, month) {
		var form = $('#6modify-form-' + rentStatusId);
		var text = form.find('input[name="6reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#6modify-form-' + rentStatusId).hide();
				$('#6reply-' + rentStatusId).text(data);
				$('#6reply-' + rentStatusId).show();
				$('#6save-btn-' + rentStatusId).hide();
				$('#6modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 7월 버튼 토글 함수
	function toggleModifybtn7(rentStatusId, month) {
		console.log(rentStatusId);
		$('#7modify-btn-' + rentStatusId).hide();
		$('#7save-btn-' + rentStatusId).show();
		$('#7reply-' + rentStatusId).hide();
		$('#7modify-form-' + rentStatusId).show();
	}

	// 7월 수정 함수
	function doModifyRentStatus7(rentStatusId, month) {
		var form = $('#7modify-form-' + rentStatusId);
		var text = form.find('input[name="7reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#7modify-form-' + rentStatusId).hide();
				$('#7reply-' + rentStatusId).text(data);
				$('#7reply-' + rentStatusId).show();
				$('#7save-btn-' + rentStatusId).hide();
				$('#7modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 8월 버튼 토글 함수
	function toggleModifybtn8(rentStatusId, month) {
		console.log(rentStatusId);
		$('#8modify-btn-' + rentStatusId).hide();
		$('#8save-btn-' + rentStatusId).show();
		$('#8reply-' + rentStatusId).hide();
		$('#8modify-form-' + rentStatusId).show();
	}

	// 8월 수정 함수
	function doModifyRentStatus8(rentStatusId, month) {
		var form = $('#8modify-form-' + rentStatusId);
		var text = form.find('input[name="8reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#8modify-form-' + rentStatusId).hide();
				$('#8reply-' + rentStatusId).text(data);
				$('#8reply-' + rentStatusId).show();
				$('#8save-btn-' + rentStatusId).hide();
				$('#8modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 9월 버튼 토글 함수
	function toggleModifybtn9(rentStatusId, month) {
		console.log(rentStatusId);
		$('#9modify-btn-' + rentStatusId).hide();
		$('#9save-btn-' + rentStatusId).show();
		$('#9reply-' + rentStatusId).hide();
		$('#9modify-form-' + rentStatusId).show();
	}

	// 9월 수정 함수
	function doModifyRentStatus9(rentStatusId, month) {
		var form = $('#9modify-form-' + rentStatusId);
		var text = form.find('input[name="9reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#9modify-form-' + rentStatusId).hide();
				$('#9reply-' + rentStatusId).text(data);
				$('#9reply-' + rentStatusId).show();
				$('#9save-btn-' + rentStatusId).hide();
				$('#9modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 10월 버튼 토글 함수
	function toggleModifybtn10(rentStatusId, month) {
		console.log(rentStatusId);
		$('#10modify-btn-' + rentStatusId).hide();
		$('#10save-btn-' + rentStatusId).show();
		$('#10reply-' + rentStatusId).hide();
		$('#10modify-form-' + rentStatusId).show();
	}

	// 10월 수정 함수
	function doModifyRentStatus10(rentStatusId, month) {
		var form = $('#10modify-form-' + rentStatusId);
		var text = form.find('input[name="10reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#10modify-form-' + rentStatusId).hide();
				$('#10reply-' + rentStatusId).text(data);
				$('#10reply-' + rentStatusId).show();
				$('#10save-btn-' + rentStatusId).hide();
				$('#10modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 11월 버튼 토글 함수
	function toggleModifybtn11(rentStatusId, month) {
		console.log(rentStatusId);
		$('#11modify-btn-' + rentStatusId).hide();
		$('#11save-btn-' + rentStatusId).show();
		$('#11reply-' + rentStatusId).hide();
		$('#11modify-form-' + rentStatusId).show();
	}

	// 11월 수정 함수
	function doModifyRentStatus11(rentStatusId, month) {
		var form = $('#11modify-form-' + rentStatusId);
		var text = form.find('input[name="11reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#11modify-form-' + rentStatusId).hide();
				$('#11reply-' + rentStatusId).text(data);
				$('#11reply-' + rentStatusId).show();
				$('#11save-btn-' + rentStatusId).hide();
				$('#11modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}

	// 12월 버튼 토글 함수
	function toggleModifybtn12(rentStatusId, month) {
		console.log(rentStatusId);
		$('#12modify-btn-' + rentStatusId).hide();
		$('#12save-btn-' + rentStatusId).show();
		$('#12reply-' + rentStatusId).hide();
		$('#12modify-form-' + rentStatusId).show();
	}

	// 12월 수정 함수
	function doModifyRentStatus12(rentStatusId, month) {
		var form = $('#12modify-form-' + rentStatusId);
		var text = form.find('input[name="12reply-text-' + rentStatusId + '"]')
				.val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#12modify-form-' + rentStatusId).hide();
				$('#12reply-' + rentStatusId).text(data);
				$('#12reply-' + rentStatusId).show();
				$('#12save-btn-' + rentStatusId).hide();
				$('#12modify-btn-' + rentStatusId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}
</script>





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



						<!-- January -->
						<td>
							<span id="reply-${rentStatus.tenantId }">${rentStatus.januaryPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.januaryPaymentStatus }"
									name="reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn('${rentStatus.tenantId}');" id="modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01');" style="white-space: nowrap; display: none"
								id="save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- February -->
						<td>
							<span id="2reply-${rentStatus.tenantId }">${rentStatus.februaryPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="2modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.februaryPaymentStatus }"
									name="2reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn2('${rentStatus.tenantId}');" id="2modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus2('${rentStatus.tenantId}', '02');" style="white-space: nowrap; display: none"
								id="2save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- March -->
						<td>
							<span id="3reply-${rentStatus.tenantId }">${rentStatus.marchPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="3modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.marchPaymentStatus }" name="3reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn3('${rentStatus.tenantId}');" id="3modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus3('${rentStatus.tenantId}', '03');" style="white-space: nowrap; display: none"
								id="3save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- April -->
						<td>
							<span id="4reply-${rentStatus.tenantId }">${rentStatus.aprilPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="4modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.aprilPaymentStatus }" name="4reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn4('${rentStatus.tenantId}');" id="4modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus4('${rentStatus.tenantId}', '04');" style="white-space: nowrap; display: none"
								id="4save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- May -->
						<td>
							<span id="5reply-${rentStatus.tenantId }">${rentStatus.mayPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="5modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.mayPaymentStatus }" name="5reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn5('${rentStatus.tenantId}');" id="5modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus5('${rentStatus.tenantId}', '05');" style="white-space: nowrap; display: none"
								id="5save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- June -->
						<td>
							<span id="6reply-${rentStatus.tenantId }">${rentStatus.junePaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="6modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.junePaymentStatus }" name="6reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn6('${rentStatus.tenantId}');" id="6modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus6('${rentStatus.tenantId}', '06');" style="white-space: nowrap; display: none"
								id="6save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- July -->
						<td>
							<span id="7reply-${rentStatus.tenantId }">${rentStatus.julyPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="7modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.julyPaymentStatus }" name="7reply-text-${rentStatus.tenantId }" />
							</form>
							<button onclick="toggleModifybtn7('${rentStatus.tenantId}');" id="7modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus7('${rentStatus.tenantId}', '07');" style="white-space: nowrap; display: none"
								id="7save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- August -->
						<td>
							<span id="8reply-${rentStatus.tenantId }">${rentStatus.augustPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="8modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.augustPaymentStatus }"
									name="8reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn8('${rentStatus.tenantId}');" id="8modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus8('${rentStatus.tenantId}', '08');" style="white-space: nowrap; display: none"
								id="8save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- September -->
						<td>
							<span id="9reply-${rentStatus.tenantId }">${rentStatus.septemberPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="9modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.septemberPaymentStatus }"
									name="9reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn9('${rentStatus.tenantId}');" id="9modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus9('${rentStatus.tenantId}', '09');" style="white-space: nowrap; display: none"
								id="9save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- October -->
						<td>
							<span id="10reply-${rentStatus.tenantId }">${rentStatus.octoberPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="10modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.octoberPaymentStatus }"
									name="10reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn10('${rentStatus.tenantId}');" id="10modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus10('${rentStatus.tenantId}', '10');"
								style="white-space: nowrap; display: none" id="10save-btn-${rentStatus.tenantId }"
								class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- November -->
						<td>
							<span id="11reply-${rentStatus.tenantId }">${rentStatus.novemberPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="11modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.novemberPaymentStatus }"
									name="11reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn11('${rentStatus.tenantId}');" id="11modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus11('${rentStatus.tenantId}', '11');"
								style="white-space: nowrap; display: none" id="11save-btn-${rentStatus.tenantId }"
								class="btn btn-xs btn-outline"
							>저장</button>
						</td>

						<!-- December -->
						<td>
							<span id="12reply-${rentStatus.tenantId }">${rentStatus.decemberPaymentStatus }</span>
							<form onsubmit="return false;" method="POST" id="12modify-form-${rentStatus.tenantId }" style="display: none"
								action="/usr/bg12343/doRentStatusModify"
							>
								<input size="1" type="text" value="${rentStatus.decemberPaymentStatus }"
									name="12reply-text-${rentStatus.tenantId }"
								/>
							</form>
							<button onclick="toggleModifybtn12('${rentStatus.tenantId}');" id="12modify-btn-${rentStatus.tenantId }"
								style="white-space: nowrap" class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyRentStatus12('${rentStatus.tenantId}', '12');"
								style="white-space: nowrap; display: none" id="12save-btn-${rentStatus.tenantId }"
								class="btn btn-xs btn-outline"
							>저장</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</section>





<%@ include file="../common/foot.jspf"%>