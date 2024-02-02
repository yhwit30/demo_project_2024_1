<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
	<form action="../member/doLogin" method="POST">
			<table class="login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input autocomplete="off" type="text" placeholder="아이디를 입력해주세요" name="loginId" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요" name="loginPw" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="로그인" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>


<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>