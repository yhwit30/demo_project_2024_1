<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Article MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>



<section class="mt-8 mb-5 text-lg px-4">
	<div class="mx-auto">
		<form action="../article/doModify" method="POST">
			<input type="hidden" value="${article.id }" name="id" />
			<table class="modify-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.updateDate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.extra__writer }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input autocomplete="off" type="text" value="${article.title }" name="title" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<input autocomplete="off" type="text" value="${article.body }" name="body" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input type="submit" value="수정" />
						</td>
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