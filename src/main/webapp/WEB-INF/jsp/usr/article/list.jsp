<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-lg px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>작성자</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles }">
					<tr>
						<td>${article.id }</td>
						<td>${article.regDate.substring(0,10) }</td>
						<td>
							<a href ="detail?id=${article.id }" class="hover:underline">${article.title }</a>
						</td>
						<td>${article.memberName }</td>
						<td>
							<a href="#" class="hover:underline">수정</a>
						</td>
						<td>
							<a href="#" class="hover:underline">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>