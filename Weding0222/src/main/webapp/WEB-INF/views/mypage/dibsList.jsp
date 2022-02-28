<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
</script>

<style>
    .body-title{
        text-align: center;
    }

    .row{
        width: 0 auto;
    }

    .container{
        width: 1140px;
        align-content: center;
    }

    .productBody{
        width: 250px;
        height: auto;
    }
    
    .card{
    	width: 23%;
    	height: 440px;
    	float: left;
    	margin-right: 5px;
    	margin-bottom: 80px;
    }
</style>

<title>dibsList 찜목록</title>
<%@include file = "../header.jsp"%>

</head>
<body>
<div class="container">
    <div class="body-title">
            <h2>찜목록</h2>
	</div>
    <hr>
    <div class="row">
    	<%@include file = "menu.jsp"%>
        
        <div class="col-10">
            <div class="row row-cols-1 row-cols-md-9 g-4">
                <div class="productBody">
                	<!-- forEach 시작 -->
                		<c:forEach var="product" items="${dibsList}">
		                    <div class="card h-80">
		                        <img src="http://placehold.it/45x45" class="card-img-top" alt="...">
		                        <div class="card-body">
		                            <h5 class="card-title"><a href="fundingDetail?p_num=${product.p_num}&p_condition=${product.p_condition}">${product.p_name}</a></h5>
		                            <p class="card-text">${product.mini_content} | ${product.id}</p>
		                            <div class="progress">
		                                <div class="progress-bar" style="width: ${product.attainment}%" role="progressbar" aria-valuenow="${product.attainment}"
		                                aria-valuemin="0" aria-valuemax="100"></div>
		                            </div>
		                            <div class="row" style="font-size: 10px;">
		                                <div class="col-3">
		                                    ${product.attainment}%
		                                </div>
		                                <div class="col">
		                                    ${product.p_goalprice}
		                                </div>
		                                <div class="col-4">
		                                    ${product.leftdate}
		                                </div>
		                            </div>
		                        </div>
		                    </div>
                    	</c:forEach>
                    <!-- forEach 끝 -->
                </div>
			</div>
		</div>
	</div>
</div>

<%@ include file = "../footer.jsp"%>
</body>
</html>