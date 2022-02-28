<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/fonts.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.random-wrap {
	width: 75%;
	height: 675px;
	padding: 0 20px;
	float: left;
	margin-bottom: 75px;
}

.intro-title {
	font-size: 1.6em;
	font-weight: bold;
	margin-bottom: 20px;
}

.heritage {
	width: heritage;
}

.random-prod {
	width: 250px;
	float: left;
	margin-bottom: 50px;
}

.random-prod img {
	width: 200px;
	height: 200px;
}

.random-prod:nth-child(2n) {
	margin-left: 15px;
}

.random-prod:nth-child(3n) {
	margin-left: 15px;
}

.random-prod:nth-child(4n) {
	margin-left: 0px;
}

.random-prod:nth-child(5n) {
	margin-left: 15px;
}

.random-prod-title {
	margin-top: 5px;
}

.popular-wrap {
	width: 25%;
	height: 675px;
	float: left;
	margin-bottom: 75px;
}

.popular-prod {
	width: heritage;
	height: 100px;
	margin-bottom: 25px;
}

.popular-prod-text {
	width: 177px;
	height: 100px;
	float: left;
	padding-top: 30px;
}

.popular-prod-img {
	width: 100px;
	height: 100px;
	float: left;
}

.popular-prod-img img {
	width: 100px;
	height: 100px;
}

.open {
	margin-bottom: 100px;
}

.open-prod-wrap {
	width: heritage;
	height: 250px;
	padding: 0 10px;
}

.open-prod {
	width: 165px;
	height: heritage;
	float: left;
	margin-right: 20px;
}

.open-prod:last-child {
	margin-right: 0px;
}

.open-prod-img {
	width: 165px;
	height: 165px;
	margin-bottom: 10px;
}

.open-prod-img img {
	width: 165px;
	height: 165px;
}

.open-prod-text {
	width: 165px;
}

.open-prod-img img, .popular-prod-img img, .open-prod-img img,
	.random-prod img {
	object-fit: cover;
}

.carousel-inner {
	height: 350px;
}

.item active img {
	object-fit: cover;
}

.box-challenge {
	margin-bottom: 60px;
}

</style>
</head>
<body>
	<div id="page-container">
		<!-- 베너 시작 -->
		<section class="box-challenge">
			<div style="width: 100%; margin: 0 auto;">

				<div id="carousel-example-generic" class="carousel slide">

					<ol class="carousel-indicators" style="margin: 0 auto;">
						<!-- 이미지 갯수만큼 갯수 늘리기 -->
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<!-- li 태그와 이미지 갯수 일치해야함 -->
						<div class="item active">
							<!-- 아미지 설정1 -->
							<img src="images/banner1.jpg" style="width: 100%">
							<div class="carousel-caption" style="color: black;">글쓸수
								있음${product.p_name}</div>
						</div>
						<!-- 아미지 설정2 -->
						<div class="item">
							<img src="images/banner2.jpg" style="width: 100%">
							<div class="carousel-caption" style="color: black;">글쓸수
								있음${product.p_name}</div>
						</div>
						<!-- 아미지 설정3 -->
						<div class="item">
							<img src="images/banner3.jpg" style="width: 100%">
							<div class="carousel-caption" style="color: black;">글쓸수
								있음${product.p_name}</div>
						</div>
						<!-- 아미지 설정4 -->
						<div class="item">
							<img src="images/banner4.jpg" style="width: 100%">
							<div class="carousel-caption" style="color: black;">글쓸수
								있음${product.p_name}</div>
						</div>
					</div>
					<!-- 왼쪽 화살표 버튼 -->
					<!-- href는 carousel의 id를 가르킨다. -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <!-- 왼쪽 화살표 --> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</a>
					<!-- 오른쪽 화살표 버튼 -->
					<!-- href는 carousel의 id를 가르킨다. -->
					<a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <!-- 오른쪽 화살표 --> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</a>
				</div>
			</div>
		</section>
		<script>
    $(function(){
	    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
	    $('#carousel-example-generic').carousel({
		    // 슬리아딩 자동 순환 지연 시간
		    // false면 자동 순환하지 않는다. 1/1000 초
		    interval: 2500,
		    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		    pause: "hover",
		    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		    wrap: true,
		    // 키보드 이벤트 설정 여부(?)
		    keyboard : true
	    });
    });
