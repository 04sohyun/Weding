<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        .b {
            word-break: break-all;
        }
    </style>

    <title>allMemberList 회원관리 </title>
	<script type="text/javascript" src="js/jquery.js"></script>
 
    <script type="text/javascript">
	   function selectBoxChange(mini_cat){
		   alert('mini_cat->'+mini_cat);
		   $("#mini_cat").val(mini_cat);
	   }
    
    </script>
</head>

<body>
    <div class="container">
        <div class="p-3 mb-2 bg-secondary text-white">
            <div class="row">
                <div class="col" style="text-align: center;"> 회원관리</div>
            </div>
        </div>

        <div class="row">
            <div class="col-2">
                <div class="row">
                    <div class="col">관리자님</div>
                </div>
                <br>
                <div class="row">
                    <div class="col">회원관리</div>
                </div>
                <div class="row">
                    <div class="col">QnA 답변</div>
                </div>
                <div class="row">
                    <div class="col">관리자 상품관리</div>
                </div>
            </div>
            
            
            <div class="col-10">
            	회원수 : ${total}<p>
            	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
            	
                <table width="800" style="text-align: center;">
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>이메일</th>
                        <th>회원상태</th>
                        <th>현재</th>
                        <th>구분</th>
                        <th>전환</th>
                    </tr>
                 </table>  
                <c:forEach var="member" items="${memberList}">
             	  <form action="updateMember" method="post" >
             	     <input type="hidden" name="id" value="${member.id}">
 
             	    <table width="800" style="text-align: center;">
                     <tr>
                        <td>${member.id}</td>
                        <td>${member.name}</td>
                        <td>${member.phone}</td>
                        <td>${member.email}</td>
                        <td>${member.m_status}</td>
                        <td>${member.current_content}</td>
                        <td>
                           	<select name="mini_cat"  id="mini_cat" onchange="selectBoxChange(this.value);">
                           		<c:forEach var="member" items="${catList}"> 
                           			<option value="${member.mini_cat}" >${member.mini_content}</option> 
                           		</c:forEach>
                           	</select>
                        </td>
                        <td><button type="submit" class="btn btn-light">전환</button></td>
                    </tr>
                    <c:set var="num" value="${num-1}"></c:set>
                   </table> 
                  </form>
 				</c:forEach>
              <!--   </table>   -->
            </div>
           
            <c:if test="${pg.startPage > pg.pageBlock}">
		<a href="allMemberList?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="allMemberList?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="allMemberList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
</body>

</html>

<%@ include file= "../footer.jsp" %>