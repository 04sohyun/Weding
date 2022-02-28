<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="icon" type="image/png"  href="images/favicon.png"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<style>
	* {
		font-family: 'Noto Sans KR';
		font-size: 15px;
	}
	
	.sub-banner {
		width: 100vw;
		margin-left: calc(-50vw + 50%);
		height: 15rem;
		text-align: center;
		background-color: #2F3A8F;
		margin-bottom: 50px;
	}
	
	.sub-title {
		font-size: 2.2em;
		line-height: 15rem;
		color: #fff;
	}
	
	a {
		color:#000;
	}
	
	a:link {
		text-decoration: none;
	}
	
	a:visited {
		color:#000;
	}
	
	a:hover {
		color:#000;
		text-decoration: none;
	}
</style>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-2">
      <a href="<c:url value='main'/>" class="main"><img src="images/logo.png"></a>

      <ul class="nav">
        <li><a href="<c:url value='beforeFundList'/>" class="nav-link px-2 link-dark">펀딩예정</a></li>
        <li><a href="<c:url value='fundingList'/>" class="nav-link px-2 link-dark">펀딩하기</a></li>
        <li><a href="<c:url value='boardList?main_cat=300&mini_cat=100'/>" class="nav-link px-2 link-dark">공지사항</a></li>
        <li><a href="<c:url value='boardList?main_cat=300&mini_cat=200'/>" class="nav-link px-2 link-dark">문의사항</a></li>
      </ul>
      
      <!-- id=가 null이면 보여지는 div -->
		  <c:choose>
			<c:when test="${empty member}">
		      <div class="nav">
		        <a href="loginForm" class="nav-link px-2 link-dark">로그인</a>
		        <a href="joinForm" class="nav-link px-2 link-dark">회원가입</a>
		      </div>
			</c:when>
		   </c:choose>
	    <!-- id가 not null이면 보여지는 div -->
 		<c:if test="${member != null}"> 
	    	<div class="nav">
	    		<a class="nav-link px-2 link-dark">${member.name}님</a>
	    		<c:if test="${member.id == 'admin' || member.main_cat == 100 && member.mini_cat == 300}">
	    			<a href="<c:url value='allProductList'/>" class="nav-link px-2 link-dark">마이페이지</a>
	    		</c:if>
	    		<c:if test="${member.main_cat == 100 && member.mini_cat == 100}">
	    			<a href="<c:url value='dibsList'/>" class="nav-link px-2 link-dark">마이페이지</a>
	    		</c:if>
	    		<c:if test="${member.main_cat == 100 && member.mini_cat == 200}">
	    			<a href="<c:url value='memberUpdateForm'/>" class="nav-link px-2 link-dark">마이페이지</a>
	    		</c:if>
		    	<a href="<c:url value='logout'/>" class="nav-link px-2 link-dark">로그아웃</a>
	    	</div>
		</c:if>
    </header>
  </div>
