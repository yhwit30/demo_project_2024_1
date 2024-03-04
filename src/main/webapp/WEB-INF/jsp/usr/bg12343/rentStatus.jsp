<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="RENT SATUS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

스크립트 개행오류 있음 nowYear 데이터에. 나중에 납부현황 hover로수정삭제 넣기



<!-- 수납현황 수정 ajax -->
<script>
	// 1월 버튼 토글 함수
	function toggleModifybtn(rentStatusTenantId, month) {

		$('#modify-btn-' + rentStatusTenantId).hide();
		$('#save-btn-' + rentStatusTenantId).show();
		$('#rent-' + rentStatusTenantId).hide();
		$('#modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정해서 수정 시 나오도록
		var value = $('#rent-' + rentStatusTenantId).text();
		$(
				'#modify-form-' + rentStatusTenantId
						+ ' input[name="rent-text-' + rentStatusTenantId + '"]')
				.val(value);
	}

	// 1월수정 함수
	function doModifyRentStatus(rentStatusTenantId, month) {
		var form = $('#modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('form:' + form);
		console.log('text:' + text);
		console.log('month:' + month);

		// 세입자 없는 칸에 시험으로 alert했지만 마음에 안듦
		if (rentStatusTenantId == 0) {
			alert('세입자가 없습니다')
		}

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#modify-form-' + rentStatusTenantId).hide();
				$('#rent-' + rentStatusTenantId).text(data);
				$('#rent-' + rentStatusTenantId).show();
				$('#save-btn-' + rentStatusTenantId).hide();
				$('#modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 2월 버튼 토글 함수
	function toggleModifybtn2(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#2modify-btn-' + rentStatusTenantId).hide();
		$('#2save-btn-' + rentStatusTenantId).show();
		$('#2rent-' + rentStatusTenantId).hide();
		$('#2modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정
		var value = $('#2rent-' + rentStatusTenantId).text();
		$(
				'#2modify-form-' + rentStatusTenantId
						+ ' input[name="2rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 2월수정 함수
	function doModifyRentStatus2(rentStatusTenantId, month) {
		var form = $('#2modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="2rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#2modify-form-' + rentStatusTenantId).hide();
				$('#2rent-' + rentStatusTenantId).text(data);
				$('#2rent-' + rentStatusTenantId).show();
				$('#2save-btn-' + rentStatusTenantId).hide();
				$('#2modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 3월 버튼 토글 함수
	function toggleModifybtn3(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#3modify-btn-' + rentStatusTenantId).hide();
		$('#3save-btn-' + rentStatusTenantId).show();
		$('#3rent-' + rentStatusTenantId).hide();
		$('#3modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정
		var value = $('#3rent-' + rentStatusTenantId).text();
		$(
				'#3modify-form-' + rentStatusTenantId
						+ ' input[name="3rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 3월 수정 함수
	function doModifyRentStatus3(rentStatusTenantId, month) {
		var form = $('#3modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="3rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#3modify-form-' + rentStatusTenantId).hide();
				$('#3rent-' + rentStatusTenantId).text(data);
				$('#3rent-' + rentStatusTenantId).show();
				$('#3save-btn-' + rentStatusTenantId).hide();
				$('#3modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 4월 버튼 토글 함수
	function toggleModifybtn4(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#4modify-btn-' + rentStatusTenantId).hide();
		$('#4save-btn-' + rentStatusTenantId).show();
		$('#4rent-' + rentStatusTenantId).hide();
		$('#4modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 4월 수정 함수
	function doModifyRentStatus4(rentStatusTenantId, month) {
		var form = $('#4modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="4rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#4modify-form-' + rentStatusTenantId).hide();
				$('#4rent-' + rentStatusTenantId).text(data);
				$('#4rent-' + rentStatusTenantId).show();
				$('#4save-btn-' + rentStatusTenantId).hide();
				$('#4modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 5월 버튼 토글 함수
	function toggleModifybtn5(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#5modify-btn-' + rentStatusTenantId).hide();
		$('#5save-btn-' + rentStatusTenantId).show();
		$('#5rent-' + rentStatusTenantId).hide();
		$('#5modify-form-' + rentStatusTenantId).show();

		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 5월수정 함수
	function doModifyRentStatus5(rentStatusTenantId, month) {
		var form = $('#5modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="5rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#5modify-form-' + rentStatusTenantId).hide();
				$('#5rent-' + rentStatusTenantId).text(data);
				$('#5rent-' + rentStatusTenantId).show();
				$('#5save-btn-' + rentStatusTenantId).hide();
				$('#5modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 6월
	function toggleModifybtn6(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#6modify-btn-' + rentStatusTenantId).hide();
		$('#6save-btn-' + rentStatusTenantId).show();
		$('#6rent-' + rentStatusTenantId).hide();
		$('#6modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	function doModifyRentStatus6(rentStatusTenantId, month) {
		var form = $('#6modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="6rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#6modify-form-' + rentStatusTenantId).hide();
				$('#6rent-' + rentStatusTenantId).text(data);
				$('#6rent-' + rentStatusTenantId).show();
				$('#6save-btn-' + rentStatusTenantId).hide();
				$('#6modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 7월 버튼 토글 함수
	function toggleModifybtn7(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#7modify-btn-' + rentStatusTenantId).hide();
		$('#7save-btn-' + rentStatusTenantId).show();
		$('#7rent-' + rentStatusTenantId).hide();
		$('#7modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 7월수정 함수
	function doModifyRentStatus7(rentStatusTenantId, month) {
		var form = $('#7modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="7rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#7modify-form-' + rentStatusTenantId).hide();
				$('#7rent-' + rentStatusTenantId).text(data);
				$('#7rent-' + rentStatusTenantId).show();
				$('#7save-btn-' + rentStatusTenantId).hide();
				$('#7modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 8월 버튼 토글 함수
	function toggleModifybtn8(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#8modify-btn-' + rentStatusTenantId).hide();
		$('#8save-btn-' + rentStatusTenantId).show();
		$('#8rent-' + rentStatusTenantId).hide();
		$('#8modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 8월수정 함수
	function doModifyRentStatus8(rentStatusTenantId, month) {
		var form = $('#8modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="8rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#8modify-form-' + rentStatusTenantId).hide();
				$('#8rent-' + rentStatusTenantId).text(data);
				$('#8rent-' + rentStatusTenantId).show();
				$('#8save-btn-' + rentStatusTenantId).hide();
				$('#8modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 9월 버튼 토글 함수
	function toggleModifybtn9(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#9modify-btn-' + rentStatusTenantId).hide();
		$('#9save-btn-' + rentStatusTenantId).show();
		$('#9rent-' + rentStatusTenantId).hide();
		$('#9modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 9월수정 함수
	function doModifyRentStatus9(rentStatusTenantId, month) {
		var form = $('#9modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="9rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#9modify-form-' + rentStatusTenantId).hide();
				$('#9rent-' + rentStatusTenantId).text(data);
				$('#9rent-' + rentStatusTenantId).show();
				$('#9save-btn-' + rentStatusTenantId).hide();
				$('#9modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 10월 버튼 토글 함수
	function toggleModifybtn10(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#10modify-btn-' + rentStatusTenantId).hide();
		$('#10save-btn-' + rentStatusTenantId).show();
		$('#10rent-' + rentStatusTenantId).hide();
		$('#10modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 10월수정 함수
	function doModifyRentStatus10(rentStatusTenantId, month) {
		var form = $('#10modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="10rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#10modify-form-' + rentStatusTenantId).hide();
				$('#10rent-' + rentStatusTenantId).text(data);
				$('#10rent-' + rentStatusTenantId).show();
				$('#10save-btn-' + rentStatusTenantId).hide();
				$('#10modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 11월 버튼 토글 함수
	function toggleModifybtn11(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#11modify-btn-' + rentStatusTenantId).hide();
		$('#11save-btn-' + rentStatusTenantId).show();
		$('#11rent-' + rentStatusTenantId).hide();
		$('#11modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 11월수정 함수
	function doModifyRentStatus11(rentStatusTenantId, month) {
		var form = $('#11modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="11rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#11modify-form-' + rentStatusTenantId).hide();
				$('#11rent-' + rentStatusTenantId).text(data);
				$('#11rent-' + rentStatusTenantId).show();
				$('#11save-btn-' + rentStatusTenantId).hide();
				$('#11modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 12월 버튼 토글 함수
	function toggleModifybtn12(rentStatusTenantId, month) {
		console.log(rentStatusTenantId);
		$('#12modify-btn-' + rentStatusTenantId).hide();
		$('#12save-btn-' + rentStatusTenantId).show();
		$('#12rent-' + rentStatusTenantId).hide();
		$('#12modify-form-' + rentStatusTenantId).show();
		// 추가한 값을 입력 필드에 설정
		var value = $('#4rent-' + rentStatusTenantId).text();
		$(
				'#4modify-form-' + rentStatusTenantId
						+ ' input[name="4rent-text-' + rentStatusTenantId
						+ '"]').val(value);
	}

	// 12월수정 함수
	function doModifyRentStatus12(rentStatusTenantId, month) {
		var form = $('#12modify-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="12rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		$.post({
			url : '/usr/bg12343/doRentStatusModify',
			type : 'POST',
			data : {
				tenantId : rentStatusTenantId,
				body : text,
				year : year,
				month : month
			},
			success : function(data) {
				$('#12modify-form-' + rentStatusTenantId).hide();
				$('#12rent-' + rentStatusTenantId).text(data);
				$('#12rent-' + rentStatusTenantId).show();
				$('#12save-btn-' + rentStatusTenantId).hide();
				$('#12modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}
</script>

<!-- 수납현황 추가 ajax -->
<script>
	// 1월 add 토글 함수
	function toggleAddbtn(rentStatusTenantId, month) {
		console.log("Current rentStatus.januaryPaymentStatus: "
				+ $('#add-rent-' + rentStatusTenantId).text());

		$('#add-btn-' + rentStatusTenantId).hide();
		$('#add-save-btn-' + rentStatusTenantId).show();
		$('#add-form-' + rentStatusTenantId).show();
	}

	// 1월 add 함수
	function doAddRentStatus(rentStatusTenantId, month) {
		var form = $('#add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="add-rent-text-' + rentStatusTenantId + '"]').val();
		var year = 2024;

		console.log('rentStatusTenantId:' + rentStatusTenantId);
		console.log('form:' + form);
		console.log('text:' + text);
		console.log('month:' + month);

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
				$('#add-form-' + rentStatusTenantId).hide();
				$('#add-btn-' + rentStatusTenantId).hide();
				$('#add-save-btn-' + rentStatusTenantId).hide();
				$('#rent-' + rentStatusTenantId).text(data);
				$('#modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 2월 add 토글 함수
	function toggleAddbtn2(rentStatusTenantId, month) {

		$('#2add-btn-' + rentStatusTenantId).hide();
		$('#2add-save-btn-' + rentStatusTenantId).show();
		$('#2add-form-' + rentStatusTenantId).show();
	}

	// 2월 add 함수
	function doAddRentStatus2(rentStatusTenantId, month) {
		var form = $('#2add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="2add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#2add-form-' + rentStatusTenantId).hide();
				$('#2add-btn-' + rentStatusTenantId).hide();
				$('#2add-save-btn-' + rentStatusTenantId).hide();
				$('#2rent-' + rentStatusTenantId).text(data);
				$('#2modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 3월 add 토글 함수
	function toggleAddbtn3(rentStatusTenantId, month) {
		$('#3add-btn-' + rentStatusTenantId).hide();
		$('#3add-save-btn-' + rentStatusTenantId).show();
		$('#3add-form-' + rentStatusTenantId).show();
	}

	// 3월 add 함수
	function doAddRentStatus3(rentStatusTenantId, month) {
		var form = $('#3add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="3add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#3add-form-' + rentStatusTenantId).hide();
				$('#3add-btn-' + rentStatusTenantId).hide();
				$('#3add-save-btn-' + rentStatusTenantId).hide();
				$('#3rent-' + rentStatusTenantId).text(data);
				$('#3modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 4월 add 토글 함수
	function toggleAddbtn4(rentStatusTenantId, month) {
		$('#4add-btn-' + rentStatusTenantId).hide();
		$('#4add-save-btn-' + rentStatusTenantId).show();
		$('#4add-form-' + rentStatusTenantId).show();
	}

	// 4월 add 함수
	function doAddRentStatus4(rentStatusTenantId, month) {
		var form = $('#4add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="4add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#4add-form-' + rentStatusTenantId).hide();
				$('#4add-btn-' + rentStatusTenantId).hide();
				$('#4add-save-btn-' + rentStatusTenantId).hide();
				$('#4rent-' + rentStatusTenantId).text(data);
				$('#4modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 5월 add 토글 함수
	function toggleAddbtn5(rentStatusTenantId, month) {
		$('#5add-btn-' + rentStatusTenantId).hide();
		$('#5add-save-btn-' + rentStatusTenantId).show();
		$('#5add-form-' + rentStatusTenantId).show();
	}

	// 5월 add 함수
	function doAddRentStatus5(rentStatusTenantId, month) {
		var form = $('#5add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="5add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#5add-form-' + rentStatusTenantId).hide();
				$('#5add-btn-' + rentStatusTenantId).hide();
				$('#5add-save-btn-' + rentStatusTenantId).hide();
				$('#5rent-' + rentStatusTenantId).text(data);
				$('#5modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 6월 add 토글 함수
	function toggleAddbtn6(rentStatusTenantId, month) {
		$('#6add-btn-' + rentStatusTenantId).hide();
		$('#6add-save-btn-' + rentStatusTenantId).show();
		$('#6add-form-' + rentStatusTenantId).show();
	}

	// 6월 add 함수
	function doAddRentStatus6(rentStatusTenantId, month) {
		var form = $('#6add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="6add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#6add-form-' + rentStatusTenantId).hide();
				$('#6add-btn-' + rentStatusTenantId).hide();
				$('#6add-save-btn-' + rentStatusTenantId).hide();
				$('#6rent-' + rentStatusTenantId).text(data);
				$('#6modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 7월 add 토글 함수
	function toggleAddbtn7(rentStatusTenantId, month) {
		$('#7add-btn-' + rentStatusTenantId).hide();
		$('#7add-save-btn-' + rentStatusTenantId).show();
		$('#7add-form-' + rentStatusTenantId).show();
	}

	// 7월 add 함수
	function doAddRentStatus7(rentStatusTenantId, month) {
		var form = $('#7add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="7add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#7add-form-' + rentStatusTenantId).hide();
				$('#7add-btn-' + rentStatusTenantId).hide();
				$('#7add-save-btn-' + rentStatusTenantId).hide();
				$('#7rent-' + rentStatusTenantId).text(data);
				$('#7modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 8월 add 토글 함수
	function toggleAddbtn8(rentStatusTenantId, month) {
		$('#8add-btn-' + rentStatusTenantId).hide();
		$('#8add-save-btn-' + rentStatusTenantId).show();
		$('#8add-form-' + rentStatusTenantId).show();
	}

	// 8월 add 함수
	function doAddRentStatus8(rentStatusTenantId, month) {
		var form = $('#8add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="8add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#8add-form-' + rentStatusTenantId).hide();
				$('#8add-btn-' + rentStatusTenantId).hide();
				$('#8add-save-btn-' + rentStatusTenantId).hide();
				$('#8rent-' + rentStatusTenantId).text(data);
				$('#8modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 9월 add 토글 함수
	function toggleAddbtn9(rentStatusTenantId, month) {
		$('#9add-btn-' + rentStatusTenantId).hide();
		$('#9add-save-btn-' + rentStatusTenantId).show();
		$('#9add-form-' + rentStatusTenantId).show();
	}

	// 9월 add 함수
	function doAddRentStatus9(rentStatusTenantId, month) {
		var form = $('#9add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="9add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#9add-form-' + rentStatusTenantId).hide();
				$('#9add-btn-' + rentStatusTenantId).hide();
				$('#9add-save-btn-' + rentStatusTenantId).hide();
				$('#9rent-' + rentStatusTenantId).text(data);
				$('#9modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 10월 add 토글 함수
	function toggleAddbtn10(rentStatusTenantId, month) {
		$('#10add-btn-' + rentStatusTenantId).hide();
		$('#10add-save-btn-' + rentStatusTenantId).show();
		$('#10add-form-' + rentStatusTenantId).show();
	}

	// 10월 add 함수
	function doAddRentStatus10(rentStatusTenantId, month) {
		var form = $('#10add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="10add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#10add-form-' + rentStatusTenantId).hide();
				$('#10add-btn-' + rentStatusTenantId).hide();
				$('#10add-save-btn-' + rentStatusTenantId).hide();
				$('#10rent-' + rentStatusTenantId).text(data);
				$('#10modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 11월 add 토글 함수
	function toggleAddbtn11(rentStatusTenantId, month) {
		$('#11add-btn-' + rentStatusTenantId).hide();
		$('#11add-save-btn-' + rentStatusTenantId).show();
		$('#11add-form-' + rentStatusTenantId).show();
	}

	// 11월 add 함수
	function doAddRentStatus11(rentStatusTenantId, month) {
		var form = $('#11add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="11add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#11add-form-' + rentStatusTenantId).hide();
				$('#11add-btn-' + rentStatusTenantId).hide();
				$('#11add-save-btn-' + rentStatusTenantId).hide();
				$('#11rent-' + rentStatusTenantId).text(data);
				$('#11modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}

	// 12월 add 토글 함수
	function toggleAddbtn12(rentStatusTenantId, month) {
		$('#12add-btn-' + rentStatusTenantId).hide();
		$('#12add-save-btn-' + rentStatusTenantId).show();
		$('#12add-form-' + rentStatusTenantId).show();
	}

	// 12월 add 함수
	function doAddRentStatus12(rentStatusTenantId, month) {
		var form = $('#12add-form-' + rentStatusTenantId);
		var text = form.find(
				'input[name="12add-rent-text-' + rentStatusTenantId + '"]')
				.val();
		var year = 2024;

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
				$('#12add-form-' + rentStatusTenantId).hide();
				$('#12add-btn-' + rentStatusTenantId).hide();
				$('#12add-save-btn-' + rentStatusTenantId).hide();
				$('#12rent-' + rentStatusTenantId).text(data);
				$('#12modify-btn-' + rentStatusTenantId).show();
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		})
	}
</script>


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


${paymentStatusRd }

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
							<c:if test="${rentStatus.tenantId != 0 }">

								<!-- 납부일자 그려주는 태그 -->
								<span id="rent-${rentStatus.tenantId }">${rentStatus.januaryPaymentStatus }</span>
								<!-- 수정기능 -->
								<c:if test="${not empty rentStatus.januaryPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.januaryPaymentStatus }"
											name="rent-text-${rentStatus.tenantId }" />
									</form>
									<!--수정버튼 토글 -->
									<button onclick="toggleModifybtn('${rentStatus.tenantId}');" id="modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01');"
										style="white-space: nowrap; display: none" id="save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--추가기능 -->
								<c:if test="${empty rentStatus.januaryPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="add-rent-text-${rentStatus.tenantId }" />
									</form>
									<!-- 추가버튼 토글 -->
									<button onclick="toggleAddbtn('${rentStatus.tenantId}');" id="add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus('${rentStatus.tenantId}', '01');" style="white-space: nowrap; display: none"
										id="add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정기능 -->
									<form onsubmit="return false;" method="POST" id="modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="" name="rent-text-${rentStatus.tenantId }" />
									</form>
									<!--수정버튼 토글 -->
									<button onclick="toggleModifybtn('${rentStatus.tenantId}');" id="modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus('${rentStatus.tenantId}', '01');"
										style="white-space: nowrap; display: none" id="save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- February -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="2rent-${rentStatus.tenantId }">${rentStatus.februaryPaymentStatus }</span>

								<!-- 수정 -->
								<c:if test="${not empty rentStatus.februaryPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="2modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.februaryPaymentStatus }"
											name="2rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn2('${rentStatus.tenantId}');" id="2modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus2('${rentStatus.tenantId}', '02');"
										style="white-space: nowrap; display: none" id="2save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--추가 -->
								<c:if test="${empty rentStatus.februaryPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="2add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="2add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn2('${rentStatus.tenantId}');" id="2add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus2('${rentStatus.tenantId}', '02');" style="white-space: nowrap; display: none"
										id="2add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="2modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.februaryPaymentStatus }"
											name="2rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn2('${rentStatus.tenantId}');" id="2modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus2('${rentStatus.tenantId}', '02');"
										style="white-space: nowrap; display: none" id="2save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>



						<!-- March -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="3rent-${rentStatus.tenantId }">${rentStatus.marchPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.marchPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="3modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.marchPaymentStatus }"
											name="3rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn3('${rentStatus.tenantId}');" id="3modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus3('${rentStatus.tenantId}', '03');"
										style="white-space: nowrap; display: none" id="3save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 입력 -->
								<c:if test="${empty rentStatus.marchPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="3add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="3add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn3('${rentStatus.tenantId}');" id="3add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus3('${rentStatus.tenantId}', '03');" style="white-space: nowrap; display: none"
										id="3add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>

									<!-- 입력 후 수정  -->
									<form onsubmit="return false;" method="POST" id="3modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.marchPaymentStatus }"
											name="3rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn3('${rentStatus.tenantId}');" id="3modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus3('${rentStatus.tenantId}', '03');"
										style="white-space: nowrap; display: none" id="3save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- April -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="4rent-${rentStatus.tenantId }">${rentStatus.aprilPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.aprilPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="4modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.aprilPaymentStatus }"
											name="4rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn4('${rentStatus.tenantId}');" id="4modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus4('${rentStatus.tenantId}', '04');"
										style="white-space: nowrap; display: none" id="4save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!-- 입력  -->
								<c:if test="${empty rentStatus.aprilPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="4add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="4add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn4('${rentStatus.tenantId}');" id="4add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus4('${rentStatus.tenantId}', '04');" style="white-space: nowrap; display: none"
										id="4add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>

									<!-- 입력 후 수정  -->
									<form onsubmit="return false;" method="POST" id="4modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.aprilPaymentStatus }"
											name="4rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn4('${rentStatus.tenantId}');" id="4modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus4('${rentStatus.tenantId}', '04');"
										style="white-space: nowrap; display: none" id="4save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>


						<!-- May -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="5rent-${rentStatus.tenantId }">${rentStatus.mayPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.mayPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="5modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.mayPaymentStatus }" name="5rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn5('${rentStatus.tenantId}');" id="5modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus5('${rentStatus.tenantId}', '05');"
										style="white-space: nowrap; display: none" id="5save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.mayPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="5add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="5add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn5('${rentStatus.tenantId}');" id="5add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus5('${rentStatus.tenantId}', '05');" style="white-space: nowrap; display: none"
										id="5add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="5modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.mayPaymentStatus }" name="5rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn5('${rentStatus.tenantId}');" id="5modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus5('${rentStatus.tenantId}', '05');"
										style="white-space: nowrap; display: none" id="5save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- June -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="6rent-${rentStatus.tenantId }">${rentStatus.junePaymentStatus }</span>

								<!-- 수정 -->
								<c:if test="${not empty rentStatus.junePaymentStatus}">
									<form onsubmit="return false;" method="POST" id="6modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.junePaymentStatus }" name="6rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn6('${rentStatus.tenantId}');" id="6modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus6('${rentStatus.tenantId}', '06');"
										style="white-space: nowrap; display: none" id="6save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.junePaymentStatus}">
									<form onsubmit="return false;" method="POST" id="6add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="6add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn6('${rentStatus.tenantId}');" id="6add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus6('${rentStatus.tenantId}', '06');" style="white-space: nowrap; display: none"
										id="6add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="6modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.junePaymentStatus }" name="6rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn6('${rentStatus.tenantId}');" id="6modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus6('${rentStatus.tenantId}', '06');"
										style="white-space: nowrap; display: none" id="6save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- July -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="7rent-${rentStatus.tenantId }">${rentStatus.julyPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.julyPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="7modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.julyPaymentStatus }" name="7rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn7('${rentStatus.tenantId}');" id="7modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus7('${rentStatus.tenantId}', '07');"
										style="white-space: nowrap; display: none" id="7save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.julyPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="7add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="7add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn7('${rentStatus.tenantId}');" id="7add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus7('${rentStatus.tenantId}', '07');" style="white-space: nowrap; display: none"
										id="7add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="7modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.julyPaymentStatus }" name="7rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn7('${rentStatus.tenantId}');" id="7modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus7('${rentStatus.tenantId}', '07');"
										style="white-space: nowrap; display: none" id="7save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- August -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="8rent-${rentStatus.tenantId }">${rentStatus.augustPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.augustPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="8modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.augustPaymentStatus }"
											name="8rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn8('${rentStatus.tenantId}');" id="8modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus8('${rentStatus.tenantId}', '08');"
										style="white-space: nowrap; display: none" id="8save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.augustPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="8add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="8add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn8('${rentStatus.tenantId}');" id="8add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus8('${rentStatus.tenantId}', '08');" style="white-space: nowrap; display: none"
										id="8add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="8modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.augustPaymentStatus }"
											name="8rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn8('${rentStatus.tenantId}');" id="8modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus8('${rentStatus.tenantId}', '08');"
										style="white-space: nowrap; display: none" id="8save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- September -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="9rent-${rentStatus.tenantId }">${rentStatus.septemberPaymentStatus }</span>

								<!-- 수정  -->
								<c:if test="${not empty rentStatus.septemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="9modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.septemberPaymentStatus }"
											name="9rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn9('${rentStatus.tenantId}');" id="9modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus9('${rentStatus.tenantId}', '09');"
										style="white-space: nowrap; display: none" id="9save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.septemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="9add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="9add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn9('${rentStatus.tenantId}');" id="9add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus9('${rentStatus.tenantId}', '09');" style="white-space: nowrap; display: none"
										id="9add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="9modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.septemberPaymentStatus }"
											name="9rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn9('${rentStatus.tenantId}');" id="9modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus9('${rentStatus.tenantId}', '09');"
										style="white-space: nowrap; display: none" id="9save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- October -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="10rent-${rentStatus.tenantId }">${rentStatus.octoberPaymentStatus }</span>

								<!-- 수정 -->
								<c:if test="${not empty rentStatus.octoberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="10modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.octoberPaymentStatus }"
											name="10rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn10('${rentStatus.tenantId}');" id="10modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus10('${rentStatus.tenantId}', '10');"
										style="white-space: nowrap; display: none" id="10save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.octoberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="10add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="10add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn10('${rentStatus.tenantId}');" id="10add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus10('${rentStatus.tenantId}', '10');" style="white-space: nowrap; display: none"
										id="10add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="10modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.octoberPaymentStatus }"
											name="10rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn10('${rentStatus.tenantId}');" id="10modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus10('${rentStatus.tenantId}', '10');"
										style="white-space: nowrap; display: none" id="10save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- November -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="11rent-${rentStatus.tenantId }">${rentStatus.novemberPaymentStatus }</span>

								<!-- 수정 -->
								<c:if test="${not empty rentStatus.novemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="11modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.novemberPaymentStatus }"
											name="11rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn11('${rentStatus.tenantId}');" id="11modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus11('${rentStatus.tenantId}', '11');"
										style="white-space: nowrap; display: none" id="11save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.novemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="11add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="11add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn11('${rentStatus.tenantId}');" id="11add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus11('${rentStatus.tenantId}', '11');" style="white-space: nowrap; display: none"
										id="11add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="11modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.novemberPaymentStatus }"
											name="11rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn11('${rentStatus.tenantId}');" id="11modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus11('${rentStatus.tenantId}', '11');"
										style="white-space: nowrap; display: none" id="11save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>
							</c:if>
						</td>

						<!-- December -->
						<td>
							<c:if test="${rentStatus.tenantId != 0 }">
							<!-- 납부일자 그려주는 태그 -->
								<span id="12rent-${rentStatus.tenantId }">${rentStatus.decemberPaymentStatus }</span>

								<!-- 수정 -->
								<c:if test="${not empty rentStatus.decemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="12modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.decemberPaymentStatus }"
											name="12rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn12('${rentStatus.tenantId}');" id="12modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus12('${rentStatus.tenantId}', '12');"
										style="white-space: nowrap; display: none" id="12save-btn-${rentStatus.tenantId }"
										class="btn btn-xs btn-outline">저장</button>
								</c:if>

								<!--입력 -->
								<c:if test="${empty rentStatus.decemberPaymentStatus}">
									<form onsubmit="return false;" method="POST" id="12add-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusAdd">
										<input size="1" type="text" name="12add-rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleAddbtn12('${rentStatus.tenantId}');" id="12add-btn-${rentStatus.tenantId }"
										style="white-space: nowrap" class="btn btn-xs btn-outline">추가</button>
									<button onclick="doAddRentStatus12('${rentStatus.tenantId}', '12');" style="white-space: nowrap; display: none"
										id="12add-save-btn-${rentStatus.tenantId }" class="btn btn-xs btn-outline">저장</button>


									<!-- 입력 후 수정 -->
									<form onsubmit="return false;" method="POST" id="12modify-form-${rentStatus.tenantId }" style="display: none"
										action="/usr/bg12343/doRentStatusModify">
										<input size="1" type="text" value="${rentStatus.decemberPaymentStatus }"
											name="12rent-text-${rentStatus.tenantId }" />
									</form>
									<button onclick="toggleModifybtn12('${rentStatus.tenantId}');" id="12modify-btn-${rentStatus.tenantId }"
										style="white-space: nowrap; display: none" class="btn btn-xs btn-outline">수정</button>
									<button onclick="doModifyRentStatus12('${rentStatus.tenantId}', '12');"
										style="white-space: nowrap; display: none" id="12save-btn-${rentStatus.tenantId }"
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