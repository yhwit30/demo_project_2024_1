<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DASHBOARD"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>


<script>
	$(window).ready(function() {
		draw(${occupancyRate}, '.pie-chart1', '#ff8c00');
		draw(50, '.pie-chart2', '#8b22ff');
		draw(30, '.pie-chart3', '#ff0');
	});

	function draw(max, classname, colorname) {
		var i = 1;
		var func1 = setInterval(function() {
			if (i <= max) {
				color1(i, classname, colorname);
				i++;
			} else {
				clearInterval(func1);
			}
		}, 10);
	}
	function color1(i, classname, colorname) {
		$(classname).css(
				{
					"background" : "conic-gradient(" + colorname + " 0% " + i
							+ "%, #ffffff " + i + "% 100%)"
				});
	}
</script>


<style>
.pie-chart {
	position: relative;
	display: inline-block;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	transition: 0.3s;
}

span.center {
	background: #fff;
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 70px;
	height: 70px;
	border-radius: 50%;
	text-align: center;
	line-height: 100px;
	font-size: 15px;
	transform: translate(-50%, -50%);
}
</style>


<section class="mt-2 text-xl px-4 flex justify-around">
	<div class="overflow-x-auto flex-grow">
		<table class="table-box-1" border="1">
			<thead>
				<tr>
					<th>건물명</th>
					<th>세대수</th>
					<th>보증금 합계</th>
					<th>월세 합계</th>
					<th>관리비 합계</th>
					<th>수익률(연)</th>
					<th>입주율</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="dashboard" items="${dashboard }">
					<tr style="${dashboard.bldgId == param.bldgId ? 'background-color: #ff8c00' : '' }">
						<td>${dashboard.bldgName }</td>
						<td>${dashboard.roomTotal }</td>
						<td>${dashboard.depositSum }</td>
						<td>${dashboard.rentSum }</td>
						<td>${dashboard.maintenanceFeeSum }</td>
						<td>#</td>
						<td>#</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>

	</div>

	<div class="pie-chart pie-chart1 mr-10">
		<span class="center">입주율${occupancyRate}%</span>
	</div>
	<div class="pie-chart pie-chart2 mr-10">
		<span class="center">수익율</span>
	</div>
	<div class="bg-yellow-400 mr-20">
		날씨 부분
		<i class="fa-solid fa-sun"></i>
	</div>

</section>

<br />


<section class="mt-2 text-xl px-4">
	<!-- 건물 카테고리 버튼 -->
	<div>
		<c:forEach var="building" items="${buildings }">
			<a class="btn btn-sm btn-outline ${building.id == param.bldgId ? 'btn-active' : '' }"
				href="../dashboard/dashboard?bldgId=${building.id }"
			>${building.bldgName }</a>
		</c:forEach>

	</div>

	<!-- 대쉬보드 표 -->
	<div class="badge badge-outline">${roomsCnt }개</div>
	<table class="table-box-1" border="1">
		<thead>
			<tr>
				<th>호실</th>
				<th>호실형태</th>
				<th>면적(m2)</th>
				<th>세입자명</th>
				<th>현 보증금</th>
				<th>현 월세</th>
				<th>현 관리비</th>
				<!-- 				<th>비품(여기에도 나타낼지 고민)</th> -->
				<th>호실메모</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach var="room" items="${rooms }">
				<tr class="hover">
					<td>${room.roomNum }</td>
					<td>${room.roomType }</td>
					<td>${room.roomArea }</td>
					<td>${room.tenantName }</td>
					<td>${room.deposit }</td>
					<td>${room.rent }</td>
					<td>${room.maintenanceFee }</td>
					<!-- 					<td> -->
					<!-- 						<input class="input input-bordered input-sm max-w-xs w-10" value="1" /> -->
					<!-- 						2 -->
					<!-- 						<input type="checkbox" class="toggle toggle-sm" checked /> -->
					<!-- 						3 -->
					<!-- 						<input type="checkbox" checked="checked" class="checkbox checkbox-sm checkbox-primary" /> -->
					<!-- 						4 -->
					<!-- 						<div class="rating rating-xs"> -->
					<!-- 							<input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" checked /> -->
					<!-- 						</div> -->
					<!-- 					</td> -->
					<td>#</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>


<%@ include file="../../common/foot.jspf"%>