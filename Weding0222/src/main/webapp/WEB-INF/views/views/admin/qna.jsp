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
.sub-banner {
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 100px;
	text-align: center;
	background-color: #FEECE9;
	margin-bottom: 50px;
}

.sub-title {
	line-height: 100px;
}

.paging {
	clear: both;
	width: fit-content;
	margin: 0 auto;
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
        <div class="sub-banner">
			<h2 class="sub-title">문의사항 답변</h2>
		</div>
		<div class="row">
		<%@include file="../mypage/menu.jsp"%>
		<div class="col-10">
            <table class="table" style="text-align: center">
                <tr class="table-dark"><th>번호</th><th>카테고리</th><th>제목</th><th>작성일</th><th>조회수</th><th>작성자</th><th>답변여부</th></tr>
        		<c:forEach var="qna" items="${qnaBoardList}">
                    <tr>
                        <td>${qna.b_num}</td>
                        <td>${qna.b_category}</td>
                        <td style="text-align: left;"><a href="boardDetail?b_num=${qna.b_num}">${qna.b_title}</a></td>
                        <td>${qna.b_date}</td>
                        <td>${qna.b_hit}</td>
                        <td>${qna.id}</td>
                        <td>${qna.answer}</td>
                    </tr>
                    <c:set var="num" value="${num-1}"></c:set>
                </c:forEach>
            </table>
            
            	<nav aria-label="..." class="paging">
				  <ul class="pagination">
				  	<c:if test="${pg.startPage > pg.pageBlock}">
					    <li class="page-item">
					      <a class="page-link" onclick="location.href='qnaBoardList?currentPage=${pg.startPage - pg.pageBlock}'">&laquo;</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					    <li class="page-item">
					    		<a class="page-link" href="qnaBoardList?currentPage=${i}">${i}</a>
			    		</li>
		    		</c:forEach>
		    		<c:if test="${pg.endPage < pg.totalPage}">
					    <li class="page-item">
					      <a class="page-link" href="qnaBoardList?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
	        </div>
        </div>
    </div>
    <%@include file = "../footer.jsp"%>
</body>


