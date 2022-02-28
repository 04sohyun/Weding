<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<%@ include file="../header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
    <div class="container">
		<div class="container_sub">
		 <form action="write" method ="post">
		 	<input type="hidden" name="main_cat" value="${board.main_cat}">
			<input type="hidden" name="mini_cat" value="${board.mini_cat}">
			
		<input type="text" name="id" value="${board.id}">
			
			<input type="hidden" name="b_category" value="">
			<!-- 카테고리 셀렉트 -->
		
         
            <table>
                <tr><td>제목</td><td><a><input name="b_title" type="text" ></a></td></tr>
                <tr><td>내용</td><td><a><textarea name="b_content" rows="4" cols="20"></textarea></a></td></tr>
                <tr><td>이미지</td><td><a><input type="file" name="b_image"></a></td></tr>
				<tr><th><td>
				<div style="float: right">
				<button type="button" class="btn btn-outline-secondary" onclick="boardList">목록</button>
				<button class="btn btn-outline-danger" onclick="history.back()">취소</button>
				<input type="submit" value="등록" class="btn btn-outline-success">
				</div></td></tr>
            </table>
        
          </form> 
		</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>