<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPORT BUSINESS"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>

사업장 현황신고 dashboard controller 위치 23년도 사업장 현황신고// pdf 출력기능 추가


<section class="mt-2 text-xl px-4">
<!-- 건물 카테고리 버튼 -->
<div>
	<c:forEach var="building" items="${buildings }">
		<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
			href="../bg12343/reportBusiness?bldgId=${building.id }">${building.bldgName }</a>
	</c:forEach>
</div>

<!-- 연도 버튼 -->
<a class="btn btn-sm btn-outline ${param.year == nowYear -1 ? 'btn-active' : '' }"
	href="reportBusiness?bldgId=${param.bldgId }&year=${nowYear -1}">전년도 보기</a>
<a class="btn btn-sm btn-outline ${param.year == nowYear ? 'btn-active' : '' }"
	href="reportBusiness?bldgId=${param.bldgId }&year=${nowYear}">올해(${nowYear}) 보기</a>

	<!-- 사업장 현황신고표 -->
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<c:forEach var="rentStatus" items="${rentStatus }">
				<thead>

					<tr>
						<th>호실</th>
						<th>호실형태</th>
						<th>임대료</th>
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
					<tr>
						<td rowspan="2">${rentStatus.roomNum }</td>
						<td rowspan="2">${rentStatus.roomType }</td>
						<c:choose>
							<c:when test="${rentStatus.leaseType eq '전세'}">
								<td>전세 보증금</td>
							</c:when>
							<c:when test="${rentStatus.leaseType eq '반전세'}">
								<td>반전세 보증금</td>
							</c:when>
							<c:when test="${rentStatus.leaseType eq null}">
								<td rowspan="2">공실</td>
							</c:when>
							<c:otherwise>
								<td>월세 보증금</td>
							</c:otherwise>
						</c:choose>

						<!-- 월별 납부보증금 -->
						<!-- January -->
						<td>
							<c:if test="${not empty rentStatus.januaryPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- February -->
						<td>
							<c:if test="${not empty rentStatus.februaryPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- March -->
						<td>
							<c:if test="${not empty rentStatus.marchPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- April -->
						<td>
							<c:if test="${not empty rentStatus.aprilPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- May -->
						<td>
							<c:if test="${not empty rentStatus.mayPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- June -->
						<td>
							<c:if test="${not empty rentStatus.junePaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- July -->
						<td>
							<c:if test="${not empty rentStatus.julyPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- August -->
						<td>
							<c:if test="${not empty rentStatus.augustPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- September -->
						<td>
							<c:if test="${not empty rentStatus.septemberPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- October -->
						<td>
							<c:if test="${not empty rentStatus.octoberPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- November -->
						<td>
							<c:if test="${not empty rentStatus.novemberPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

						<!-- December -->
						<td>
							<c:if test="${not empty rentStatus.decemberPaymentStatus}">
								<span>${rentStatus.deposit}</span>
							</c:if>
						</td>

					</tr>
					<tr>
						<c:choose>
							<c:when test="${rentStatus.leaseType eq '전세'}">
								<td>전세</td>
							</c:when>
							<c:when test="${rentStatus.leaseType eq null}">
							</c:when>
							<c:otherwise>
								<td>납부 월세</td>
							</c:otherwise>

						</c:choose>

						<!-- 월별 납부월세 -->
						<!-- January -->
						<td>
							<c:if test="${not empty rentStatus.januaryPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- February -->
						<td>
							<c:if test="${not empty rentStatus.februaryPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- March -->
						<td>
							<c:if test="${not empty rentStatus.marchPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- April -->
						<td>
							<c:if test="${not empty rentStatus.aprilPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- May -->
						<td>
							<c:if test="${not empty rentStatus.mayPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- June -->
						<td>
							<c:if test="${not empty rentStatus.junePaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- July -->
						<td>
							<c:if test="${not empty rentStatus.julyPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- August -->
						<td>
							<c:if test="${not empty rentStatus.augustPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- September -->
						<td>
							<c:if test="${not empty rentStatus.septemberPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- October -->
						<td>
							<c:if test="${not empty rentStatus.octoberPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- November -->
						<td>
							<c:if test="${not empty rentStatus.novemberPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

						<!-- December -->
						<td>
							<c:if test="${not empty rentStatus.decemberPaymentStatus}">
								<span>${rentStatus.rent}</span>
							</c:if>
						</td>

					</tr>

					<!-- 세입자 정보 -->
					<tr>
						<td>세입자 정보</td>
						<td>${rentStatus.tenantName }</td>
						<td>${rentStatus.tenantPhone }</td>

					</tr>
				</tbody>
				<tr>
					<td colspan="16">
						<br>
						<!-- 단위별로 줄바꿈 -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>