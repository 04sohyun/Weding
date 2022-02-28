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
     .write-btn{
     	float:right;
     	display:inline-block;
     }
     .board-page{
     	margin-top:50px;
     	
     	text-align:center;
     }
     
      .list-banner tr th{
     	text-align: center;
     
     }
     .paging {
		width: fit-content;
		margin: 0 auto;
	 } 
 </style>
 
 
 <script> 
  function writeForm() {
	  const main_cat = ${board.main_cat};
	  const mini_cat = ${board.mini_cat};
	  let p_num = "<c:out value='${board.p_num}'/>";
	  console.log(p_num);
	  
	  if (p_num.length !=0 ) {
		  location.href='writeForm?main_cat='+main_cat+'&mini_cat='+mini_cat+'&p_num='+p_num;
	  } else {
		  location.href='writeForm?main_cat='+main_cat+'&mini_cat='+mini_cat;
	  }
	 
   }
 </script>
 
 
</head>
<body>
<div class="container">
 
		<div class="sub-banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    			<c:if test="${board.mini_cat == 300}">
    			<h1 class="sub-title">1:1 문의사항</h1>
    		
    		<%--
    			<h2>"${product.p_name}"</h2>
    		 --%>
    		
    		</c:if>
    	</div>	


<table class = "table list-banner">
	<tr style="--bs-table-bg: #2F3A8F;color:#fff;"><th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th></tr>  <!--  번호와 제목 사이. c:if...  p_name.. th /th. -->
<c:forEach var="board" items="${listBoard}" varStatus="status">
	<tr id="board${status.index}">
		<td style="text-align: center;">${board.b_num}</td>
		<td>
		<c:forEach begin="1" end = "${board.b_level}">
		-
		</c:forEach>
		<a href="boardDetail?b_num=${board.b_num}" style="text-align: left;">${board.b_title}</a>
		</td>
			<td style="text-align: center;">${board.id}</td>
			<td style="text-align: center;">${board.b_date}</td>
			<td style="text-align: center;">${board.b_hit}</td>
	</tr>
	
</c:forEach>
 		
</table><br>

	<div class="row">	
	<div class="col-3"></div>
	<div class="col-6">
	      <form action="getSearchBoard" method="get" style="text-align: center;">
	      	  <input type="hidden" name="main_cat" value="${board.main_cat}">
	      	  <input type="hidden" name="mini_cat" value="${board.mini_cat}">
	          <input name="keyword" class="form-control" style="width:30%;display:inline" type="text" value="" placeholder="검색">
	          <input type="submit" class="btn btn-outline-primary" style="width:5rem;height:34px;" value="검색">
	      </form>
	</div>  
	 <div class="col-3">    
	    	<div class = "write-btn" style="text-align: center;">
			<c:choose>
	        	 <c:when test="${board.mini_cat == 100 && member.mini_cat == 300}">
	            		<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
	         	</c:when>
	         	<c:when test="${board.mini_cat == 200 && (member.mini_cat == 100 || member.mini_cat == 200)}">
		           		<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
		        </c:when>
		        <c:when test="${board.mini_cat == 300 && (member.mini_cat == 100 || member.mini_cat == 200)}">
		             	<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
	         	</c:when>
			</c:choose>
	  	    </div>  
	</div> 	    
	</div>      
		
		<nav aria-label="..." class="paging" style="width: fit-content;">
			  <ul class="pagination">
			  	<c:if test="${pg.startPage > pg.pageBlock}">
				    <li class="page-item">
				      <a class="page-link" href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage - pg.pageBlock}">&laquo;</a>
				    </li>
			    </c:if>
			    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
				    <li class="page-item">
				    		<a class="page-link" href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${i}">${i}</a>
		    		</li>
		   		</c:forEach>
		   		<c:if test="${pg.endPage < pg.totalPage}">
				    <li class="page-item">
				      <a class="page-link" href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>