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
					<th>조회수</th>
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
						<td>${article.hit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div>
		<form action="../article/list" method="GET">
			<input type="hidden" name="page" value="${page }" />
			<input type="hidden" name="boardId" value="${boardId }" />

			<select class="select select-primary w-s max-w-xs" name="searchKeywordTypeCode">
				<option value="title">제목</option>
				<option value="extra__writer">작성자</option>
				<option value="body">내용</option>
			</select>

			<table class="search-box table-box-1" border="1">
				<tbody>
					<tr>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="내용을 입력해주세요" name="searchKeyword"
							/>
						</td>
						<td>
							<input class="btn btn-info" type="submit" value="검색" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>



	<!-- 버전2 동적 페이징-->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage"
			value="${page +  paginationLen  <= pagination.totalPage ? page + paginationLen : pagination.totalPage}"
		/>

		<c:set var="baseUri" value="?boardId=${boardId}"/>
		<c:set var="baseUri" value="${baseUri}&searchKeywordTypeCode=${param.searchKeywordTypeCode}"/>
		<c:set var="baseUri" value="${baseUri}&searchKeyword=${param.searchKeyword}"/>

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="?page=1&${baseUri}">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${page == i ? 'btn-active' : '' }" href="?page=${i }&${baseUri}">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagination.totalPage }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="?page=1&${baseUri}">${pagination.totalPage }</a>
		</c:if>

	</div>

	<!-- 버전1  -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">

			<a href="list??boardId=${boardId }&page=1">맨앞</a>
			<c:if test="${page > pagination.pageSize }">
				<a href="list?boardId=${boardId }&page=${pagination.from - 1}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">◀</a>
			</c:if>

			<c:forEach begin="${pagination.from }" end="${pagination.end}" var="i">
				<a class="btn btn-sm ${page == i ? 'btn-active' : '' }" href="?boardId=${boardId }&page=${i }&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">${i }</a>
			</c:forEach>

			<c:if test="${pagination.end < pagination.totalPage }">
				<a href="list?boardId=${boardId }&page=${pagination.from + pagination.pageSize}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">▶</a>
			</c:if>
			<a href="list?boardId=${boardId }&page=${pagination.totalPage}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">맨뒤</a>

		</div>
	</div>

</section>










<%@ include file="../common/foot.jspf"%>