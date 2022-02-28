<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<!-- 결제 성공 -->
		<c:when test="${orders.success == 1}">
			<div class="alert alert-success" role="alert">
	        	결제가 완료 되었습니다
		      	<div>주문번호: ${orders.o_num }</div><p>
		        <div>주문자: ${orders.id }</div><p>
		        <div>주문 상품: ${orders.p_num }</div><p>
		        <div>결제 금액: ${orders.o_sum }</div>
	    	</div>
        	<button type="button" onclick="location.href='main'">메인페이지로 </button>
		</c:when>
		<!-- 결제 실패 -->
		<c:otherwise>
			<div class="alert alert-danger" role="alert">
	        	결제를 실패했습니다
	    	</div>
        	<button type="button" onclick="location.href='main'">메인페이지로 </button>
		</c:otherwise>
	</c:choose>
    
    <%@include file = "../footer.jsp"%>
</body>
</html>