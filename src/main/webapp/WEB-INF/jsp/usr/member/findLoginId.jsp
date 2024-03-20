<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<script type="text/javascript">
	let MemberFindLoginId__submitFormDone = false;
	function MemberFindLoginId__submit(form) {
		if (MemberFindLoginId__submitFormDone) {
			return;
		}
		form.name.value = form.name.value.trim();
		form.email.value = form.email.value.trim();
		if (form.name.value.length == 0) {
			alert('이름 써라');
			form.name.focus();
			return;
		}
		if (form.email.value.length == 0) {
			alert('email 써라');
			form.email.focus();
			return;
		}
		MemberFindLoginId__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doFindLoginId" method="POST" onsubmit="MemberFindLoginId__submit(this);">
			<input type="hidden" name="afterFindLoginIdUri" value="${param.afterFindLoginIdUri }" />
			<table class="login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>이름</th>
						<td>
							<input class="input input-bordered w-full max-w-xs" autocomplete="off" type="text" placeholder="이름을 입력해주세요"
								name="name" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input class="input input-bordered w-full max-w-xs" autocomplete="off" type="text" placeholder="이메일을 입력해주세요"
								name="email" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button type="submit">아이디 찾기</button>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<a class="btn btn-active btn-ghost" href="../member/login">로그인</a>
							<a class="btn btn-ghost btn-active" href="${rq.findLoginPwUri }">비밀번호찾기</a>
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



<%@ include file="../common/foot.jspf"%>