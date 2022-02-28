<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>1:1 문의내역</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->

<style>
body {
	text-align: center;
}

table {
	width: 100%;
	border-top: 1px solid gray;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid gray;
	padding: 10px;
}

button {
	float: right;
}

a:link {
	color: black;
	text-decoration: none;
}

.paging {
	width: fit-content;
	margin: 0 auto;
} 
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function reply() {
		let b_num = $('#b_num').val();
		console.log(b_num);
		
		$.ajax({
			url: "<%=request.getContextPath()%>
	/replyCount",
			data : {
				b_num : b_num
			},
			success : function(data) {
				console.log("data" + data);
				$('#replyCount').attr("value", data);
			}
		});
	}
</script>
<body>
	<%@include file="../header.jsp"%>
	<div class="container">
		<div class="sub-banner">
			<h2 class="sub-title">
				<c:choose>
					<c:when test="${member.mini_cat == 100}">
						1:1 문의내역
					</c:when>
					<c:otherwise>
						1:1 문의답변
					</c:otherwise>
				</c:choose>

			</h2>
		</div>
		<div class="row">
			<%@include file="menu.jsp"%>
			<div class="col-10">
				<table class="table" style="text-align: center;">
					<tr style="--bs-table-bg: #2F3A8F;color:#fff;">
						<th>번호</th>
						<th>상품명</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>답변여부</th>
					</tr>
					<c:forEach var="board" items="${qnaList}">
						<tr>
							<td>${board.b_num}</td>
							<td style="text-align: left;">${board.p_name}</td>
							<td style="text-align: left;"><a href="boardDetail?b_num=${board.b_num}">${board.b_title}</a></td>
							<td>${board.b_date}</td>
							<td>${board.b_hit}</td>
							<td>${board.answer}</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<nav aria-label="..." class="paging">
				  <ul class="pagination">
				  	<c:if test="${pg.startPage > pg.pageBlock}">
					    <li class="page-item">
					      <a class="page-link" onclick="location.href='qnaList?currentPage=${pg.startPage - pg.pageBlock}'">&laquo;</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					    <li class="page-item">
					    		<a class="page-link" href="qnaList?currentPage=${i}">${i}</a>
			    		</li>
		    		</c:forEach>
		    		<c:if test="${pg.endPage < pg.totalPage}">
					    <li class="page-item">
					      <a class="page-link" href="qnaList?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>