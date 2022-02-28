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
	.container{
        text-align: center;
        width: 700px;
    }
	
   .update-info tr td{
   	height: 50px;
   
   }
    textarea{
        resize: both;
    }
    
    .updateBtn{
   	 float:right;
     display:inline-block;
    }
  article {
    width: 700px;
    margin: 0 auto;
}
</style>
</head>
<body>
<!--  
<c:if test="update?main_cat=300&mini_cat=100">
<h1 style="text-align: center">공지사항</h1>
</c:if>
<c:if test="board?main_cat=300&mini_cat=200">
<h1 style="text-align: center">문의사항</h1>
</c:if>
<hr>
-->

	
    	
	<div class="continer">
		<!--글작성폼에 공지사항에서 쓰는지 문의사항에서 쓰는지 구분   -->
    	<div class = "sub-banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 300}">
    			<h1 class="sub-title">1:1 문의사항</h1>
    		</c:if>
    	</div>	
		<article>
			<form action="update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="b_num" value ="${board.b_num}">
				<input type="hidden" name="main_cat" value ="${board.main_cat}">
				<input type="hidden" name="mini_cat" value ="${board.mini_cat}">
				<input type="hidden" name="p_num" value="${board.p_num}">
				<table class = "table">
					<tr>
						<td style="border: none">
							제목
						</td>
						<td style="border: none">
							<input type="text" class="form-control" name="b_title" required value="${board.b_title}">
						</td>
					</tr>
					<tr>
						<td style="border: none">
							내용
						</td>
						<td style="border: none ">
							<textarea class="form-control" rows="10" name="b_content" cols="80" required style= "resize: none;">${board.b_content}</textarea>
						</td>
					</tr>
					<tr>
						<td style="border: none">
							이미지
						</td>
						<td style="border: none">
							<input type="file" class="btn btn-secondary" name="file1">
						</td>
						
					</tr>
				</table>
				<div class= "updateBtn">
				<%--
				<button type="button" class="btn btn-outline-secondary" onclick="boardList">목록</button>
				 --%>
				<button class="btn btn-outline-danger" onclick="history.back()">취소</button>
				<input type="submit" value="수정" class="btn btn-outline-success" >
				</div>
			</form>
		</article>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>