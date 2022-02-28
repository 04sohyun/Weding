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

<style>
.b {
	word-break: break-all;
}
</style>
<script>
function pwCheck(){
	if(document.memberPw.password.value!=document.memberPw.password_chk.value){
		alert("비밀번호와 비밀번호 확인값이 서로 다릅니다.");
		document.memberPw.password.value="";
		document.memberPw.password_chk.value="";
		document.memberPw.password.focus();
		return false;
	}else{
		alert("비밀번호가 변경되었습니다.");
		return true;
	}
	return true;
}
</script>



<title>pwchangeForm</title>
</head>

<body>
	<div class="container">
		<div class="p-3 mb-2 bg-secondary text-white">
			<div class="row">
				<div class="col" style="text-align: center;">비밀번호변경</div>
			</div>
		</div>
		
		

		<div class="row">
			<div class="col-2">
				<%@include file = "menu.jsp"%>
			</div>
			<div class="col-2"></div>


			<div class="col-8">
			<form action="pwUpdate" method="post" name="memberPw" onsubmit="return pwCheck()">
				<table>
					<div class="row">
						<div class="col-3">변경할 비밀번호</div>
						<div class="col-7">
							<input type="password" name="password" placeholder="비밀번호입력">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-3">변경할 비밀번호 확인</div>
						<div class="col-7">
							<input type="password" name="password_chk" placeholder="비밀번호 확인 입력">
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-lg-6" style="float: none; margin: auto;">
							<input type="submit" class="btn btn-secondary" value="비밀번호 변경">
						</div>
					</div>
				</table>
			</form>	
			</div>








			<!-- JavaScript Bundle with Popper -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>


			<%@ include file="../footer.jsp"%>
</body>




</html>

