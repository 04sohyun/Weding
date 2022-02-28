<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>펀딩내역</title>
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

.paging {
	margin: 0 auto;
} 
</style>
</head>
<body>
	<div class="container">
		<div class="sub-banner">
			<h2 class="sub-title">펀딩내역</h2>
		</div>
		<div class="row">
		<%@include file="menu.jsp"%>
			<div class="col-10">
				<table class="table" style="text-align: center;">
					<tr style="--bs-table-bg: #2F3A8F;color:#fff;">
						<th>주문번호</th>
						<th>주문일자</th>
						<th>주문상품</th>
						<th>결제금액</th>
						<th>펀딩상태</th>
						<th>배송현황</th>
						<th>취소</th>
					</tr>
					<c:if test="${not empty payList}">
						<c:forEach var="pay" items="${payList}">
							<form action="payDelete" method="post" name="payDelete"
								onsubmit="return confirm('정말로 취소하시겠습니까?')">
								<tr>
									<td>${pay.o_num }</td>
									<td>${pay.o_payday }</td>
									<td style="text-align:left;text-overflow:ellipsis;overflow:hidden"><a href="fundingDetail?p_num=${pay.p_num }&p_condition=${pay.p_condition}">${pay.p_name }</a></td>
									<td><fmt:formatNumber value="${pay.o_sum }"/>원</td>
									<td><c:if test="${pay.p_condition == 2}">
	                        		펀딩중
	                        	</c:if> <c:if test="${pay.p_condition == 3}">
	                        		펀딩종료
	                        	</c:if></td>
									<td>${pay.o_shipStatus }</td>
									<!-- 펀딩 종료 상품은 주문 취소 불가능하게 -->
									<td><input type="hidden" name="id" value="${pay.id}">
										<input type="hidden" name="p_num" value="${pay.p_num}">
										<input type="hidden" name="o_num" value="${pay.o_num}">
										<input type="hidden" name="o_sum" value="${pay.o_sum}">
										<c:if test="${pay.p_condition == 2}">
											<button type="submit" class="btn btn-warning">취소</button>
										</c:if> <c:if test="${pay.p_condition == 3}">
											<button type="submit" class="btn btn-warning" disabled="disabled">취소</button>
										</c:if></td>
								</tr>
							</form>
						</c:forEach>
					</c:if>
					<c:if test="${empty payList}">
						<tr>
							<td colspan="7">펀딩한 상품이 존재하지 않습니다</td>
						</tr>
					</c:if>
				</table>
				
				<nav aria-label="..." class="paging" style="width: fit-content;">
			  <ul class="pagination">
			  	<c:if test="${pg.startPage > pg.pageBlock}">
				    <li class="page-item">
				      <a class="page-link" href="payList?currentPage=${pg.startPage - pg.pageBlock}">&laquo;</a>
				    </li>
			    </c:if>
			    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
				    <li class="page-item">
				    		<a class="page-link" href="payList?currentPage=${i}">${i}</a>
		    		</li>
		   		</c:forEach>
		   		<c:if test="${pg.endPage < pg.totalPage}">
				    <li class="page-item">
				      <a class="page-link" href="payList?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
			
			</div>
			
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