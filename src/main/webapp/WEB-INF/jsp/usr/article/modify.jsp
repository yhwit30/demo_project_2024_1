<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Article MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-lg px-4">
	<div class="mx-auto">

	
	<div>
		번호 :
		${article.id }</div>
	<div>
		날짜 :
		${article.regDate }
	</div>
<%-- 		<input type="hidden" value="<%=loginedMemberId%>" name="loginedMemberId" />  --%>
<%-- 		<input type="hidden" value="<%=articleRow.get("id")%>" name="id" />  --%>
		<div>
			제목 : <input type="text" name="title"	value="${article.title }" />
		</div>
		<div>
			내용 :
			<textarea type="text" name="body"> ${article.body }</textarea>
		</div>
		<br />
		<input type="button" value="수정">
	</form>
	
	
	


	</div>
</section>



<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>