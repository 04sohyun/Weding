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
    <div class="alert alert-danger" role="alert">
        
      
        결제가 취소 되었습니다
    
        <div>주문 번호¸:</div><p>
        <div>주문자:</div><p>
        <div>주문 상품:</div><p>
        <div>결제 금액:</div>
    </div>
        <button type="button">찜목록으로 </button>
        <button type="button">메인 페이지로</button>

      <%@include file = "../footer.jsp"%>
</body>
</html>