<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPAIR DETAIL"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-detail" border="1">
			<tbody>
				<tr>
					<th>게시판</th>
					<td>${memoRepairRd.boardId }</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>${memoRepairRd.id }</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${memoRepairRd.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${memoRepairRd.updateDate }</td>
				</tr>
				<tr>
					<th>작업날짜</th>
					<td>${memoRepairRd.memoDate }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${memoRepairRd.memberId }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${memoRepairRd.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${memoRepairRd.body }</td>
				</tr>
				<tr>
					<th>작업비용</th>
					<td>${memoRepairRd.cost }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<br />
	사진파일 첨부하는 공간->
	<input type="file" class="file-input file-input-bordered file-input-primary w-full max-w-xs" />

	<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../memo/repairModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
</section>





<%@ include file="../../common/foot.jspf"%>