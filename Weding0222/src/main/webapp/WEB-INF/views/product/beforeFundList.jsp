<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style>
.pagination {
	justify-content: center;
}

</style>

<title>beforeFundList</title>
</head>
<body>

<!-- 배너 시작 -->
<section class="box-challenge" style="border: 1px solid; border-left: 1px solid;"> 
	<div style="width: 100%; margin: 0 auto;">
    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
       	 <ol class="carousel-indicators" style="margin: 0 auto;">
            <!-- 이미지 갯수만큼 갯수 늘리기 -->
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
       	 </ol>
         <div class="carousel-inner" role="listbox">
            <!-- li 태그와 이미지 갯수 일치해야함 -->
           	<!-- 이미지 설정1 -->
            <div class="item active">
              <a href="fundingDetail?p_num=27&p_condition=1">
                <img src="${pageContext.request.contextPath}/upload/food015-1.jpg" style="margin: auto; height: 350px; width:50%;">
                <div class="carousel-caption" style="text-align: left; color: #2F3A8F;">
                    <h2>24년 노하우를 가득 담은 국물쫄면</h2>
                    교동 온쫄면, 냉쫄면
                </div>
              </a>    
            </div>
            <!-- 이미지 설정2 -->
            <div class="item">
              <a href="fundingDetail?p_num=20&p_condition=1">
                <img src="${pageContext.request.contextPath}/upload/food008-1.jpg" style="margin: auto; height: 350px; width:50%;">
                <div class="carousel-caption" style="text-align: left; color: #2F3A8F;">
                    <h2>설탕보다 300배 이상 단 스테비아와</h2>
                    <h2>건강하고 꾸덕한 그릭요거트의 만남!</h2>
                    스테비아 그릭요거트
                </div>
              </a>    
            </div>
            <!-- 이미지 설정3 -->
            <div class="item">
             <a href="fundingDetail?p_num=66&p_condition=1">
                <img src="images/peng.png" style="margin: auto; height: 350px; width:50%;">
                <div class="carousel-caption" style="text-align: left; color: #2F3A8F;">
                    <h2>펭수와 함께</h2> 
                    <h2>눈치정복할 준비되셨습니까?</h2>
                    눈치챙겨 2탄, 후드티로 돌아왔다!
                </div>
             </a>    
            </div>
        </div>
        <!-- 왼쪽 화살표 버튼 -->
        <!-- href는 carousel의 id를 가르킨다. -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <!-- 왼쪽 화살표 -->
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        </a>
            <!-- 오른쪽 화살표 버튼 -->
            <!-- href는 carousel의 id를 가르킨다. -->
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <!-- 오른쪽 화살표 -->
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
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
		    interval: 3000,
		    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		    pause: "hover",
		    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		    wrap: true,
		    // 키보드 이벤트 설정 여부(?)
		    keyboard : true
	    });
	    $("#carousel-example-generic").on('slide.bs.carousel', function(){
	        
	        currentIndex = $('div.active').index()+1;
	        if (currentIndex=="1") {
	            $("#carousel-example-generic").css("background-color","white");
	        } else if (currentIndex=="2") {
	            $("#carousel-example-generic").css("background-color","white");
	        } else {
	            $("#carousel-example-generic").css("background-color","white");
	        }
	      });
    });
</script>
<!-- 배너 끝 -->

<div class="container">
	<div class="row" style="width: 900px; margin: auto;">
		<div class="col" style="padding: 55px 90px 55px 80px; margin-top: 40px; width: 500px; background-repeat:no-repeat; background-size:cover; font-size:18px; color:#2F3A8F; 
			background-image: url(images/sub-banner-img.png)"><h2>직접 체험하고 펀딩하세요</h2> <p>위딩에서 만나는 오픈예정 펀딩</p></div>
	</div>

	<div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top: 30px;">
		<!-- 펀딩 예정 상품 목록 반복 시작 -->
		<c:forEach var="product" items="${productList}">
		<div class="col" onclick="location.href='fundingDetail?p_num=${product.p_num}&p_condition=${product.p_condition}'" style="cursor: pointer; margin-top: 30px; padding: 3px;">
			<div class="card h-100" style="width: 300px; margin: auto;">
				<img src="${pageContext.request.contextPath}/upload/${product.p_image1}" class="card-img-top" width="300" height="300" alt="...">
				<div class="card-body">
					<h3 class="card-title">${product.p_name}</h3>
					<p class="card-text">${product.p_start} | ${product.p_time} 오픈예정</p>
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- 펀딩 예정 상품 목록 반복 끝 -->
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