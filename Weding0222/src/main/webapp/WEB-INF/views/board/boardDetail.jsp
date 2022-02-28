<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	console.log('${board}');
</script>
<meta charset="UTF-8">
<title>게시판 조회</title>
<%@ include file="../header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.container {
	text-align: center;
}

.but {
	float: right;
	padding: 30px;
}

.nickname {
	font-size: 10pt;
	text-align: center;
	vertical-align: bottom;
}

textarea {
	resize: vertical;
	width: 678px;
}

img {
	
	height: 50px;
}

article {
	width: 700px;
	margin: 0 auto;
}

article .textarea {
	width: 700px;
	text-align: left;
/* 	padding: 1rem 1rem; */
}

.board-title {
	width: 700px;
	height: 2rem;
}

.board-title h3 {
	display: block;
	float: left;
}

.board-write-info {
	float: right;
	list-style: none;
}

.board-write-info li {
	margin-left: 10px;
	display: inline-block;
}

.board-img {
	width: 700px;
	height: 400px;
	margin-bottom: 2rem;
	background-color: #ccc;
}

.board-btn {
	
	margin-top: 3.5rem;	
	width: 700px;	
	height: 3rem;
	
	
}


.board-btn button,
.board-btn input[type=button],
.board-btn input[type=submit] {
	display: block;
	float:right;
	margin-right: 5px;
}

.board-img img {
	width: 700px;
	height: 400px;
	object-fit: cover;
}
</style>

</head>
<body>

	<div class="container">
		<div class = "sub-banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 300}">
    			<h1 class="sub-title">1:1 문의사항</h1>
    		</c:if>
    	</div>	
	
		<article>
		<div class="board-title">
			<h3>${board.b_title}</h3>
			<ul class="board-write-info">
				<li><a class="nickname">${board.id}</a></li>
				<li><a class="nickname">${board.b_date}</a></li>
			</ul>
		</div>
		<hr>
		<c:choose>
			<c:when test="${not empty board.b_image}">
				<div class="board-img">
					<img src="${pageContext.request.contextPath}/upload/${board.b_image}">
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		<div class="textarea"><pre>${board.b_content}</pre></div>

<%--
		이 글(detail)이 가지고 있는 p_num  :  ${board.p_num}
		product.p_num : ${product.p_num}
		board.p_num : ${board.p_num}
		member.id : ${member.id}
		product.id : ${product.id}
 --%>



		<!-- button -->
		<div class="board-btn">
		<button class="btn btn-outline-danger" onclick="history.back()">목록</button>
		<c:choose>
			<c:when test="${member != null}">
			<c:choose>

						<c:when test="${board.mini_cat == 100 && member.id == 'admin'}">
								<button class="btn btn-outline-primary"
									onclick="location.href = 'updateForm?b_num=${board.b_num}'">수정</button>
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input type="hidden" name="p_num"    value="${board.p_num }">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
						</c:when>
						
						<c:when test="${board.mini_cat == 200 && member.id == 'admin'}">
								
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input type="hidden" name="p_num"    value="${board.p_num }">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
								
									<button type="button" class="btn btn-outline-success"
											onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>

									<c:choose>
										<c:when test = "${board.id == member.id}">
										<button class="btn btn-outline-primary"
											onclick="location.href = 'updateForm?b_num=${board.b_num}'">수정</button>
										</c:when>
									</c:choose>
						</c:when>
						
						
						<c:when test="${board.mini_cat == 300 && member.id == 'admin'}">
								
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input type="hidden" name="p_num"    value="${board.p_num }">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
						</c:when>
						
						
						
						
						<c:when test="${board.id == member.id }"> 
								<button class="btn btn-outline-primary"
									onclick="location.href = 'updateForm?b_num=${board.b_num}'">수정</button>
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input type="hidden" name="p_num"    value="${board.p_num}">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
								
									<c:choose>
											 <c:when test = "${idResult == 1}">
						  						<button type="button" class="btn btn-outline-success"
												onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
											 </c:when>
									</c:choose>
						 </c:when>
						
						 <c:when test = "${idResult == 1}">
						  						<button type="button" class="btn btn-outline-success"
												onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
						 </c:when>
						
						
					</c:choose>

			</c:when>
		</c:choose>
		</div>
		</article>

	</div>


	<%@ include file="../footer.jsp"%>
</body>
</html>