</script>
		<!-- 베너 끝 -->

		<!-- 상품 목록 -->
		<div class="container">
			<!-- 랜덤상품-->
			<div class="random-wrap">
				<div class="intro-title">위딩의 여러 상품들을 만나보아요!</div>
				<div class="heritage">

					<!-- 반복 여기서부터 -->
					<c:forEach var="random" items="${randomProduct }">
						<div class="random-prod"
							onclick="location.href='fundingDetail?p_num=${random.p_num}&p_condition=${random.p_condition }'"
							style="cursor: pointer">
							<img
								src="${pageContext.request.contextPath}/upload/${random.p_image1}">
							<div class="random-prod-title">${random.p_name}</div>
							<div class="random-prod-title" style="font-size:13px;">달성률 ${random.attainment}% |
								${random.mini_content}</div>
						</div>
					</c:forEach>
					<!-- 여기까지 반복 -->
				</div>
			</div>

			<!-- 인기상품 -->
			<div class="popular-wrap">
				<div class="intro-title">인기상품</div>
				<div class="heritage">
					<!-- 반복 여기서부터 -->
					<c:forEach var="popular" items="${popularProduct }">
						<div class="popular-prod"
							onclick="location.href='fundingDetail?p_num=${popular.p_num}&p_condition=${popular.p_condition }'"
							style="cursor: pointer">
							<div class="popular-prod-text">
								<div class="random-prod-title">${popular.p_name}</div>
								<div class="random-prod-title" style="font-size:13px;">달성률 ${popular.attainment}%
									| ${popular.mini_content}</div>
							</div>
							<div class="popular-prod-img">
								<img
									src="${pageContext.request.contextPath}/upload/${popular.p_image1}">
							</div>
						</div>
					</c:forEach>

					<!-- 여기까지 반복 -->
				</div>
			</div>

			<!-- 오늘 오픈한 상품 -->
			<div class="open">
				<div class="intro-title">오늘 오픈 상품</div>
				<div class="open-prod-wrap">
					<!-- 반복 여기서부터 -->
					<c:forEach var="open" items="${openProduct }">
						<div class="open-prod"
							onclick="location.href='fundingDetail?p_num=${open.p_num}&p_condition=${open.p_condition }'"
							style="cursor: pointer">
							<div class="open-prod-img">
								<img
									src="${pageContext.request.contextPath}/upload/${open.p_image1}">
							</div>
							<div class="open-prod-text">
								<div class="open-prod-title">${open.p_name }</div>
								<div class="open-prod-title" style="font-size:13px;">달성률 ${open.attainment}% |
									${open.mini_content }</div>
							</div>
						</div>
					</c:forEach>
					<!-- 여기까지 반복 -->
				</div>
			</div>

			<!-- 리뷰 상품 -->
			<div class="open">
				<div class="intro-title">리뷰가 있는 상품</div>
				<div class="open-prod-wrap">
					<!-- 반복 여기서부터 -->
					<c:forEach var="review" items="${reviewProduct }">
						<div class="open-prod"
							onclick="location.href='fundingDetail?p_num=${review.p_num}&p_condition=${review.p_condition }'"
							style="cursor: pointer">
							<div class="open-prod-img">
								<img
									src="${pageContext.request.contextPath}/upload/${review.p_image1}">
							</div>
							<div class="open-prod-text">
								<div class="open-prod-title">${review.p_name }</div>
								<div class="open-prod-title" style="font-size:13px;">달성률 ${review.attainment}% |
									${review.mini_content }</div>
							</div>
						</div>
					</c:forEach>
					<!-- 여기까지 반복 -->
				</div>
			</div>
		</div>
	</div>
	<!-- 상품 목록  끝 -->
	<%@ include file="footer.jsp"%>
</body>
</html>