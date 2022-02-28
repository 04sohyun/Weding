<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<title>allProductUpdate</title>
</head>

<body>
	<div class="container">
		<div class="p-3 mb-2 bg-secondary text-white">
			<div class="row">
				<div class="col" style="text-align: center;">상품수정</div>
			</div>

		</div>

		<div class="row">

			<div class="col-2">
				<div class="row">
					<div class="col">관리자님</div>
				</div>
				<div class="row">
					<div class="col">회원관리</div>
				</div>
				<div class="row">
					<div class="col">공지사항</div>
				</div>
				<div class="row">
					<div class="col">QnA 답변</div>
				</div>
				<div class="row">
					<div class="col">관리자 상품관리</div>
				</div>
			</div>

			<div class="col-10">
				<table width="800" style="text-align: center;">
					<tr>
						<td>상품번호</td>
						<td>상품이름</td>
						<td>판매자</td>
						<td>카테고리</td>
						<td>펀딩기간</td>
						<td>상품가격</td>
						<td>달성율</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2021-01-23</td>
						<td>상품이름</td>
						<td>50,000원</td>
						<td>펀딩중</td>
						<td>2022-07-23</td>
						<td>상품준비중</td>
						<td><button type="button" class="btn btn-light">수정</button></td>
						<td><button type="button" class="btn btn-light">삭제</button></td>
					</tr>
					<tr>
						<td>1</td>
						<td>2021-01-23</td>
						<td>상품이름</td>
						<td>50,000원</td>
						<td>펀딩중</td>
						<td>2022-07-23</td>
						<td>상품준비중</td>
						<td><button type="button" class="btn btn-light">수정</button></td>
						<td><button type="button" class="btn btn-light">삭제</button></td>
					</tr>
					<tr>
						<td>1</td>
						<td>2021-01-23</td>
						<td>상품이름</td>
						<td>50,000원</td>
						<td>펀딩중</td>
						<td>2022-07-23</td>
						<td>상품준비중</td>
						<td>삭제</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2021-01-23</td>
						<td>상품이름</td>
						<td>50,000원</td>
						<td>펀딩중</td>
						<td>2022-07-23</td>
						<td>상품준비중</td>
						<td>삭제</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2021-01-23</td>
						<td>상품이름</td>
						<td>50,000원</td>
						<td>펀딩중</td>
						<td>2022-07-23</td>
						<td>상품준비중</td>
						<td>삭제</td>
					</tr>
				</table>
			</div>








			<!-- JavaScript Bundle with Popper -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
</body>




</html>

<%@ include file="../footer.jsp"%>