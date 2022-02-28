<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
.b {
	word-break: break-all;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {//daum주소 사용
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;
						} else { 
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						document.getElementById('zipCode').value = data.zonecode;
						document.getElementById('roadAddress').value = fullAddr;
						document.getElementById('detailAddress').focus();
					}
				}).open();
	}
</script>
<title>memberUpdateForm</title>
</head>
<body>
<div class="container">
	<div class="p-3 mb-2 bg-secondary text-white">
		<div class="row">
			<div class="col" style="text-align: center;">회원정보수정</div>
		</div>
	</div>
	
		<div class="col-6">
		
		<%@include file="menu.jsp"%>
		
			<form action="memberUpdate" method="post">
				<div class="row">
					<div class="col-3">이름</div>
					<div class="col">
						<input type="text" name="name" size=30 placeholder="아이디입력" value="${member.name}">
					</div>
				</div>
				<br>
				
				<div class="row">
					<div class="col-3">연락처</div>
					<div class="col">
						<input type="text" name="phone" size=30 placeholder="연락처입력" value="${member.phone}">
					</div>
				</div>
				<br>
				
				<c:set var="email1" value="${member.email.split('@')[0]}"/>
				<c:set var="email2" value="${member.email.split('@')[1]}"/>
				<div class="row">
					<div class="col-3">이메일</div>
					<div class="col">
						<input type="text" name="email1" size=30 placeholder="이메일 입력" value="${email1}">@
						<select name="email2" required>
	                 	<option value="naver.com" <c:if test="${email1.equals('naver.com')}"><c:out value="selected"/></c:if> >naver.com</option>
	                 	<option value="gmail.com" <c:if test="${email1.equals('gmail.com')}"><c:out value="selected"/></c:if> >gmail.com</option>
	                 	<option value="daum.net" <c:if test="${email1.equals('daum.net')}"><c:out value="selected"/></c:if> >daum.net</option>
	                 	<option value="nate.com" <c:if test="${email1.equals('nate.com')}"><c:out value="selected"/></c:if> >nate.com</option>
	                 </select>
					</div>
				</div>
				<br>
				
				<div class="row">
					<div class="col-3">주소</div>
					<div class="col">
						<input type="text"   size="15" name="zipCode" id="zipCode" placeholder="우편번호" value="${member.zipCode }"> 
						<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색"> 
						<input type="text"   size="40" name="roadAddress" id="roadAddress" placeholder="도로명주소" value="${member.roadAddress }"> 
						<input type="text"   size="40" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${member.detailAddress }">
					</div>
				</div>
				
				<div class="row" style="margin-top: 10%">
					<div class="col-8 d-grid gap-2">
						<input type="submit" class="btn btn-secondary" value="회원수정">
						<!-- submit button-->
					</div>
					<div id="memberDelete" class="col-4 d-grid gap-2">
						<button type="button" class="btn btn-light" onclick="location.href='memberDelete?id=${member.id}'">탈퇴</button>
					</div>
				</div>		
			</form>
		</div>
	</div>
</div>
	<div class="col-3"></div>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<%@ include file="../footer.jsp"%>
</body>
</html>