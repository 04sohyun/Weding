<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
console.log('${board}');
</script>

<meta charset="UTF-8">
<title>게시판 수정</title>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<style>
    table{
        margin:auto; 
    }
    textarea{
        resize: both;
    }
</style>
</head>
<body>
<c:if test="update?main_cat=300&mini_cat=100">
<h1 style="text-align: center">공지사항</h1>
</c:if>
<c:if test="board?main_cat=300&mini_cat=200">
<h1 style="text-align: center">문의사항</h1>
</c:if>
<hr>
	<div class="continer">
		<div align="center">
			<form action="update" method="post">
				<input type="hidden" name="b_num" value ="${board.b_num}">
				<input type="hidden" name="main_cat" value ="${board.main_cat}">
				<input type="hidden" name="mini_cat" value ="${board.mini_cat}">
				<table>
				<tr><th>
				<div>제목<input type="text" name="b_title" value="${board.b_title}"></div></th></tr>
				<tr><th>
				<div>내용 <textarea rows="5" name="b_content" cols="80">${board.b_content}</textarea></div></th></tr>
				<tr><th>
				<div>이미지 <input type="file"></div></th></tr>
				<tr><th>
				<div style="float: right">
				<button type="button" class="btn btn-outline-secondary" onclick="boardList">목록</button>
				<button class="btn btn-outline-danger" onclick="history.back()">취소</button>
				<input type="submit" value="수정" class="btn btn-outline-success" >
				</div></th></tr>
				</table>
			</form>
		</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>