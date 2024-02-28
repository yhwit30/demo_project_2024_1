<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPAIR DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/sidebar.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">

		<table class="table-box-1  mx-auto" border="1">
			<tbody>
				<tr>
					<th>게시판</th>
					<td>${article.board_code }</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>${article.id }${goodRP}${badRP}</td>
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
					<th>좋아요</th>
					<td id="likeCount">${article.goodReactionPoint }</td>
				</tr>
				<tr>
					<th>싫어요</th>
					<td id="DislikeCount">${article.badReactionPoint }</td>
				</tr>
				<tr>
					<th>추천</th>
					<td>
						<!-- href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.currentUri}" -->
						<button id="likeButton" class="btn btn-outline btn-success" onclick="doGoodReaction(${param.id})">좋아요</button>

						<button id="DislikeButton" class="btn btn-outline btn-error" onclick="doBadReaction(${param.id})">싫어요</button>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						<span class="article-detail__hit-count">${article.hitCount }</span>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.body }</td>
				</tr>

			</tbody>
		</table>
		<div class="btns mt-5">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../bg12343/repairModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
	</div>
</section>





<%@ include file="../common/foot.jspf"%>