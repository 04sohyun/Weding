<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	.join-info {
		display: block;
		margin-top: 1rem;
		font-size: 12px;
	}
</style>
<%@ include file="../header.jsp" %>
</head>
<body>
 <div class="container" align="center" style="padding: 100px; ">
     <div class="col-md-4 col-md-offset-4">
          <h1 class="form-signin-heading" align="left" style="margin-bottom: 3rem;">로그인</h1>
          <form action="login" method="post">
              <div class="form-group">
                  <label for="id" class="sr-only">Id</label>
                  <input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
              </div>
              <div class="form-group">
                 <label class="sr-only" for="password">Password</label>
                 <input type="password" class="form-control" placeholder="Password" name="password" required>
              </div>
            	<button class="btn" type="button" onclick="location.href='idpwFindForm'" style="float:right">아이디 비밀번호 찾기 &raquo;</button>
              	<button class="btn" type="submit" style="width: 100%; height: 40px; margin-top: 1rem; font-size: 1.0em;background-color:#2F3A8F;color:#fff">로그인</button><br>
          	  	<span class="join-info">아직 계정이 없나요? <button class="btn" type="button" onclick="location.href='joinForm'">회원가입</button></span>
          </form>     
     </div>
  </div> 
<%@ include file="../footer.jsp" %>
</body>
</html>