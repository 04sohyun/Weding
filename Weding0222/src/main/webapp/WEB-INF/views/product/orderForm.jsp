<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>결제 정보 입력</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

</script>

</head>
<body>
    <body>
		<form action="orderSuccess" method="post" name="orderForm">
          	<input type="text" name="id" id="order-id">
          	<input type="text" name="p_num" id="order-p_num">
          	<input type="text" name="p_name" id="order-p_name">
          	<input type="text" name="o_num" id="order-o_num">
          	<input type="text" name="o_qty" id="order-o_qty">
          	<input type="text" name="o_sum" id="order-o_sum">
          	<input type="text" name="o_phone" id="order-o_phone">
          	<input type="text" name="o_zipcode" id="order-o_zipcode">
          	<input type="text" name="o_roadAddress" id="order-o_roadAddress">
          	<input type="text" name="o_detailAddress" id="order-o_detailAddress">
          	<input type="text" name="success" id="order-success">
        </form>
    
        <div>
            <p>상품정보</p>
            <img src="http://placehold.it/250x250">
            <p>	
            	<input type="hidden" name="p_name" id="p_name" value="${orderProduct.p_name}">
            	${orderProduct.p_name}
           	</p>




        </div>
        <table>
            <tr>
                <td><input type="radio" id="shipping" name="shipping">기본배송지</td>
            </tr>
            
            <tr>
                <td>받는분:</td>
                <td>
        	        <input type="hidden" name="id" id="id" value="${member.id }">
                	<input type="text" name="o_name" id="o_name" value="">
               	</td>
            </tr>

           
            <tr>
                <td>배송 주소:</td>
                <td><input type="text" size="15" name="o_zipcode" id="o_zipcode" placeholder="우편 번호" value="" button="DaumPostcode()"></td>
                <td><input type="button" button="DaumPostcode()" value="주소검색"></td>        
            </tr>
            <tr>
                <td></td>
                <td><input type="text" size="40" name="o_roadAddress" id="o_roadAddress" placeholder="도로명 주소" value="" button="DaumPostcode()"></td><p>
            </tr>
            <tr>
                <td></td>
                <td><input type="text" size="40" name="o_detailAddress" id="o_detailAddress" placeholder="나머지 주소" value=""/></td>
            </tr>
          
            <tr>
                <td>연락처:</td>
                <td><input type="text" name="o_phone" id="o_phone" value=""> </td>
            </tr>
              
            <tr>
                <td>배송 메세지:</td>
                <td><input type="text" name="o_msg"> </td>
            </tr>
               




            





        </table>
        
        

            
                <div class="col-2">

                </div>
                            

                <div class="col-8">
                    <table>
                        <div class="row">
                            <div class="col-3">
                             	결제 금액
                            </div>
                            <div class="col-7">
                            	${orders.o_sum }
                             </div>
                        </div>  
                            

                        <div class="row">
                            <div class="col-3">
                             	상품금액
                            </div>
                            <div class="col-7">
                            	${orders.p_price }
                             </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                              	수량
                            </div>
                            <div class="col-7">
                            <input type="hidden" name="o_qty" id="o_qty" value="${orders.o_qty }">
                            	${orders.o_qty }
                             </div>
                        </div>        
                        <div class="row">
                            <div class="col-3">
                               	최종 결제 금액
                            </div>
                            <div class="col-7">
                            	<input type="hidden" name="o_sum" id="o_sum" value="${orders.o_sum }">
                            	${orders.o_sum }
                             </div>
                        </div>
                         <div class="row">
                            <div class="col-3">
                              	결제 정보
                            </div>
                            <div class="col-7">
                                <input type="radio" name="" checked> 카카오 페이
                             </div>
                         </div>
                        
						  <div class="row">
						  	<input type="hidden" name="p_num" id="p_num" value="${orders.p_num }">
						  	
                            <button id="check_module" type="button">주문하기</button>
                         </div>
                       
                    </table>
                    
                </div>
  <%@include file = "../footer.jsp"%>
  <script>
	$("#check_module").click(function () {
		let p_num = $('#p_num').val();
		let o_qty = $('#o_qty').val();
		
		let p_name = $('#p_name').val();
		let id = $('#id').val();
		let o_zipcode = $('#o_zipcode').val();
		let o_roadAddress = $('#o_roadAddress').val();
		let o_detailAddress = $('#o_detailAddress').val();
		let o_phone = $('#o_phone').val();
		let o_sum = $('#o_sum').val();
		
		var IMP = window.IMP;
		IMP.init('imp37388167'); 
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			
			name: p_name,
			amount: o_sum, 
			buyer_name: id,
			buyer_postcode: o_zipcode,
			buyer_addr: o_detailAddress,
			buyer_address: o_phone,
			buyer_tel: o_phone,
			}, function (rsp) {
				rsp.buyer_address = o_detailAddress;
				console.dir(rsp);
			if (rsp.success) {
				
				$.ajax({ 
					url: "<%=request.getContextPath()%>/orders", 
                    type: "POST", 
                    dataType: "JSON", 
                    data: { 
                        id: id, 
                        p_num: p_num, 
                        o_num: rsp.pg_tid, 
                        o_qty: o_qty, 
                        o_sum: rsp.paid_amount, 
                        o_phone: rsp.buyer_tel, 
                        o_zipcode: rsp.buyer_postcode, 
                        o_roadAddress: rsp.buyer_addr, 
                        o_detailAddress: rsp.buyer_address,
                    }, 
				}).done(function(data) { 
                    if ( data == 1 ) { 
                    	$('#order-success').attr("value", "1"); 
                    	console.log($('#order-success').val()); 
                    } else { 
                    	$('#order-success').attr("value", "0");
                    	console.log($('#order-success').val()); 
                    } 
                     
                    $('#order-id').attr("value", id); 
                    $('#order-p_num').attr("value", p_num); 
                    $('#order-p_name').attr("value", rsp.name); 
                    $('#order-o_num').attr("value", rsp.pg_tid); 
                    $('#order-o_qty').attr("value", o_qty); 
                    $('#order-o_sum').attr("value", rsp.paid_amount); 
                    $('#order-o_phone').attr("value", rsp.buyer_tel); 
                    $('#order-o_zipcode').attr("value", rsp.buyer_postcode); 
                    $('#order-o_roadAddress').attr("value", rsp.buyer_addr); 
                    $('#order-o_detailAddress').attr("value", rsp.buyer_address); 
                    
                    document.orderForm.submit();
                }); 
				
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount + 'merchant_uid' + rsp.merchant_uid;
				console.log(msg);
			} else {
				var msg = '결제에 실패하였습니다.'; 
				msg += '에러내용 : ' + rsp.error_msg;
				console.log(msg);
			}
			alert(msg);
		});
	});
</script>
</body>



</html>