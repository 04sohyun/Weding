<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
    .pagination {
        justify-content: center;
    }
</style>

<title>fundingList</title>
</head>
<body>

<div class="container">
    <table style="height: 150px; border-spacing: 30px; border-collapse: separate;">
        <tr>
         <c:if test="${not empty catList}">
  		 	<c:forEach items="${catList}" var="cat">
            	<td style="text-align: center; margin-right: 50px;"><a href="fundingList?currentPage=1&main_cat=${cat.main_cat}&mini_cat=${cat.mini_cat}&p_condition=2">
            		<img src="resources/img/${cat.c_image}" width="100" height="100" style="border-radius: 50%; border: 0;" alt="...">
            	</td>
            </c:forEach>
         </c:if>
        </tr>
        <tr>
         <c:if test="${not empty catList}">
  		    <c:forEach items="${catList}"  var="cat">
               <th style="text-align: center; vertical-align: middle;">${cat.c_content }</th>
            </c:forEach>
         </c:if>
        </tr>
    </table>
   
	<div class="row" style="margin-top: 5px;">
		<div class="col-8"></div>
        <div class="col-2">
            <form class="d-flex" action="getSearchProduct" method="get">
                <input class="form-control me-2" type="text" name="keyword" placeholder="검색" aria-label="Search" value="">
                <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
            </form>
        </div>
        <div class="col-1">
                <button class="btn btn-light" type="button" onclick="location.href='fundingEndList'" style="font-size: 15px;">펀딩종료</button>
        </div>
        <div class="col-1">
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1"
                    data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 15px;">&nbsp;&nbsp;정렬&nbsp;&nbsp;</button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                 	<li><a class="dropdown-item" href="sortProduct?sort=newSort">최신순</a></li>
                    <li><a class="dropdown-item" href="sortProduct?sort=popularSort">인기순</a></li>
                    <li><a class="dropdown-item" href="sortProduct?sort=goalSort">달성순</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <hr>

    <div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top: 30px;">
    	<!-- 펀딩 상품 목록 반복 시작 -->            
		<c:forEach var="product" items="${productList}">
       	 <div class="col" onclick="location.href='fundingDetail?p_num=${product.p_num}&p_condition=${product.p_condition}'" style="cursor: pointer; margin-top: 30px; padding: 3px;">
            <div class="card h-100" style="width: 300px; margin: auto;">
                <img src="${pageContext.request.contextPath}/upload/${product.p_image1}" class="card-img-top" width="300" height="300" alt="...">
                <div class="card-body">
                    <h2 class="card-title">${product.p_name}</h2>
                    <p class="card-text">${product.mini_content} | ${product.p_store }</p>
                    <div class="progress">
                        <div class="progress-bar" style="width: ${product.attainment}%" role="progressbar" aria-valuenow="${product.attainment}"
                        aria-valuemin="0" aria-valuemax="100"></div>
                    </div>

                    <div class="row">
                        <div class="col-3">
                            ${product.attainment}%
                        </div>
                        <div class="col">
                            ${product.p_price }
                        </div>
                        <div class="col-4">
                            ${product.leftdate}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <!-- 펀딩 상품 목록 반복 끝 -->
    </div>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

<%@include file = "../footer.jsp"%>
</body>
</html>        