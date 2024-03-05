<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTRACT DETAIL"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>



<!-- 수납현황 수정 ajax -->
<script>
	// 버튼 토글 함수
	function toggleModifybtn(contractId) {
		console.log('contractId:' + contractId);

		$('#modify-btn-' + contractId).hide();
		$('#save-btn-' + contractId).show();
		$('#modify-form-' + contractId).show();
	}

	//수정 함수
	function doModifyContract(contractId) {
		var form = $('#modify-form-' + contractId);
		var text = form.find('input[name="rent-text-' + contractId + '"]')
				.val();

		console.log('text:' + text);

		// 추가에 빈칸으로 넘어왔을 때 alert 날림
		if (text === null || text.trim() === '') {
			alert('공백을 채워주세요');
			return;
		}

		$.post({
			url : '/usr/bg12343/contract/doContractModifyAjax',
			type : 'POST',
			data : {
				contractId : contractId,
				roomNum : text,
			// 나머지 수정할 데이터도 여기에 추가
			},
			success : function(data) {
				$('#modify-form-' + contractId).hide();
				// 저장 후에는 수정 버튼을 보여주고, 수정 내용을 해당 행에 반영할 수 있도록 처리
				$('#modify-btn-' + contractId).show();
				$('#save-btn-' + contractId).hide();
				// 여기에 수정 내용을 해당 행에 반영하는 코드 추가
			},
			error : function(xhr, status, error) {
				alert('수정에 실패했습니다: ' + error);
			}
		});
	}
</script>




<section class="mt-2 text-xl px-4">
	<a class="btn btn-sm btn-outline ${0 == param.bldgId ? 'btn-active' : '' }" href="../contract/contract?bldgId=0">
		전체보기</a>
	<!-- 건물 카테고리 버튼 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="../contract/contract?bldgId=${building.id }"
			>${building.bldgName }</a>
		</c:forEach>
	</div>

	<!-- 계약정보표 -->
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${contractsCnt }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 5%" />
			</colgroup>
			<thead>
				<tr>
					<th>계약번호</th>
					<th>등록일</th>
					<!-- 					<th>갱신일</th> -->
					<th>건물명</th>
					<th>호실번호</th>
					<th>세입자명</th>
					<th>임대형태</th>
					<th>보증금</th>
					<th>월세</th>
					<th>관리비</th>
					<th>계약시작일</th>
					<th>계약만료일</th>
					<th>보증금 납부일</th>
					<th>월세 납부일</th>
					<th>계약메모</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="contract" items="${contracts }">
					<tr class="hover">
						<td>${contract.id }</td>
						<td>${contract.regDate.substring(0,10) }</td>
						<%-- 						<td>${contract.updateDate.substring(0,10) }</td> --%>
						<td>${contract.bldgName }</td>
						<td>${contract.roomNum }</td>
						<td>${contract.tenantName }</td>
						<td>${contract.leaseType }</td>
						<td>${contract.deposit }</td>
						<td>${contract.rent }</td>
						<td>${contract.maintenanceFee }</td>
						<td>${contract.contractStartDate }</td>
						<td>${contract.contractEndDate }</td>
						<td>${contract.depositDate }</td>
						<td>${contract.rentDate }</td>
						<td>#</td>
						<td>
							<!-- 수정기능 -->
							<form onsubmit="return false;" method="POST" id="modify-form-${contract.id}" style="display: none"
								action="/usr/bg12343/contract/doContractModifyAjax"
							>
								<input size="1" type="text" value="${contract.roomNum}" name="rent-text-${contract.id}" />
							</form>
							<button onclick="toggleModifybtn('${contract.id}');" id="modify-btn-${contract.id}" style="white-space: nowrap"
								class="btn btn-xs btn-outline"
							>수정</button>
							<button onclick="doModifyContract('${contract.id}');" style="white-space: nowrap; display: none"
								id="save-btn-${contract.id}" class="btn btn-xs btn-outline"
							>저장</button>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="btns mt-5">
		<a class="btn btn-outline" href="../contract/contractAdd">추가</a>
		<a class="btn btn-outline" href="../contract/contractModify?bldgId=${param.bldgId }">전체 수정</a>
		<!-- 		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a> -->
	</div>





</section>










<%@ include file="../../common/foot.jspf"%>