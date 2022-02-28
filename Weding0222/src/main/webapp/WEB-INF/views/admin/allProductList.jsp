<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    	crossorigin="anonymous">
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>전체상품관리(관리자)</title>
<%@include file = "../header.jsp" %>
</head>
<style>
    .container{
    	align-items: flex-start;
    	margin: 0 auto;
        width: 100%;
        height: 100%;
    }
    .row{
        width: 145px;
        text-align: left;
    }
    <!-- td태그 자동 줄바꿈 -->
    td{
        word-break:break-all;
    }
    .tr_title{
    	text-align: center;
    	float: center;
    }
    #manager_body{
        float: center;
        width: auto;
        height: auto;
        margin: 30px;
    }
    #manager_menu{
        float: left;
        width: 120px;
        height: auto;
        margin: 0;
        margin-right: 20px;
    }
    #manager_table{
        width: 1500px;
        height: auto;
    }
    form{
    	margin-left: 120px;
    }
    .pg_btn{
    	text-align: center;
    	margin-bottom: 100px;
    }
</style>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
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
    <div class="p-3 mb-2">
        <div class="title">
            <div class="col" style="text-align: center;"> 관리자 상품관리</div>
        </div>
    </div>
    <hr>
    <c:set var="num" value="${pg.total-pg.start+1}"></c:set>
        <div id="manaber_table" class="col-md-12 col-md-offset-4">
        	<%@include file = "../mypage/menu.jsp" %>
            <div id="manager_body">
                <form action="action" method="post">
                    <table class="table table-bordered w-auto">
                        <tr class="tr_title">
                            <th>상품번호</th><th>상품이름</th><th>판매자</th><th>카테고리</th>
              	              <th>펀딩기간</th><th>상품가격</th><th>달성율</th><th>수정</th><th>삭제</th>
                        </tr>
                        <!-- c:forEach 시작 -->
                        <c:forEach var="product" items="${allproductListAll}" varStatus="status">
                            <tr id="product${status.index}">
                                <td>
                                	<input type="hidden" id="p_num${status.index}" value="${product.p_num}">
                                	${product.p_num}
                               	</td>
                                <td>${product.p_name}</td>
                                <td>${product.p_store}</td>
                                <td>${product.mini_content}</td>
                                <td>${product.p_start} ~ ${product.p_end}</td>
                                <td>${product.p_price}</td>
                                <td>${product.attainment}%</td>
                                <c:if test="${member.mini_cat == 300}">
                                <td><button type="button" class="btn btn-light" onclick="location.href='allProductUpdateForm?p_num=${product.p_num}';">수정</button></td>
                                <td><button type="button" class="btn btn-light" onclick="getAllProductDelete(${status.index})">삭제</button></td>
                                </c:if> 
                            </tr>
                            <c:set var="num" value="${num - 1}"></c:set>
                        </c:forEach>
                        <!-- c:forEach 끝 -->
                    </table>
                </form>
            </div>
        </div>
        
	<div class="pg_btn">
	    <c:if test="${pg.startPage > pg.pageBlock}">
	        <a href="allProductList?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	    </c:if>
	    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
	        <a href="allProductList?currentPage=${i}">[${i}]</a>
	    </c:forEach>
	    <c:if test="${pg.endPage < pg.totalPage}">
	        <a href="allProductList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	    </c:if>
	</div>
</div>

<%@ include file = "../footer.jsp" %>
</body>
</html>