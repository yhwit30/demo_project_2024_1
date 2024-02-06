<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${articlesCount }개</div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 60%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="article" items="${articles }">
					<tr class="hover">
						<td>${article.id }</td>
						<td>${article.regDate.substring(0,10) }</td>
						<td>
							<a href="detail?id=${article.id }">${article.title }</a>
						</td>
						<td>${article.extra__writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div>
		<form action="POST" action="list">
			<tr>
				<td>
					<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
						placeholder="내용을 입력해주세요" name="searchKeyword" value="${article.body }"
					/>
				</td>
			</tr>
			<th></th>
			<td>
				<input class="btn btn-info" type="submit" value="검색" />
			</td>
		</form>
	</div>



	<!-- 버전2 동적 페이징-->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page - paginationLen >= 1 ? page - paginationLen : 1 }" />
		<c:set var="endPage" value="${page + paginationLen <= totalPage ? page + paginationLen : totalPage }" />

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="?page=1%boardId=${boardId }">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage}" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?boardId=${boardId }&page=${i }">${i }</a>
		</c:forEach>


		<c:if test="${endPage < totalPage }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="?page=1%boardId=${boardId }">${totalPage }</a>
		</c:if>

	</div>

	<!-- 버전1  -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">

			<a href="list??boardId=${param.boardId }&page=1">맨앞</a>

			<c:if test="${param.page > pageSize }">
				<a href="list??boardId=${param.boardId }&page=${from - 1}">◀</a>
			</c:if>

			<c:forEach begin="${from }" end="${end}" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?boardId=${param.boardId }&page=${i }">${i }</a>
			</c:forEach>

			<c:if test="${end < totalPage }">
				<a href="list??boardId=${param.boardId }&page=${from + pageSize}">▶</a>
			</c:if>

			<a href="list??boardId=${param.boardId }&page=${totalPage}">맨뒤</a>




		</div>
	</div>

</section>










<%@ include file="../common/foot.jspf"%>