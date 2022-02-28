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
	div.row{
		margin-left: 20px;
	}
	form.row-form-body{
		font-size: 15px;
	}
	td#menu-name {
		width: 120px;
		height: 40px;
	}
	table.table-body {
		width: 70%;
		height: auto;
		margin: 0 auto;
	}
</style>
<body>
<div class="container">
	<div class="sub-banner">
		<h2 class="sub-title">상품수정</h2>
	</div>
	<div class="row">
		<%@include file="../mypage/menu.jsp"%>
		<div class="col-10">
		<form action="allProductUpdate" method="post" enctype="multipart/form-data" class="row-form-body col-md-10">
			<table class="table">
				<tr><td id="menu-name" style="border:none;">상품번호</td> <td style="border:none;"><input type="text" style="width:30%;" class="form-control" id="p_num" name="p_num" value="${allProductUpdateForm.p_num}" readonly="readonly"></td></tr>
				<tr><td id="menu-name" style="border:none;">카테고리</td> <td style="border:none;"><select name="mini_cat" style="width:30%;height: 34px;" class="form-select" id="category-select">
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
					</select></td></tr>
				<tr><td id="menu-name" style="border:none;">상품판매업체</td> <td style="border:none;"><input type="text" class="form-control" style="width:30%" name="p_store" value="${allProductUpdateForm.p_store}"></td></tr>
				<tr><td id="menu-name" style="border:none;">상품이름</td>	 <td style="border:none;"><input type="text" class="form-control" style="width:70%;" name="p_name" value="${allProductUpdateForm.p_name}"></td></tr>
				<tr><td id="menu-name" style="border:none;">대표이미지</td>	 <td style="border:none;"><input type="file" class="form-control" name="file1" style="width:30%" value="${allProductUpdateForm.p_image1}"></td></tr>
				<tr><td id="menu-name" style="border:none;">상세이미지</td>  <td style="border:none;"><input type="file" class="form-control" name="file2" style="width:30%" value="${allProductUpdateForm.p_image2}"></td></tr>
				<tr><td id="menu-name" style="border:none;">상품설명</td>	 <td style="border:none;"><textarea name="p_description" class="form-control" style="resize: vertical;" rows="5" cols="65">
																	   ${allProductUpdateForm.p_description}</textarea></td></tr>
				<tr><td id="menu-name" style="border:none;">펀딩기간</td>	 <td style="border:none;"><input type="text" class="form-control" style="width:30%;display:inline;" value="${allProductUpdateForm.p_start}" readonly="readonly"> ~ 
														 <input type="text" class="form-control" style="width:30%;display:inline" value="${allProductUpdateForm.p_end}" readonly="readonly"></td></tr>
				<tr><td id="menu-name" style="border:none;">상품가격</td>	 <td style="border:none;"><input name="p_price" type="text" style="width:30%;display:inline" class="form-control" value="${allProductUpdateForm.p_price}">&nbsp;&nbsp;원</td></tr>
				<tr>
					<td colspan="2" style="text-align: right;border:none;">
						<c:if test="${member.mini_cat == 300}">
						<button type="submit" class="btn btn-outline-info">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='allProductDetailDelete?p_num=${allProductUpdateForm.p_num}'">삭제</button>
						</c:if>
					</td>
				</tr>
			</table>
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