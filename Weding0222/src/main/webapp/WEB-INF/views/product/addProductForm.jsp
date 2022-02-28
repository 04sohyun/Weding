<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="jumbotron">
  <div class="container">
     <h1 class="display-3">상품등록</h1>
  </div>
</div>
<div class="container">
<p>상품등록</p>
<hr> 
<form name="addProduct" id="addProduct" action="addProduct" method="post" class="form-horizontal" enctype="multipart/form-data">
    <div class="form-group row">
       <label class="col-sm-2">카테고리</label>
       <div class="col-sm-3">
          <select name="mini_cat">
       		<option disabled="disabled" selected="selected">선택</option>
	       		<c:forEach var="product" items="${catList}">
	       			<option value="${product.mini_cat}">${product.mini_content}</option>
				</c:forEach>
          </select>
       </div>
    </div>
   <div class="form-group row">
       <label class="col-sm-2">상품판매업체</label>
       <div class="col-sm-3">
         <input type="text" name="p_store" class="form-control" autofocus required>
       </div>
    </div>
    
  <div class="form-group row">
       <label class="col-sm-2">상품이름</label>
       <div class="col-sm-3">
         <input type="text" name="p_name" class="form-control" required>
       </div>
    <div class="form-group row">
       <label class="col-sm-2">상품가격</label>
       <div class="col-sm-3">
       	<input type="text" name="p_price" class="form-control" required>원
       </div>
   </div>
   <div class="form-group row">
      <label class="col-sm-2" for="p_image1">대표이미지</label>
       <div class="col-sm-5">
         <input type="file" id="p_image1" name="file1" class="form-control">
       </div>
   </div>
   
   <div class="form-group row">
      <label class="col-sm-2" for="p_image2">상세이미지</label>
       <div class="col-sm-5">
         <input type="file" id="p_image2" name="file2" class="form-control">
       </div>
   </div>
   </div>
   
    <div class="form-group row">
       <label class="col-sm-2">상품설명</label>
       <div class="col-sm-5">
         <textarea rows="2" cols="50" name="p_description" class="form-control"></textarea>
       </div>
   </div>
   <div class="form-group row">
       <label class="col-sm-2">펀딩기간</label>
       <div class="col-sm-3">
        <input type="date" name="p_start" class="form-control" required>
        ~<input type="date" name="p_end" class="form-control" required>
       </div>
   </div>
  <div class="form-group row">
       <label class="col-sm-2">목표금액</label>
       <div class="col-sm-3">
       	<input type="text" name="p_goalprice" class="form-control" required>원
       </div>
   </div>
   
   
   
   <div class="form-group row" align="right">
       <div class="col-sm-offset-2 col-sm-10">
         <input type="button" value="목록" class="btn btn-primary" onclick="location.href='soldList.jsp'">
         <input type="reset" value="취소" class="btn btn-primary" onclick="location.href='soldList.jsp'">
         <input type="submit" value="등록" class="btn btn-primary" >
       </div>
   </div>
  </form>
  <!-- <iframe name="myBatisFrame"></iframe> -->
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>