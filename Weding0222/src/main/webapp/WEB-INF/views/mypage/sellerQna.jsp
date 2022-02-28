<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Q&A 문의내역</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.pg_btn{
          text-align: center;
          margin-bottom: 100px;
       }
       
.paging {
	width: fit-content;
	margin: 0 auto;
} 
</style>
</head>
<body>
<div class="container">
   <div class="sub-banner">
      <h2 class="sub-title">Q&A 문의내역</h2>
   </div>
	<div class="row">
      <%@include file="menu.jsp"%>
      <div class="col-10">
      <table class="table" style="text-align: center;">
         <tr style="--bs-table-bg: #2F3A8F;color:#fff;">
            <th>번호</th>
            <th>글카테고리</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>답변여부</th>
         </tr>
         <!-- 반복 여기서부터 -->
         <c:forEach var="board" items="${sellerQna }">
         <tr>
            <td>${board.b_num }</td>
            <td>${board.b_category }</td>
            <td style="text-align: left;"><a href="boardDetail?b_num=${board.b_num }">${board.b_title }</a></td>
            <td>${board.id }</td>
            <td>${board.b_date }</td>
            <td>${board.answer}</td>
         </tr>
         </c:forEach>
         <!-- 여기까지 반복 -->

      </table>
		<nav aria-label="..." class="paging">
		  <ul class="pagination">
		  	<c:if test="${pg.startPage > pg.pageBlock}">
			    <li class="page-item">
			      <a class="page-link" href="sellerQna?currentPage=${pg.startPage - pg.pageBlock}">&laquo;</a>
			    </li>
		    </c:if>
		    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			    <li class="page-item">
			    		<a class="page-link" href="sellerQna?currentPage=${i}">${i}</a>
	    		</li>
	   		</c:forEach>
	   		<c:if test="${pg.endPage < pg.totalPage}">
			    <li class="page-item">
			      <a class="page-link" href="sellerQna?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
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