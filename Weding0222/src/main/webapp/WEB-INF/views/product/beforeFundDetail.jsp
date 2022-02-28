<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
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
<link href="css/fundDetail.css" rel="stylesheet">
<style>
button{
	width: 350px;
	height: 45px;
}

.b {
	word-break: break-all;
	width : 80%;
}

.button {
	color: grey;
	border-radius: 3px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    font-size: 13px;
    background-color: white;
    border: 1px solid #e7e7e7;
}

.button:hover {
    color: black;
    font-size: 13px;
    border: 1px solid black;
    
}

</style>
<title>상품 상세보기</title>

<script type="text/javascript">
//알림신청하기
function getPlzAlarm(p_num){
	/* alert("p_num="+p_num); */
	let alarmP_num = $("#p_num").val();
	let alarmP_start = $("#p_start").val();
	/* alert("alarmP_num="+alarmP_num);
	alert("alarmP_start="+alarmP_start); */
	$.ajax({
		url : "<%=context%>/plzAlarm",
		data : {p_num:alarmP_num, a_date:alarmP_start},
		dataType : 'text',
		success:function(data){
			if(data=='1'){
				alert("알림신청 됐습니다.");
				window.location.reload();
			}
		}
	});
}

function canclePlzAlarm(p_num){
	/* alert("p_num"+p_num); */
	$.ajax({
		url : "<%=context%>/canclePlzAlarm",
		data : {p_num : p_num},
		dataType : 'text',
		success:function(data){
			if(data=='1'){
				alert("알림신청이 취소되었습니다.");
				window.location.reload();
			}
		}
	});
}
</script>
<!-- 주소복사 script -->
<script type="text/javascript">

function clip(){

   var url = '';
   var textarea = document.createElement("textarea");
   document.body.appendChild(textarea);
   url = window.document.location.href;
   textarea.value = url;
   textarea.select();
   document.execCommand("copy");
   document.body.removeChild(textarea);
   alert("URL이 복사되었습니다.")
}

</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="bg-header">
	<div class="bg" style="filter:brightness(50%); background-image: url(${pageContext.request.contextPath}/upload/${product.p_image1})"></div>
	<div class="bg-text1"><p>${product.mini_content}</p></div>
	<div class="bg-text2" ><h1>${product.p_name}</h1></div>
</div>	
<div class="container" style="margin-top: 70px;">
	<div class="row" style="margin-top: 50px;">
		<div class="col-1"></div>
		<div class="col-6" style="width: 50%">
			<div class="row">
				<div class="col">
					<img src="${pageContext.request.contextPath}/upload/${product.p_image1}"
						 alt="상품" width="500" height="450">
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col">
						<h2 class="b">${product.p_description}</h2>
					</div>
				</div>
			</div>
			<div class="row" style="width: 80%; margin-top: 20px;">
				<div class="col" style="background-color: #F7F8F9;">
					<div style="text-align=center; padding: 10px;">
						<div class="col">목표금액 <fmt:formatNumber value="${product.p_goalprice}"/>원</div>
						<c:set var="start" value="${product.p_start}"/>
						<c:set var="end" value="${product.p_end}"/>
						<fmt:parseDate var="startDate" value="${start}" pattern="yy-MM-dd" /> 
						<fmt:parseDate var="endDate" value="${end}" pattern="yy-MM-dd" /> 
						<div class="col">펀딩기간 <fmt:formatDate value="${startDate}" pattern="yyyy.MM.dd" />~<fmt:formatDate value="${endDate}" pattern="yyyy.MM.dd" /></div>
						<div class="col">100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100%
							모이지 않으면 결제가 진행되지 않습니다.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-4" >
			<div class="row" style="margin-top: 50px;">	
				<div class="d-grid gap-2 col-6" style="margin-left: 0px;">
					<input type="hidden" id="p_num" value="${product.p_num}">
					<input type="hidden" id="p_start" value="${product.p_start}">
					<c:if test="${alarmCount==0}">
						<button class="button" onclick="getPlzAlarm(${product.p_num})">알림 신청 ${product.countAlarm}명</button>
					</c:if>
					<c:if test="${alarmCount==1}">
						<button class="button btn-dark" onclick="canclePlzAlarm(${product.p_num})">알림 중 ${product.countAlarm}명</button>
					</c:if>
					<button class="button" onclick="clip(); return false;">공유하기</button>
					<c:if test="${loginId=='admin'}">
						<button class="button"><a href="mailTransport?p_num=${product.p_num}" style="text-decoration: none; color:black;">Mail 보내기</a></button>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div style="margin-top: 50px;">
					지금 알림 신청하고 상품 오픈에 대한 소식을 놓치지 마세요! 
				</div>
			</div>
		</div>

		<div class="col-1"></div>

		<div class="row" style="margin-top: 100px">
			<div class="col-1"></div>
			<div class="col-10">
				<img src="${pageContext.request.contextPath}/upload/${product.p_image2}"
					class="figure-img img-fluid rounded" alt="상품상세"
					style="max-width: 100%; height: auto;">
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	<!-- Related items section-->
    <section class="py-5 bg-light" style="margin-top: 100px;">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder mb-4">Related products</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		        <c:if test="${not empty	productList }">
		        <c:forEach items="${productList}"  var="recommend" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${pageContext.request.contextPath}/upload/${recommend.p_image1}"  alt="..." height="250" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h3 class="fw-bolder">${recommend.p_name}</h3>
                                   	${recommend.mini_content}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" 
                                		href="fundingDetail?p_num=${recommend.p_num}&p_condition=${recommend.p_condition}">상품보러가기</a></div>
                            </div>
                        </div>
                    </div>
		        </c:forEach>
		        </c:if>
          </div>
       </div>
	</section>
</div>
	
<!-- JavaScript Bundle with Popper -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous"></script>

<%@include file="../footer.jsp"%>
</body>
</html>