<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> replyForm</h1>




	<form action="reply" method="post">
		<input type="hidden" name="main_cat" value="${board.main_cat}">
		<input type="hidden" name="mini_cat" value="${board.mini_cat}">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" name="b_hit" value="${board.b_hit}">
		
		<input type="hidden" name="b_group" value="${board.b_group}">
		
		<input type="hidden" name="b_step" value="${board.b_step}">
		<input type="hidden" name="b_level" value="${board.b_level}">



	   <table width="1000"  border="1">
			<tr>
				<td> 번호 </td>
				<td> ${board.b_num} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${board.b_hit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="id" value="${board.id}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="b_title" value="RE:" + "${board.b_title}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10"  name="b_content">${board.b_content}</textarea></td>
			</tr>
			<tr >
				<td colspan="2">
				<input type="submit" value="답변저장"> 
				<a href="boardlist" >목록</a></td>
			</tr>
	   </table>
	</form>
	
</body>
</html>