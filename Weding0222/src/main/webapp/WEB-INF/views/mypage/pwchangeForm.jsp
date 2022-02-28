<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
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
	function pwCheck() {
		if (document.memberPw.password.value != document.memberPw.password_chk.value) {
			alert("비밀번호와 비밀번호 확인값이 서로 다릅니다.");
			document.memberPw.password.value = "";
			document.memberPw.password_chk.value = "";
			document.memberPw.password.focus();
			return false;
		} else {
			alert("비밀번호가 변경되었습니다.");
			return true;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="sub-banner">
			<h2 class="sub-title">비밀번호 변경</h2>
		</div>
		<div class="row">
		<%@include file="menu.jsp"%>
			<div class="col-2"></div>
			<div class="col-4">
				<form action="pwUpdate" method="post" name="memberPw"
					onsubmit="return pwCheck()">
					<table class="table">
						<tr>
							<td style="border: none">변경할 비밀번호</td>
							<td style="border: none"><input type="password" class="form-control" style="font-size:12px;" name="password" placeholder="비밀번호입력"></td>
						</tr>
						<tr>
							<td style="border: none">변경할 비밀번호 확인</td>
							<td style="border: none"><input type="password" class="form-control" style="font-size:12px;" name="password_chk" placeholder="비밀번호 확인 입력"></td>
						</tr>
					</table>
					<div class="row">
						<div style="float: none; margin-top: 5rem;">
							<input type="submit" style="background-color:#2F3A8F;color:#fff;font-size: 1em;width:100%" class="btn" value="비밀번호 변경">
						</div>
					</div>
				</form>
			</div>
			<div class="col-4"></div>
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