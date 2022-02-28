<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../header.jsp" %>
</head>
<body>
 <div class="container" align="center" style="padding: 100px; ">
     <div class="col-md-4 col-md-offset-4">
          <h3 class="form-signin-heading" align="left">로그인</h3>
          <%
          	 String error = request.getParameter("error");
              if(error!=null){
            	  out.print("<div class='alert alert-danger'>");
            	  out.print("아이디와 비밀번호를 확인해 주세요");
            	  out.print("</div>");
              }
          %> 
          <form action="login" method="post">
              <div class="form-group">
                  <label for="id" class="sr-only">Id</label>
                  <input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
              </div>
              <div class="form-group">
                 <label class="sr-only" for="password">Password</label>
                 <input type="password" class="form-control" placeholder="Password" name="password" required>
              </div>
            	<button class="btn btn-light" type="button" onclick="location.href='idpwFindForm'">아이디 비밀번호 찾기 찾기></button><p>
              	<button class="btn btn-success" type="submit" style="width: 300px; height: 40px;">로그인</button><br>
          	  	아직 계정이 없나요? <button class="btn btn-light" type="button" onclick="location.href='joinForm'">회원가입</button>
          </form>     
     </div>
  </div> 
<%@ include file="../footer.jsp" %>
</body>
</html>