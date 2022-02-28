<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
console.log('${listBoard}');
</script>
<meta charset="UTF-8">
<title>boardList</title>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

 <style>
     body{text-align: center;}

     table {
     margin: auto;
     width: 80%;
     border-top: 1px solid gray;
     border-collapse: collapse;
     }

     th, td {
         border-bottom: 1px solid gray;
         padding: 10px;
     }
     button{
      float: right;
  }

     a:link{
         color: black;
         text-decoration: none;
     }
 </style>
 
 
 <script> 
  function writeForm() {
	  const main_cat = ${board.main_cat};
	  const mini_cat = ${board.mini_cat};
	  location.href='writeForm?main_cat='+main_cat+'&mini_cat='+mini_cat;
   }
 </script>
 
 
</head>
<body>
<div class="container">
<br>

<hr>
<table>
	<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th></tr>
<c:forEach var="board" items="${listBoard}" varStatus="status">
	<tr id="board${status.index}">
		<td>${board.b_num}</td>
		<td>
		<c:forEach begin="1" end = "${board.b_level}">
		-
		</c:forEach>
		<a href="boardDetail?b_num=${board.b_num}">${board.b_title}</a>
		</td>
			<td>${board.id}</td>
		<td>${board.b_date}</td>
		<td>${board.b_hit}</td>
	</tr>
	
</c:forEach>
</table><br>
			<div align="left">
   <table>
     <tr>
      <td width="100%" align="left">&nbsp;&nbsp;
      <form action="getSearchBoard" method="get">
          <input name="keyword" type="text" value="">
          <input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
      </form>    
      </td>
      <td width="100%" align="right">
     <button class="btn btn-outline-primary" onclick="writeForm()">글작성</button>
      </td>
     </tr>
   </table>
   </div>	
		 <button class="btn btn-outline-primary" onclick="writeForm()">글작성</button><br>
		
        <div style="text-align:center">
        <c:if test="${pg.startPage > pg.pageBlock}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${pg.endPage < pg.totalPage}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
        </c:if>
        </div>
        
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>