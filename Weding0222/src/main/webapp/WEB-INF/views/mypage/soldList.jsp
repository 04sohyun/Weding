<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
<style type="text/css">
   .menu1{width:300px; border:1px solid red; float:left;}
   .content1{width:500px;}
   .pg_btn{
          text-align: center;
          margin-bottom: 100px;
   }
   
   .soldListTableTd {
      text-align: left;
       font-size: 15px;
       width: 483px; 
       height: auto;
   }
   
   .soldListTableTd img {
      width: 50px;
      height: 50px;
      object-fit: cover;
   }
   
   .paging {
      clear: both;
      width: fit-content;
      margin: 0 auto;
   } 
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="sub-banner">
   		<h2 class="sub-title">상품 관리</h2>
    </div>
    <div class="row">
	<%@ include file="menu.jsp" %>
	<div class="col-10">	
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<table class="table" style="text-align: center;">
			<tr style="font-size: 13px;--bs-table-bg: #2F3A8F;color:#fff;">
				<th>상품번호</th>
				<th>카테고리</th>
				<th>상품이름</th>
				<th>펀딩기간</th>
				<th>상품가격</th>
				<th>목표금액</th>
				<th>달성율</th>
			</tr>
			<c:forEach var="soldList" items="${soldList}">
				<tr>
				<td style="line-height: 5rem;">${soldList.p_num}</td>
				<td style="line-height: 5rem;">${soldList.mini_content}</td>
				<td class="soldListTableTd" style="text-align: left;text-overflow: ellipsis;overflow: hidden; "><img src="${pageContext.request.contextPath}/upload/${soldList.p_image1}"/>
				<%-- <img src="${pageContext.request.contextPath}/upload/${soldList.p_image1}"
					 alt="상품" style="width: 25px; height: 25px;"> --%>
				&nbsp;&nbsp;&nbsp;<a href="fundingDetail?p_num=${soldList.p_num}&p_condition=${soldList.p_condition}">${soldList.p_name}</a></td>
				<td style="line-height: 5rem;">${soldList.p_start} ~ ${soldList.p_end}</td>
				<td style="line-height: 5rem;"><fmt:formatNumber value="${soldList.p_price}"/>원</td>
				<td style="line-height: 5rem;"><fmt:formatNumber value="${soldList.p_goalprice}"/>원</td>
				<td style="line-height: 5rem;">${soldList.attainment}%</td></tr>
				<c:set var="num" value="#{num-1}"></c:set>
			</c:forEach>
		</table>
		
		<div class="btn-items" style="float: right;">
			<button type="button" style="font-size: 1em;margin-bottom: 5rem;" onclick="location.href='addProductForm'" class="btn btn-outline-primary">상품등록</button>
		</div>
		
		<nav aria-label="..." class="paging">
		  <ul class="pagination">
		  	<c:if test="${pg.startPage > pg.pageBlock}">
			    <li class="page-item">
			      <a class="page-link" href="soldList?currentPage=${pg.startPage-pg.pageBlock}">&laquo;</a>
			    </li>
		    </c:if>
		    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			    <li class="page-item">
			    		<a class="page-link" href="soldList?currentPage=${i}">${i}</a>
	    		</li>
	   		</c:forEach>
	   		<c:if test="${pg.endPage < pg.totalPage}">
			    <li class="page-item">
			      <a class="page-link" href="soldList?currentPage=${pg.startPage+pg.pageBlock}">&raquo;</a>
			    </li>
		    </c:if>
		  </ul>
		</nav>
		
	</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>