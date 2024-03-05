<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BUILDING DETAIL"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>

<script>
	var buildingAdd__submitDone = false;

	function buildingAdd__submit(form) {

		if (buildingAdd__submitDone) {
			alert('이미 처리중입니다');
			return;
		}

		// 숫자가 아닌 데이터 체크
		if (isNaN(form.roomTotal.value)) {
			alert('세대수에는 숫자만 입력 가능합니다');
			form.roomTotal.focus();
			return;
		}

		// 빈칸에 대한 유효성 검사 추가
		if (form.bldgName.value.length < 1) {
			alert('건물명을 입력해주세요');
			form.bldgName.focus();
			return;
		}

		if (form.bldgAdd.value.length < 1) {
			alert('건물주소를 입력해주세요');
			form.bldgAdd.focus();
			return;
		}
		if (form.roomTotal.value.length < 1) {
			alert('세대수를 입력해주세요');
			form.roomTotal.focus();
			return;
		}

		ReplyWrite__submitDone = true;
		form.submit();

	}
</script>


<section class="mt-8 mb-5 text-lg px-4">
	<div class="px-4  mt-36">
		<form action="/usr/bg12343/building/doBuildingSetupAdd" method="POST" onsubmit="buildingAdd__submit(this); return false;">
			<table class="write-box table-box-1 mx-auto" border="1">
				<tbody>
					<tr>
						<th>건물명</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="건물이름을 입력해주세요" name="bldgName" />
						</td>
					</tr>
					<tr>
						<th>건물주소</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="건물주소를 입력해주세요" name="bldgAdd" />
						</td>
					</tr>
					<tr>
						<th>세대수</th>
						<td>
							<input class="input input-bordered input-secondary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="세대수를 입력해주세요" name="roomTotal" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="완료" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>





<%@ include file="../../common/foot.jspf"%>