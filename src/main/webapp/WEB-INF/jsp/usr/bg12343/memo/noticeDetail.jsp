<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="NOTICE"></c:set>
<%@ include file="../../common/head.jspf"%>
<%@ include file="../../common/sidebar.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-detail" border="1">
			<tbody>
				<tr>
					<th>게시판</th>
					<td>${notice.memoCode }</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>${notice.id }</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${notice.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${notice.updateDate }</td>
				</tr>
				<tr>
				<tr>
					<!-- 아직 회원 데이터 조인 안함 -->
					<th>작성자</th>
					<td>${notice.memberName }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${notice.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${notice.body }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<br />
	사진파일 첨부하는 공간->
	<input type="file" class="file-input file-input-bordered file-input-primary w-full max-w-xs" />

	<div class="btns mt-5">
		<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		<a class="btn btn-outline" href="../memo/noticeModify">수정</a>
		<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="#">삭제</a>
	</div>
</section>


<%@ include file="../../common/foot.jspf"%>