<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
		<div>join page</div>
		<form action="../member/doLogin" method="POST">
			<div>
				아이디 :
				<input autocomplete="off" type="text" placeholder="아이디 입력" name="loginId" />
			</div>
			<div>
				비밀번호 :
				<input autocomplete="off" type="text" placeholder="비밀번호 입력" name="loginPw" />
			</div>
			<div>
				비밀번호 확인 :
				<input autocomplete="off" type="text" placeholder="비밀번호 확인 입력" name="loginPwConfirm" />
			</div>
			<div>
				이름 :
				<input autocomplete="off" type="text" placeholder="이름 입력" name="name" />
			</div>
			<button type="submit">회원가입</button>
		</form>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>