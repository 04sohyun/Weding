<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품관리(관리자)</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
<%@include file = "../header.jsp" %>
</head>
<style>
    .allProductList_member_tableForm{
    	width: 100%;
    	margin: 0;
    	padding: 0;
    }
    .allProduct_table_td1{
       	display: inline-block; 
    	width: 280px; 
    	height: 50%;
    	white-space: nowrap; 
    	text-overflow: ellipsis;
    	overflow: hidden;
    	text-align: left;
    }
	.pg_btn{
    	text-align: center;
    } 
    
    .paging {
		clear: both;
		width: fit-content;
		margin: 0 auto;
	} 
</style>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function getAllProductDelete(Vindex) {
		if(confirm("정말 삭제 하시겠습니까?") == true){ // 확인
			var selP_num = $("#p_num" + Vindex).val();
			
			$.ajax({
				url:"<%=context%>/allProductDelete",
				data:{p_num : selP_num},
				dataType:'text',
				success:function(data){
					$("#product" + Vindex).remove();
					
				}
			});
		}else{ //취소
			return false;
		}
	}
	
</script>
<body>
<div class="container">
    <div class="sub-banner">
   		<h2 class="sub-title">관리자 상품 관리</h2>
    </div>
    <c:set var="num" value="${pg.total-pg.start+1}"></c:set>
        <div class="row">
       		<%@include file = "../mypage/menu.jsp" %>
       		<div class="col-10">
	            <table class="table" style="text-align: center">
	                <tr class="table-dark">
	                    <th>상품번호</th>
	                    <th>상품이름</th>
	                    <th>판매자</th>
	                    <th>카테고리</th>
	      	            <th>펀딩기간</th>
	      	            <th>상품가격</th>
	      	            <th>달성율</th>
	      	            <th>수정</th>
	      	            <th>삭제</th>
	                </tr>
		            <!-- c:forEach 시작 -->
		            <c:forEach var="product" items="${allproductListAll}" varStatus="status">
		                <tr id="product${status.index}">
		                    <td>
		                    	<input type="hidden" id="p_num${status.index}" value="${product.p_num}">
		                    	${product.p_num}
		                   	</td>
		                    <td style="text-align:left;"><a href="fundingDetail?p_num=${product.p_num}&p_condition=${product.p_condition}">${product.p_name}</a></td>
		                    <td>${product.p_store}</td>
		                    <td>${product.mini_content}</td>
		                    <td>${product.p_start} ~ ${product.p_end}</td>
		                    <td><fmt:formatNumber value="${product.p_price}"/></td> 
		                    <td>${product.attainment}%</td>
		                    <c:if test="${member.mini_cat == 300}">
		                    <td><button type="button" class="btn btn-outline-info" onclick="location.href='allProductUpdateForm?p_num=${product.p_num}';">수정</button></td>
		                    <td><button type="button" class="btn btn-outline-danger" onclick="getAllProductDelete(${status.index})">삭제</button></td>
		                    </c:if> 
		                </tr>
		                <c:set var="num" value="${num - 1}"></c:set>
		            </c:forEach>
		            <!-- c:forEach 끝 -->
	        	</table>
	        	
	        	<nav aria-label="..." class="paging">
				  <ul class="pagination">
				  	<c:if test="${pg.startPage > pg.pageBlock}">
					    <li class="page-item">
					      <a class="page-link" onclick="location.href='allProductList?currentPage=${pg.startPage - pg.pageBlock}'">&laquo;</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					    <li class="page-item">
					    		<a class="page-link" href="allProductList?currentPage=${i}">${i}</a>
			    		</li>
		    		</c:forEach>
		    		<c:if test="${pg.endPage < pg.totalPage}">
					    <li class="page-item">
					      <a class="page-link" href="allProductList?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
				
				<div class="allMemberList_table_btn">
		       	 <form action="searchProductName" method="get" style="text-align: center;">
		          	<input name="keyword" class="form-control" style="width:20%;display:inline" type="text" value="" placeholder="검색">
		          	<input type="submit" class="btn btn-outline-primary" style="width:5rem;height:34px;" value="검색">
	    		 </form>
				</div>
				
        </div>
    </div>      
</div>

<%@ include file = "../footer.jsp" %>
</body>
</html>