<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
	<script type="text/javascript">
		var LoginForm_submitDone = false;
		
		function LoginForm_submit(form) {
			//요청처리
			if (LoginForm_submitDone) {
				alert('이미 처리중입니다');
				return;
			}
			//
			var loginId = form.loginId.value.trim();
			var loginPw = form.loginPw.value.trim();

			console.log("form.loginId.value :" + loginId);
			console.log("form.loginPw.value :" + loginPw);
		

			if (loginId.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			if (loginPw.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
	
// 			if (loginPw != loginPwConfirm) {
// 				alert('비밀번호가 일치하지 않습니다.');
// 				form.loginPw.focus();
// 				return;
// 			}

			LoginForm_submitDone = true;
			form.submit();

		}
	</script>


<form method="post" action="login"
		onsubmit="LoginForm_submit(this); return false;">
		<div>
			아이디 : <input autocomplete="off" type="text" placeholder="아이디 입력"
				name="loginId" />
		</div>
		<div>
			비밀번호 : <input autocomplete="off" type="text" placeholder="비밀번호 입력"
				name="loginPw" />
		</div>
		<button type="submit">로그인</button>
	</form>
	
	</div>
</section>


<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>