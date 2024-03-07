<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAINTENANCE_FEE MODIFY"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>




<section class="mt-2 text-xl px-4">
	<div class="btns">
		<a class="btn btn-outline" href="../maintenanceFee/maintenanceFee?bldgId=${param.bldgId }">월별 관리비 돌아가기</a>
	</div>
	${param.month }월

	<div class="mx-auto overflow-x-auto">

		<form action="../maintenanceFee/doMaintenanceFeeModify" method="POST">
			<input type="hidden" name="bldgId" value="${param.bldgId }" />
			<input type="hidden" name="month" value="${param.month }" />
			<table class="table-box-1 table" border="1">
				<thead>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>한번에 쓰기</td>
						<td>
							<input id="bulkWriteInput" size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th>건물명</th>
						<th>호실</th>
						<th>세입자명</th>
						<th>임대형태</th>
						<th>공동전기</th>
						<th>공동수도</th>
						<th>엘레베이터</th>
						<th>인터넷티비</th>
						<th>소방안전</th>
						<th>수도사용</th>
						<th>수도단가</th>
						<th>수도금액</th>
						<th>전기사용</th>
						<th>전기단가</th>
						<th>전기금액</th>
						<th>가스사용</th>
						<th>가스단가</th>
						<th>가스금액</th>
						<th>당월계</th>
						<th>연체료</th>
						<th>납기후 금액</th>
						<th>납부일</th>

					</tr>
				</thead>

				<tbody>

					<c:forEach var="maintenanceFee" items="${maintenanceFee }">
						<input type="hidden" name="tenantId" value="${maintenanceFee.tenantId }" />
						<tr>
							<td>${maintenanceFee.bldgName }</td>
							<td>${maintenanceFee.roomNum }</td>
							<td>${maintenanceFee.tenantName }</td>
							<td>${maintenanceFee.leaseType }</td>
							<td>
								<input class="commonElecInput" size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요"
									name="commonElec" value="${maintenanceFee.commonElec }"
								/>
							</td>
							<td>
								<input class="commonWaterInput" size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요"
									name="commonWater" value="${maintenanceFee.commonWater }"
								/>
							</td>
							<td>
								<input size="2" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="elevater"
									value="${maintenanceFee.elevater }"
								/>
							</td>
							<td>
								<input size="2" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="internetTV"
									value="${maintenanceFee.internetTV }"
								/>
							</td>
							<td>
								<input size="2" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="fireSafety"
									value="${maintenanceFee.fireSafety }"
								/>
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="waterUse"
									value="${maintenanceFee.waterUse }"
								/>
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="waterCost"
									value="${maintenanceFee.waterCost }"
								/>
							</td>
							<td>${maintenanceFee.waterBill }</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="elecUse"
									value="${maintenanceFee.elecUse }"
								/>
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="elecCost"
									value="${maintenanceFee.elecCost }"
								/>
							</td>
							<td>${maintenanceFee.elecBill }</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="gasUse"
									value="${maintenanceFee.gasUse }"
								/>
							</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="gasCost"
									value="${maintenanceFee.gasCost }"
								/>
							</td>
							<td>${maintenanceFee.gasBill }</td>
							<td>${maintenanceFee.monthlyMaintenanceFee }</td>
							<td>${maintenanceFee.lateFee }</td>
							<td>${maintenanceFee.lateMaintenanceFee }</td>
							<td>
								<input size="1" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="maintenanceFeeDate"
									value="${maintenanceFee.maintenanceFeeDate }"
								/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input class="btn btn-info" type="submit" value="수정" />
			</div>
		</form>

	</div>


</section>



<script>

const bulkWriteInput = document.getElementById('bulkWriteInput');
const commonElecInputs = document.querySelectorAll('.commonElecInput');

bulkWriteInput.addEventListener('input', function() {
    const value = this.value;
    // 모든 commonElecInput 입력 필드에 같은 값을 설정
    commonElecInputs.forEach(input => {
        input.value = value; // 모든 입력 필드에 값을 설정

        // 이미 값이 채워져 있는 경우에는 값을 지우고 새로운 값을 설정
        if (input.value !== '') {
            input.value = '';
            input.value = value;
        }
    });
});
  
</script>







<%@ include file="../../common/foot.jspf"%>