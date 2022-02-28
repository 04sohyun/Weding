<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	console.log('${board}');
</script>
<meta charset="UTF-8">
<title>게시판 답글</title>
<%@ include file="../header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
	.reply-banner{
		margin-left: calc(-50vw + 50%);
		width:100vw;
		height:100px;
		background-color: #ccc;
		margin-bottom: 3.5rem;
		text-align: center;
	}	
	.reply-banner h1{
	  line-height: 100px;
	
	}
	container{
        text-align: center;
        width: 1200px;
        
    }
	.reply-info{
		margin: 0 auto;
		width: 700px;
		height: 20px;
	
	}
	.reply-btn{
	margin-top: 3.5rem;	
	width: 1000px;	
	height: 3rem;
	
	
	}
	.reply-btn button{
		display : block;
		float: right;
	}	
	
		
		
		


</style>

<body>
	<div class="container">
		<div class = "sub-banner">
   			<h1 class="sub-title">답변 작성</h1>
    	</div>



	<form action="reply" method="post">
		<input type="hidden" name="main_cat" value="${board.main_cat}">
		<input type="hidden" name="mini_cat" value="${board.mini_cat}">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" name="b_hit" value="${board.b_hit}">
		
		<input type="hidden" name="b_group" value="${board.b_group}">
		
		<input type="hidden" name="b_step" value="${board.b_step}">
		<input type="hidden" name="b_level" value="${board.b_level}">

			<input type="hidden" name="p_num" value="${board.p_num}">

	   <table class="reply-info" style=" border-spacing: 1rem; border-collapse: separate;">
			<tr>
				<td> 번호 </td>
				<td> ${board.b_num} </td>
			</tr>
			<%--
			<tr>
				<td> 히트 </td>
				<td> ${board.b_hit} </td>
			</tr>
			 --%>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" class="form-control" name="id" readonly value="${member.id}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" class="form-control" name="b_title" required value="RE: ${board.b_title}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea class="form-control" rows="10" cols="20" style="margin-bottom: 10px; resize: none"  name="b_content" required>${board.b_content}</textarea></td>
			</tr>
			
				
			
	   </table>
	   		<div class = "reply-btn">
	   			<button class="btn btn-outline-danger" onclick="history back()">취소</button>
	   			<button class="btn btn-outline-success">등록</button>
				
			</div>	
	</form>
  </div>	
  <%@ include file="../footer.jsp" %>
</body>
</html>