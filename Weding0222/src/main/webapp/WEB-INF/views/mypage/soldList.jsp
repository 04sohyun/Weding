<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.menu1{width:300px; border:1px solid red; float:left;}
.content1{width:500px; border:1px solid green; float:left;}
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="menu1">
	<p>${member.name}님</p>
	<a href="#">1:1문의 답변</a>
	<a href="#">판매자 상품관리</a>
</div>
<div class="content1">	
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<table>
		<tr><th>상품번호</th><th>상품이름</th><th>카테고리</th><th>펀딩기간</th><th>상품가격</th><th>목표금액</th><th>달성율</th></tr>
		<c:forEach var="soldList" items="${soldList}">
			<tr><td>${soldList.p_num}</td>
			<td>${soldList.p_image1}<a href="fundingDetail?p_num=${soldList.p_num}">${soldList.p_name}</a></td>
			<td>${soldList.mini_cat}</td>
			<td>${soldList.p_start}~${soldList.p_end}</td>
			<td>${soldList.p_price}</td>
			<td>${soldList.p_goalprice}</td>
			<td>${soldList.p_currentprice}/${soldList.p_goalprice}*100</td></tr><!-- 이거 고쳐야될듯 -->
			<c:set var="num" value="#{num-1}"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="list?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="list?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="list?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
	</c:if>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>