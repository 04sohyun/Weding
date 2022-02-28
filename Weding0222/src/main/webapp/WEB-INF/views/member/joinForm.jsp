<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
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


<title>joinForm</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	function check() { //비밀번호 일치 불일치 확인
		var password = document.getElementById('password');
		var password_check = document.getElementById('password_check');

		if (password.value != password_check.value) {
			alert('비밀번호 불일치')
			return false;
		}

		document.joinForm.submit();
	}

	//ID 중복체크
	function memberIdConfirm() {
		var id = document.getElementById('id');
		if(id.value.length == 0) {
			alert("아이디를 입력하세요.");
			return;
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/memberIdConfirm",
			type : "post",
			dataType : "json",
			data : {//
				"id" : $("#id").val()
			},
			success : function(data) {
				console.log(data);
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#memberIdConfirm").attr("value", "Y");
					alert("사용가능한 아이디입니다.");

				}
			},
			error : function(e) {
				alert("사용불가능한 아이디입니다.");
			}
		})
	}
	
	function emailChk() {
		
		var email = $('#email').val();

		$.ajax({
			url : "<%=request.getContextPath()%>/mailConfirm",
			type : "post",
			dataType : "json",
			data : {//
				email :email
			},
			success : function(data) {
				console.log(data);
				$('input[name=emailCheck]').attr('value', data);
			},
			error : function(e) {
				alert("이메일 발송 실패.");
			}
		})
	}
	
	function codeChk() {
		var emailNum = document.getElementById('emailNum');
		var emailCheck = document.getElementById('emailCheck');
		
		if(emailNum.value == emailCheck) {
			alert('y');
		} else {
			alert('N');
		}
	}
</script>

<!--  -->
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
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById('sample6_address').value = fullAddr;
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>


</head>

<body>
	<div class="container">
		<div class="p-3 mb-2 bg-secondary text-white">
			<div class="row">
				<div class="col" style="text-align: center;">회원가입</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">

			<form action="join" method="post" name="joinForm" onsubmit="check()">

				<div class="row">
					<div class="col-3">이름</div>
					<div class="col">
						<input type="text" name="name" id="name" size=30
							placeholder="이름입력">
					</div>
				</div>
				<br>

				<!-- 아이디 -->
				<div class="row">
					<div class="col-3">아이디</div>
					<div class="col">
						<input type="text" name="id" id="id" size=30 placeholder="아이디입력">

					</div>
					<div class="col">
						<button class="memberIdConfirm" type="button" id="idDuplCheck"
							onclick="memberIdConfirm();" value="N">중복확인</button>
					</div>
				</div>
				<br>
				<!--  비밀번호 -->
				<div class="row">
					<div class="col-3">비밀번호</div>
					<div class="col">
						<input type="password" name="password" id="password" size=30
							placeholder="비밀번호입력">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-3">비밀번호확인</div>
					<div class="col">
						<input type="password" name="password_check" id="password_check"
							size=30 placeholder="비밀번호확인입력">
					</div>
				</div>
				<!--  연락처 -->
				<br>
				<div class="row">
					<div class="col-3">연락처</div>
					<div class="col">
						<input type="text" name="phone" id="phone" name=size=30	placeholder="연락처 입력">
					</div>
				</div>

				<br>

				<div class="row">
					<div class="col-3">이메일</div>
					<div class="col">
						<input type="text" name="email" id="email" size=30
							placeholder="이메일 입력">
						<button type="button" class="btn btn-light" onclick="emailChk()">이메일인증</button>
						<br> <input type="text" name="emailNum" id="emailNum" size=30
							placeholder="인증번호 입력">
							<input type="hidden" name="emailCheck" id="emailCheck" readonly>
							<button type="button" class="btn btn-light" onclick="codeChk()">인증확인</button>
					</div>
				</div>

				<br>
				<div class="row">
					<div class="col-3">주소</div>
					<div class="col">
						<input type="text" name="zipCode" size="10" id="sample6_postcode" placeholder="우편번호"> 
						<input type="button" class="btn btn-primary btn-sm" value="우편번호찾기" onclick="sample6_execDaumPostcode()">
							 <br> 
						<input type="text" name="roadAddress" size="30" id="sample6_address" placeholder="주소"> 
							<br> 
						<input type="text" name="detailAddress" size="30" id="sample6_address2"	placeholder="상세주소">
					</div>
				</div>
				<br>

				<div>
					<div class="row" style="margin-top: 10%">
						<div class="col-8 d-grid gap-2">
							<button type="submit" formmethod="POST" class="btn btn-secondary">회원가입</button>
							<!-- submit button-->
						</div>

						<div class="col-4 d-grid gap-2">
							<button type="submit" formmethod="GET" class="btn btn-light">취소</button>
						</div>
					</div>
				</div>
		</form>
		</div>


	</div>
	<div class="col-3"></div>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>
<%@ include file="../footer.jsp"%>