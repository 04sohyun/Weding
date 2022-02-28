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
	.tdboardtitle{
	width:80px;
	}
	
    .container{
        text-align: center;
        width: 700px;
    }
        
    img{
        height: 50px;
    }
       
    table{
        margin:auto;
    }

    textarea{
        resize: both;
        width : 500px;
        height : 200px;
    }
	
	
   

   
   
</style>
</head>


<body>
    <div class="container">
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
    	
    	
		<div class="container_sub">
		 <form action="write" method ="post" enctype="multipart/form-data">
		 	<input type="hidden" name="main_cat" value="${board.main_cat}">
			<input type="hidden" name="mini_cat" value="${board.mini_cat}">
			<input type="hidden" name="p_num" value="${board.p_num}">
	
		
		
         
            <table class="tableboardwriteform">
            	<c:if test="${board.mini_cat == 200}">	
		            <tr>
		            	<td class="tdboardtitle" style="padding-bottom:1rem">
		            		글카테고리
		            	</td>
		            	<td>
			            		
								<select name="b_category" class="form-select" style="width:16rem;height:34px;margin-bottom:1rem">
									<option value="상품문의">상품문의</option>
									<option value="펀딩문의">펀딩문의</option>
								</select>
							
		            	</td>
		            </tr>
	            </c:if>	
                <tr><td class="tdboardtitle">제목</td><td><a><input name="b_title" class="form-control" type="text" required style="margin-bottom: 10px; width: 500px;"></a></td></tr>
                <tr><td class="tdboardtitle">내용</td><td><a><textarea class="form-control" name="b_content" rows="10" cols="20" required style="margin-bottom: 10px; resize: none;"></textarea></a></td></tr>
                
                <tr><td class="tdboardtitle">이미지</td><td><a><input type="file" class="btn btn-secondary" name="file1"></a></td></tr>
				<tr><th><td>
				<div style="float: right">
				
				<button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록</button>
				<input type="submit" value="등록" class="btn btn-outline-success">
				</div></td></tr>
            </table>
        
          </form> 
		</div>
	</div>
	
<%@ include file="../footer.jsp" %>
</body>
</html>
				