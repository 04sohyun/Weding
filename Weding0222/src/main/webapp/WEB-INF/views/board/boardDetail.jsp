<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
console.log('${board}');
</script>
<meta charset="UTF-8">
<title>게시판 조회</title>
<%@ include file="../header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
    .container{
        text-align: center;
        width: 700px;
        height: 800px;
    }
    .but{
        float: right;
        padding: 30px;
    }

    .nickname{
        font-size: 10pt;
        text-align: center; 
        vertical-align: bottom;
    }
    textarea{
        resize: vertical;
        width: 678px;
    }
    img{
        width: 678px;
        height: 300px;
    }
</style>


<script>
	function 
</script>






</head>
<body>
	
	<div class="container"> 
		<div>
			<h3>${board.b_title}게시글 제목 &emsp;&emsp;&emsp; <a class="nickname">${board.id}</a>&ensp;<a class="nickname">${board.b_date}</a></h3>
		</div>
		<hr>
		<div>
			<img src="${board.b_image}"><!-- 이미지 출력 -->
		</div>
			<h4 style="text-align: left; margin-top: 10px;" >글 내용</h4>
		<div>
			<textarea rows="7" cols="82" readonly>${board.b_content}</textarea>
		</div>
		<div class="but">
			<button type="button" class="btn btn-outline-success" onclick="location.href = 'updateForm?b_num=${board.b_num}'" >수정</button>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href = 'boardList'">목록</button>
	
			<button class="btn btn-outline-danger" onclick="history.back()">취소</button>
			
			<button type="button" class="btn btn-outline-success" onclick="location.href = 'replyForm?b_num=${board.b_num}'" >답변</button>
			
			<form action="delete" method="post" onsubmit="return confirm('삭제하쉴?')">
				<input type="hidden" name="b_num" value="${board.b_num}">
				<input class="btn btn-outline-danger" type="submit" value="삭제">
			</form>
		</div>
	 </div>
			
	  
	 
<%@ include file="../footer.jsp" %>
</body>
</html>