<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTICLE DETAIL</title>
</head>
<body>


	<div>${checkId }</div>
	<div>${noArticle }</div>


	<div>번호: ${article.id }</div>
	<div>날짜: ${article.regDate.substring(0,10) }</div>
	<div>닉네임: ${article.memberName }</div>
	<div>제목: ${article.title }</div>
	<div>내용: ${article.body }</div>
	<hr />
	<a href="list">목록으로 돌아가기</a>


</body>
</html>

<%@ include file="../common/foot.jspf"%>