<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<style>
.side-menu {
	width: 100%;
	padding: 0;
	margin: 0;
	text-align: center;
}

.side-menu ul {
	margin: 0;
	padding: 0;
	display: inline;
	font-size: 12px;
	text-align: left;
}

.side-menu ul li {
	list-style-type: none;
	margin-bottom: 10px;
}

.side-menu ul li strong {
	color: #2F3A8F;
	font-size: 1.2em;
}

.side-menu ul li:first-child {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 30px;
}

a:link {
	text-decoration: none;
	color: black;
}

a:hover {
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<div class="side-menu col-md-2">
		<!-- 소비자일 경우 -->
		<c:if test="${member.mini_cat == 100}">
			<ul>
				<!-- 현재 접속한 회원의 이름 -->
				<li><strong>${member.name}</strong>님</li>
				<li><a href="<c:url value='dibsList'/>">찜목록</a></li>
				<li><a href="<c:url value='payList'/>">펀딩내역</a></li>
				<li><a
					href="<c:url value='sellerQna?main_cat=300&mini_cat=200'/>">Q&A문의내역</a></li>
				<li><a
					href="<c:url value='qnaList?main_cat=300&mini_cat=300'/>">1:1문의내역</a></li>
				<li><a href="<c:url value='memberUpdateForm'/>">회원수정</a></li>
				<li><a href="<c:url value='pwChangeForm'/>">비밀번호변경</a></li>
			</ul>
		</c:if>

		<!-- 판매자일 경우 -->
		<c:if test="${member.mini_cat == 200}">
			<ul>
				<!-- 현재 접속한 회원의 이름 -->
				<li><strong>${member.name}</strong>님</li>
				<li><a href="<c:url value='dibsList'/>">찜목록</a></li>
				<li><a href="<c:url value='payList'/>">펀딩내역</a></li>
				<li><a href="<c:url value='memberUpdateForm'/>">회원수정</a></li>
				<li><a href="<c:url value='pwChangeForm'/>">비밀번호변경</a></li>
				<li><a
					href="<c:url value='sellerQna?main_cat=300&mini_cat=200'/>">Q&A문의내역</a></li>
				<li><a
					href="<c:url value='qnaList?main_cat=300&mini_cat=300'/>">1:1문의답변</a></li>
				<li><a href="<c:url value='soldList'/>">판매자상품관리</a></li>
			</ul>
		</c:if>

		<!-- 관리자일 경우 -->
		<c:if test="${member.mini_cat == 300}">
			<ul>
				<!-- 현재 접속한 회원의 이름 -->
				<li><strong>${member.name}</strong>님</li>
				<li><a href="<c:url value='allMemberList?id=${member.id}'/>">회원관리</a></li>
				<li><a
					href="<c:url value='qnaBoardList'/>">문의사항답변</a></li>
				<li><a href="<c:url value='allProductList'/>">관리자상품관리</a></li>
			</ul>
		</c:if>
	</div>
</body>
</html>
</body>
</html>