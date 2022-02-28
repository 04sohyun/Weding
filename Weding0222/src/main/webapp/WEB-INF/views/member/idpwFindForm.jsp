<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
	System.out.println("context->"+context);
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	var contextPath='${pageContext.request.contextPath}';

	function search_check(num) {
		if (num == '1') { //매개변수가 1일때 -> id찾기 보임/pw찾기 안보임
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else { //그 외 -> id찾기 안보임 / pw찾기 보임
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	 $(document).ready(function(){
		 //아이디찾기 버튼 누르면 함수 실행
		    $("#idfind").click(function(){
			var selPhone = $("#phone").val(); //가져온 phone에 대한 값  가져옴
			var selName  = $("#name").val(); //가져온 name에 대한 값  가져옴
			
			$.ajax({
				type:"POST",
				url:"<%=context%>/member/idFindAjax",
				data:{phone : selPhone , name : selName },
				success:function(data){
					if(data == "" || data == null ){
						alert("ID가 존재하지 않습니다.");
					} else {
						$('#myModal').show(); //id가 있으면 모달 오픈
						$('#id_value').text(data);
					}
				}
			});
		});
	 });
	 
	 $(document).ready(function(){
		 //비밀번호찾기 버튼 누르면 함수 실행
		    $("#pwfind").click(function(){
			var selId = $("#id").val(); //가져온 phone에 대한 값  가져옴
			var selEmail  = $("#email").val(); //가져온 name에 대한 값  가져옴
			alert("selId : "+selId);
			alert("selEmail : "+selEmail);
			
			$.ajax({
				type:"POST",
				url:"<%=context%>/member/pwFindAjax",
				data:{id : selId , email : selEmail },
				success:function(data){
					if(data == "" || data == null ){
						alert("등록된 정보가 존재하지 않습니다.");
					} else {
						alert("임시 비밀번호가 이메일로 전송되었습니다.")
					}
				}
			});
		});
	 });
	
	/* 화면 아무데나 누르면 모달 창 닫기 */	 
 	$(document).click(function(){
		 $('#myModal').hide();
	 });
</script>

</head>
<body>
<div class="full">
	<div class="container">
		<div class="area_inputs wow fadeIn">
			<div class="sub_title font-weight-bold text-black">
				<h3>아이디/비밀번호 찾기</h3>
			</div>
			<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
				<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
				<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
			</div>

			<!-- 아이디 찾기 form -->
			<div id="searchI">
				<div class="form-group">
					<div>
						<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동" value="${member.name}">
					</div>
				</div>
				<div class="form-group">
					<div>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="ex) 01012345678" value="${member.phone}">
					</div>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-lg btn-secondary btn-block" id="idfind">아이디 찾기</button>
				<a class="btn btn-danger btn-block"	href="<%=context%>">취소</a>
				</div>
			</div>



			<!-- 비밀번호 찾기 form -->
			<div id="searchP" style="display: none;">
				<div class="form-group">
					<div>
						<input type="text" class="form-control" id="id" name="id" placeholder="아이디" value="${member.id}">
					</div>
				</div>
				<div class="form-group">
					<div>
						<input type="email" class="form-control" id="email"	name="email" placeholder="ex) E-mail@gmail.com" value="${member.email}">
					</div>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-lg btn-secondary btn-block" id="pwfind">비밀번호 찾기</button>
					<a class="btn btn-danger btn-block"	href="<%=context%>">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<!-- The Modal -->
<div class="modal" id="myModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" id="modalClose"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
	                  찾으시는 ID는 <span id="id_value"></span>입니다.      	
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><a href="login">로그인</a></button>
       <!--  <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><a href="">비밀번호 찾기</a></button> -->
      </div>
		<div class="modal-footer2"></div>
    </div>
  </div>
</div>
</body>
</html>