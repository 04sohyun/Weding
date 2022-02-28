<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
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
.b {
	word-break: break-all;
	width: 80%;
}

 .progress-bar-info {
    	background-image: linear-gradient(to bottom,#2F3A8F 0,#2F3A8F 100%) !important;
    }
</style>

<script type="text/javascript">
var contextPath='${pageContext.request.contextPath}';
var src='${pageContext.request.contextPath}/images/';
var contextPath='${pageContext.request.contextPath}';

//찜하기 
function getDibsProduct(p_num){
	var dibsBut = document.getElementById('dibsBut');
	/* alert("p_num"+p_num); */
	let dibsP_num = $("#p_num").val();
	$.ajax({
		url:"<%=context%>/getDibsProduct",
		data:{p_num:dibsP_num},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				alert("찜목록에 추가되었습니다."); 
				window.location.reload();
			}
		}
	});
}	
	
//찜하기 취소
function cancleDibsProduct(p_num){
	var dibsBut = document.getElementById('dibsBut');
	/* alert("p_num"+p_num); */
	let dibsP_num = $("#p_num").val();
	$.ajax({
		url:"<%=context%>/cancleDibsProduct",
		data:{p_num:dibsP_num},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				alert("찜목록에서 삭제되었습니다."); 
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

<script type="text/javascript"> 

function listReview() { 
	var p_num = $('#review-p_num').val(); 
	console.log(p_num);
	$.ajax({ 
		url: "<%=request.getContextPath()%>/reviewBoardList", 
		type: 'POST', 
		data: {p_num: p_num}, 
		dataType: 'JSON', 
		success: function(data) { 
			var html = ""; 
			console.log(data.length); 
			if(data.length > 0) { 
				
				$(data).each(function(){ 
					html += "<tr style='text-align: center'>"; 
					 
					html += "<td>"; 
					html += this.b_num; 
					html += "</td>"; 
					 
					html += "<td style='text-align: left'>"; 
					html += this.b_content; 
					html += "</td>"; 
					 
					html += "<td>"; 
					html += this.b_date; 
					html += "</td>"; 
					 
					html += "<td>"; 
					html += this.id; 
					html += "</td>"; 
					 
					html += "</tr>"; 
				}); 
			} 
			 
			$("#commentList").html(html); 
			console.log("review List"); 
		} 
	}); 
} 
 
$(function(){ 
    listReview(); 
    $('#writeReview').click(function() {
    	var id = $('#id').val(); 
    	
    	if (id.length != 0) {
    	
   		var reviewContent = $('#b_content').val(); 
    	var p_num = $('#review-p_num').val();
 
        $.ajax({ 
            url: "<%=request.getContextPath()%>/reviewBoardWrite", 
            type: 'POST', 
            data: {b_content : reviewContent, 
            	   p_num: p_num, 
            	   id: id}, 
            dataType: 'text', 
            success: function(data) { 
            	if(data == '1') { 
            		$('#b_content').val(""); 
                    listReview(); 
            	} 
            }, error: function(error) { 
                alert("error"+error); 
            } 
        }); 
        
    	} else {
    		alert('로그인을 해주세요.');
    		location.href='login';
    	}
    	
    }); 
}); 
</script>
<script>
function orderFormChk() { 
	let qty = $('#qty').val(); 
	const member = document.getElementById('member');
	 
	if(member.value.length > 0) {
		// 수량이 0이하면 주문 불가 
		if(qty > 0) {
			return true;
		} else {
			alert('수량을 확인해주세요.');
			return false;
		}
	} else {
		alert('로그인을 해주세요.');
		location.href='login';
		return false;
	}
}
</script>

<title>상품 상세보기</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="bg-header">
	<div class="bg" style="filter:brightness(50%); background-image: url(${pageContext.request.contextPath}/upload/${product.p_image1})" ></div>
	<div class="bg-text1"><p>${product.mini_content}</p></div>
	<div class="bg-text2" style="color: white;"><b><h1>${product.p_name}</h1></b></div>
</div>
<div class="container" style="margin-top: 70px;">
	<div class="row" style="margin-top: 50px; margin-bottom: 100px;">
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
						<!-- 펀딩기간 -->
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
		<c:choose>
		<c:when test="${product.p_condition==2 }">
			<div class="col-4">
				<div class="row">
		<!-- 남은 펀딩기간 계산하기 -->
					<div><h1>${product.leftdate}</h1></div>
		<!-- 달성률 계산하기 -->	
					<div class="progress" style="padding: 0px; margin-left: 15px; margin-top: 10px; height: 30px;">
						<div class="progress-bar progress-bar-info" style="width:${attainment}%" role="progressbar" aria-valuenow="${attainment}"
                                      aria-valuemin="0" aria-valuemax="100">
               			 </div>
               		</div>
					<div>${attainment}% 달성</div>
					<div style="margin-top:10px;"><h3><fmt:formatNumber value="${product.p_currentprice}"/>원 펀딩</h3></div>
					<div><p><b style="font-size:30px;">${product.countOrders}</b>명의 서포터</p></div>
					<div align="right">
						<input type="hidden" id="member" value="${member }">
						<form action="orderForm" method="post" onsubmit="return orderFormChk()">
							<input type="number" id="qty" name="o_qty" value="1" class="col-md-2">
							<input type="hidden" name="p_num" id="p_num" value="${product.p_num }">
							<input type="hidden" name="p_price" value="${product.p_price }">

							<h2 style="margin: 5px 0px 40px  0px; height: 50px;"><fmt:formatNumber value="${product.p_price}"/>원</h2>
							<c:choose>
								<c:when test="${orderCheck eq 0 || orderCheck eq null }">
									<input type="submit" class="btn col-md-12"
										style="font-size: 15px; padding-top: 10px; padding-bottom: 10px; background-color: #2F3A8F; color: #fff;"
										value="주문하기">
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-secondary col-md-12"
										style="font-size: 15px; padding-top: 10px; padding-bottom: 10px;"
										value="주문완료" disabled>
								</c:otherwise>
							</c:choose>

							</form>
					</div>
					<div class="row d-grid gap-2 col-12 mx-auto" style="margin-top: 10px;" align="center">
					<p>
					<input type="hidden" id="p_num" value="${product.p_num}">
					<c:if test="${count==1}">
						<button type="button" id ="dibsBut" class="btn btn-light" onclick="cancleDibsProduct(${product.p_num})"><a style="text-decoration: none; color: black;">찜하기 취소</a></button>
					</c:if>
					<c:if test="${count==0}">
						<button type="button" id ="dibsBut" class="btn btn-light" onclick="getDibsProduct(${product.p_num})"><a style="text-decoration: none; color: black;">찜하기</a></button>
					</c:if>
						<button type="button" class="btn btn-light"><a href="boardList?main_cat=300&mini_cat=300&p_num=${product.p_num} " style="text-decoration: none; color: black;">1:1문의</a></button>
						<button type="button" class="btn btn-light" onclick="clip(); return false;"><a>공유하기</a></button>
						</p>
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${product.p_condition==3 }">
			<div class="col-4">
		<div class="row">
		<!-- 남은 펀딩기간 계산하기 -->
			<div><h1>${product.leftdate}</h1></div>
		<!-- 달성률 계산하기 -->	
			<div class="progress" style="padding: 0px; margin-left: 15px; margin-top: 10px; height: 30px;">
				<div class="progress-bar progress-bar-info" style="width:${attainment}%" role="progressbar" aria-valuenow="${attainment}"
                                      aria-valuemin="0" aria-valuemax="100">
                </div>
               </div>
			<div>${attainment}% 달성</div>
			<div style="margin-top:10px;"><h3><fmt:formatNumber value="${product.p_currentprice}"/>원 펀딩</h3></div>
			<div><p><b style="font-size:30px;">${product.countOrders}</b>명의 서포터</p></div>
			<div class="row" style="margin-top: 40px;">
				<div class="col" style="background-color: #F7F8F9; height: 100px;">
					<div style="text-align=center; padding: 10px;">
						[${product.p_name}] 상품은 펀딩이 종료된 상품입니다.<br>
						<c:choose>
                        <c:when test="${attainment>=100}">
                        소중한 서포터들의 펀딩과 응원으로 <fmt:formatDate value="${endDate}" pattern="yyyy.MM.dd"/>에 성공적으로 종료되었습니다.
                        다음에 만나요!
                        </c:when>
                        <c:otherwise>
                           이 프로젝트는 아쉽게도 목표금액을 달성하지 못한채 ${product.p_end}에 종료되었습니다.
                        </c:otherwise>
                     </c:choose>
					</div>
				</div>
			</div>
			</div>
		</div>
		</c:when>
		</c:choose>

			<div class="col-1"></div>

			<div class="row" style="margin-top: 30px;">
				<div class="col-1"></div>
				<div class="col-10">
					<img
						src="${pageContext.request.contextPath}/upload/${product.p_image2}"
						class="figure-img img-fluid rounded" alt="상품상세"
						style="max-width: 100%; height: auto;">
				</div>
				<div class="col-1"></div>
			</div>
		</div>

		<c:if test="${product.p_condition == 3 && attainment >= 100}">
		<h1>[${product.p_name}] 상품의 Review</h1>
		<hr>	
		<div class="row" style="margin-top: 50px;">
			
				<form>
					<input type="hidden" id="review-p_num" value="${product.p_num}">
					<table class="table">
						<tr class="table-dark" style="text-align: center">
							<th>번호</th>
							<th style="width:1000px;">내용</th>
							<th>작성일</th>
							<th>작성자</th>
							
						</tr>
						<tbody id="commentList">
						</tbody>
				        <c:if test="${orderCheck > 0 }">
						<tr>
							<td colspan="4" style=" border-top:30px solid #fff;">
								<input type="hidden" name="id" id="id" value="${member.id }"> 
								<div class="row" style="text-align:center;">
									<div class="col-11">
										<textarea rows="5" cols="150" name="b_content" style="width:100%;height:50%" id="b_content"></textarea>
									</div>
									<div class="col-1">
										<input type="button" value="리뷰작성" id="writeReview" class="btn" style="border: 1px solid #2F3A8F; color: #2F3A8F; width:100%;height:50%;">
									</div>
								</div>
							</td>
						</tr>
						</c:if>
					</table>
				</form>
				</div>
			</c:if>
		

		<!-- Related items section-->
		<section class="py-5 bg-light" style="margin-top: 100px;">
			<div class="container px-4 px-lg-5 mt-5">
				<h2 class="fw-bolder mb-4">이런 상품은 어떠세요?</h2>
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:if test="${not empty	productList }">
						<c:forEach items="${productList}" var="recommend" end="3">
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/upload/${recommend.p_image1}"
										alt="..." height="250" />
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
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto"
												href="fundingDetail?p_num=${recommend.p_num}&p_condition=${recommend.p_condition}">상품보러가기</a>
										</div>
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