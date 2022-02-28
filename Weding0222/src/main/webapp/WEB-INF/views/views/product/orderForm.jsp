<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@include file = "../header.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>결제</title>
    <meta charset="UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <style>
      .order-warp {
        margin: 0 auto;
        width: 960px;
      }

      .order-info {
        float: left;
        width: 60%;
      }

      .pay-info {
        float: left;
        width: 40%;
        background-color: #f8f8f8;
        padding: 3rem 3.5rem;
      }

      .order-product {
        margin-bottom: 5rem;
      }

      .order-product img {
        width: 185px;
        height: 120px;
        object-fit: cover;
      }

      .order-product span {
        display: block;
        margin-top: 0.25rem;
      }

      .order-product,
      .shipping-info {
        font-family: "Noto Sans KR";
      }

      .order-product h5,
      .shipping-info h5,
      .pay-info h5 {
        margin-bottom: 2rem;
      }

      .shipping-table {
        width: 80%;
        border-collapse: separate;
  		border-spacing: 0 10px;
      }

      .shipping-table tr {
        height: 3.5rem;
      }

      .shipping-table tr td:first-child {
        width: 30%;
      }

      .shipping-table input[name="o_name"] {
        width: 50%;
      }

      .shipping-table input[name="o_zipcode"] {
        float: left;
        width: 50%;
      }

      .shipping-table input[type="button"] {
        float: left;
        margin-left: 0.75rem;
      }

      .pay-table {
        width: 100%;
        border-collapse: separate;
  		border-spacing: 0 10px;
      }

      .pay-table tr {
        height: 2rem;
      }

      .pay-table tr td:nth-child(2) {
        text-align: right;
      }

      .pay-way {
        margin-top: 5rem;
      }

      .pay-way button {
        margin-top: 5rem;
        display: block;
        width: 100%;
        height: 3.5rem;
      }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
      function defaultShipping() {
        var member = $("#member").val();

        $.ajax({
          url: "<%=request.getContextPath()%>/defaultShipping",
          data: { id: member },
          success: function (data) {
            $("#o_name").attr("value", data.name);
            $("#o_zipcode").attr("value", data.zipCode);
            $("#o_roadAddress").attr("value", data.roadAddress);
            $("#o_detailAddress").attr("value", data.detailAddress);
            $("#o_phone").attr("value", data.phone);
          },
        });
      }
    </script>
  </head>
  <body>
    <!-- 결제 전달 값 -->
    <input type="hidden" name="member" id="member" value="${member.id}" readonly />
    <form action="orderSuccess" method="post" name="orderForm">
      <input type="hidden" name="id" id="order-id" />
      <input type="hidden" name="p_num" id="order-p_num" />
      <input type="hidden" name="p_name" id="order-p_name" />
      <input type="hidden" name="o_num" id="order-o_num" />
      <input type="hidden" name="o_qty" id="order-o_qty" />
      <input type="hidden" name="o_sum" id="order-o_sum" />
      <input type="hidden" name="o_phone" id="order-o_phone" />
      <input type="hidden" name="o_zipcode" id="order-o_zipcode" />
      <input type="hidden" name="o_roadAddress" id="order-o_roadAddress" />
      <input type="hidden" name="o_detailAddress" id="order-o_detailAddress" />
      <input type="hidden" name="success" id="order-success" />
    </form>

    <div class="container">
      <div class="sub-banner">
		<h2 class="sub-title">주문서 작성</h2>
	  </div>
      <!-- width: 960px;-->
      <div class="order-warp">
        <div class="order-info">
          <!-- 주문 상품 정보 -->
          <div class="order-product">
            <h3>상품정보</h3>
            <img src="${pageContext.request.contextPath}/upload/${orderProduct.p_image1}" style="margin-top: 30px;"/>
            <input type="hidden" name="p_name" id="p_name" value="${orderProduct.p_name}"/>
            <span style="margin-top: 30px;"><h3>${orderProduct.p_name}</h3></span>
          </div>
          <!-- 주문 배송지 정보 -->
          <div class="shipping-info">
            <h3>배송지 정보</h3>
		  	<hr style="width: 500px;">
            <table class="shipping-table">
              <tr>
                <td><input type="radio" id="shipping" name="shipping" onclick="defaultShipping()" />&nbsp;기본배송지</td>
              </tr>

              <tr>
                <td>받는분</td>
                <td>
                  <input type="hidden" name="id" id="id" value="${member.id }" />
                  <input type="text" class="form-control" name="o_name" id="o_name" />
                </td>
              </tr>

              <tr>
                <td>배송지 주소</td>
                <td>
                  <input type="text" class="form-control" name="o_zipcode" id="o_zipcode" placeholder="우편 번호" button="DaumPostcode()" readonly />
                  <input type="button" class="btn" button="DaumPostcode()" value="주소찾기" style="border: 1px solid #2F3A8F; color: #2F3A8F; height: 34px; width: 8rem;"/>
                </td>
              </tr>
              <tr>
                <td></td>
                <td><input type="text" class="form-control" name="o_roadAddress" id="o_roadAddress" placeholder="도로명 주소" button="DaumPostcode()" readonly /></td>
              </tr>

              <tr>
                <td></td>
                <td><input type="text" class="form-control" name="o_detailAddress" id="o_detailAddress" placeholder="나머지 주소" /></td>
              </tr>

              <tr>
                <td>연락처</td>
                <td><input type="text" class="form-control" name="o_phone" id="o_phone" /></td>
              </tr>

              <tr>
                <td>배송 메세지</td>
                <td><input type="text" class="form-control" name="o_msg" /></td>
              </tr>
            </table>
          </div>
        </div>

        <!-- 결제 정보 -->
        <div class="pay-info">
          <h3>결제 금액</h3>
          <hr>
          <table class="pay-table">
            <tr>
              <td>상품 금액</td>
              <td><fmt:formatNumber value="${orders.p_price }" />원</td>
            </tr>

            <tr>
              <td>수량</td>
              <td><input type="hidden" name="o_qty" id="o_qty" value="${orders.o_qty }" /> ${orders.o_qty }</td>
            </tr>

            <tr>
              <td>최종 결제 금액</td>
              <td><input type="hidden" name="o_sum" id="o_sum" value="${orders.o_sum }" /> <fmt:formatNumber value="${orders.o_sum }" />원</td>
            </tr>
          </table>

          <div class="pay-way">
            <h5>결제 방법</h5>
            <input type="radio" name="" checked />&nbsp;카카오 페이
            <input type="hidden" name="p_num" id="p_num" value="${orders.p_num }" />
            <button class="btn" id="check_module" type="button" style=" background-color:#2F3A8F;color:#fff; height: 34px; width: 100%; font-size: 14px;">주문하기</button>
          </div>
        </div>
      </div>
    </div>
    <%@include file = "../footer.jsp"%>

    <!-- 카카오 페이 -->
    <script>
      $("#check_module").click(function () {
        let p_num = $("#p_num").val();
        let o_qty = $("#o_qty").val();

        let p_name = $("#p_name").val();
        let id = $("#id").val();
        let o_zipcode = $("#o_zipcode").val();
        let o_roadAddress = $("#o_roadAddress").val();
        let o_detailAddress = $("#o_detailAddress").val();
        let o_phone = $("#o_phone").val();
        let o_sum = $("#o_sum").val();

        var IMP = window.IMP;
        IMP.init("imp37388167");
        IMP.request_pay(
          {
            pg: "kakao",
            pay_method: "card",
            merchant_uid: "merchant_" + new Date().getTime(),

            name: p_name,
            amount: o_sum,
            buyer_name: id,
            buyer_postcode: o_zipcode,
            buyer_addr: o_detailAddress,
            buyer_address: o_phone,
            buyer_tel: o_phone,
          },
          function (rsp) {
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
              }).done(function (data) {
                if (data == 1) {
                  $("#order-success").attr("value", "1");
                  console.log($("#order-success").val());
                } else {
                  $("#order-success").attr("value", "0");
                  console.log($("#order-success").val());
                }

                $("#order-id").attr("value", id);
                $("#order-p_num").attr("value", p_num);
                $("#order-p_name").attr("value", rsp.name);
                $("#order-o_num").attr("value", rsp.pg_tid);
                $("#order-o_qty").attr("value", o_qty);
                $("#order-o_sum").attr("value", rsp.paid_amount);
                $("#order-o_phone").attr("value", rsp.buyer_tel);
                $("#order-o_zipcode").attr("value", rsp.buyer_postcode);
                $("#order-o_roadAddress").attr("value", rsp.buyer_addr);
                $("#order-o_detailAddress").attr("value", rsp.buyer_address);

                document.orderForm.submit();
              });

              var msg = "결제가 완료되었습니다.";
              /* msg += "결제 금액 : " + rsp.paid_amount + "merchant_uid" + rsp.merchant_uid;
              console.log(msg); */
            } else {
              var msg = "결제에 실패하였습니다.";
              /* msg += "에러내용 : " + rsp.error_msg;
              console.log(msg); */
            }
            alert(msg);
          }
        );
      });
    </script>
  </body>
</html>
