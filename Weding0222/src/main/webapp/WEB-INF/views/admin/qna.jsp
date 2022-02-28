<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    body{text-align: center;}
    table {
    width: 100%;
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

    function check() {
        var password = docuemnt.getElemetnById('password'); 
        var password_check = docuemnt.getElemetnById('password_check');

        if(password.value != password_check.value) {
            alert('비밀번호 불일치');
            return false;
        }

        document.joinForm.submit();
    }
    


</script>
<body>
<%@include file = "../header.jsp"%>
    <div class="container">
        <h2>Q&A</h2><br>
            <table colspan="2">
                <tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성일</th><th>조회수</th><th>작성자</th><th>답변여부</th></tr>
        		<c:forEach var="qna" items="${qnaBoardList}">
                    <tr>
                        <td>${qna.b_num}</td>
                        <td>${qna.b_category}</td>
                        <td><a href="boardDetail?b_num=${qna.b_num}">${qna.b_title}</a></td>
                        <td>${qna.b_date}</td>
                        <td>${qna.b_hit}</td>
                        <td>${qna.id}</td>
                        <td>${qna.answer}</td>
                    </tr>
                    <c:set var="num" value="${num-1}"></c:set>
                </c:forEach>
            </table><br>
            <button class="btn btn-outline-primary">글작성</button><br>
        
        <c:if test="${pg.startPage > pg.pageBlock}">
            <a href="qnaBoardList?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
            <a href="qnaBoardList?currentPage=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${pg.endPage < pg.totalPage}">
            <a href="qnaBoardList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
        </c:if>
    </div>
</body>


