<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>전체상품관리수정(관리자)</title>
<%@include file="../header.jsp"%>
</head>
<style type="text/css">
	form{
		margin-bottom: 100px;
	}
</style>
<body>
<div class="container">
	<div class="p-3 mb-2">
        <div class="title">
            <div class="col" style="text-align: center;"> 관리자 상품 수정</div>
        </div>
    </div>
    <hr>
	<div class="row">
		<%@include file="../mypage/menu.jsp"%>
		<div class="col-md-8 col-md-offset-4">
			<form action="allProductUpdate" method="get">
				<div>상품번호<input type="text" id="p_num" name="p_num" value="${allProductUpdateForm.p_num}" readonly="readonly"></div>
				<div>카테고리<select name="mini_cat" id="category-select">
						<option value="101" <c:if test="${allProductUpdateForm.mini_cat.equals('101')}"><c:out value="selected"/></c:if>>홈리빙</option>
						<option value="102" <c:if test="${allProductUpdateForm.mini_cat.equals('102')}"><c:out value="selected"/></c:if>>푸드</option>
						<option value="103" <c:if test="${allProductUpdateForm.mini_cat.equals('103')}"><c:out value="selected"/></c:if>>패션잡화</option>
						<option value="104" <c:if test="${allProductUpdateForm.mini_cat.equals('104')}"><c:out value="selected"/></c:if>>테크가전</option>
						<option value="105" <c:if test="${allProductUpdateForm.mini_cat.equals('105')}"><c:out value="selected"/></c:if>>캐릭터굿즈</option>
						<option value="106" <c:if test="${allProductUpdateForm.mini_cat.equals('106')}"><c:out value="selected"/></c:if>>여행스포츠</option>
						<option value="107" <c:if test="${allProductUpdateForm.mini_cat.equals('107')}"><c:out value="selected"/></c:if>>뷰티</option>
						<option value="108" <c:if test="${allProductUpdateForm.mini_cat.equals('108')}"><c:out value="selected"/></c:if>>베이비키즈</option>
						<option value="109" <c:if test="${allProductUpdateForm.mini_cat.equals('109')}"><c:out value="selected"/></c:if>>반려동물</option>
						<option value="110" <c:if test="${allProductUpdateForm.mini_cat.equals('110')}"><c:out value="selected"/></c:if>>게임취미</option>
					</select></div>
				<div>상품판매업체<input type="text" name="p_store" value="${allProductUpdateForm.p_store}"></div>
				<div>상품이름<input type="text" name="p_name" value="${allProductUpdateForm.p_name}"></div>
				<div>대표이미지<input type="file" name="p_image1" value="${allProductUpdateForm.p_image1}"></div>
				<div>상세이미지<input type="file" name="p_image2" value="${allProductUpdateForm.p_image2}"></div>
				<div>상품설명<textarea name="p_description" style="resize: both;" rows="5" cols="60">${allProductUpdateForm.p_description}</textarea></div>
				<div>펀딩기간<input type="text" value="${allProductUpdateForm.p_start}" readonly="readonly"> ~ <input type="text" value="${allProductUpdateForm.p_end}" readonly="readonly"></div>
				<div>상품가격<input name="p_price" type="text" value="${allProductUpdateForm.p_price}"></div>
				<!-- <button type="button" class="btn btn-light" onclick="">알림보내기</button> -->
				<button type="submit" class="btn btn-light">수정</button>
				<button type="button" class="btn btn-light" onclick="location.href='allProductDetailDelete?p_num=${allProductUpdateForm.p_num}'">삭제</button>
			</form>
		</div>
	</div>
</div>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<%@ include file="../footer.jsp"%>
</body>
</html>
