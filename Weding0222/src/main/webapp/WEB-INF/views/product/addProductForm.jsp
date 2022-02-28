<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   form{
      font-size: 12px;   
   }

   table{
      width: 700px;
      height: auto;
      margin: auto;
   }
   
   #menuName{
      width: 550px;
       height: 40px;
       text-align: center;
       font-size: 13px;
       font-weight: bold;
    }
    tr{
       margin-top : 10px;
    }
    td{
       margin-top : 10px;
       border: none;
    }
    
    .table tr td:nth-child(2) input {
		width: 60%;
		display: inline-block;
	}
    
    
    
</style>

<script type="text/javascript">
   function dateChk() {
      var from = document.getElementById('from');
        var to = document.getElementById('to');
        
        var date1 = from.valueAsDate;
        var date2 = to.valueAsDate;
        
        console.log(date1);
        console.log(date2);
        console.log(date1 < date2);
        
        if(date1 > date2) {
           alert('종료일자는 시작일자보다 빠를 수 없습니다.')
           return false;
        } else {
           return true;
        }
      
   }
</script>

</head>
<body>
<c:if test="${msg!=null}">${msg}</c:if>
<%@ include file="../header.jsp" %>
<div class="container">
   <div class="sub-banner">
		<h2 class="sub-title">상품등록</h2>
	</div>
   <div class="row">
      <%@include file = "../mypage/menu.jsp"%>
      <div class="col-10">
      <form name="addProduct" id="addProduct" action="addProduct" method="post" enctype="multipart/form-data" style="width: 80%;" onsubmit="return dateChk()">
     	<span>※ 등록할 상품 정보를 입력하세요.</span>
     	<hr style="margin:1rem 0 2rem 0">
         <table class="table">
             <tr>
                <td id="menuName" style="border:none;">카테고리</td>
                <td style="border:none;">
                   <select name="mini_cat" class="form-select" style="width:30%;height: 34px;">
                      <option disabled="disabled" selected="selected">선택</option>
                         <c:forEach var="product" items="${catList}">
                            <option value="${product.mini_cat}">${product.mini_content}</option>
                     </c:forEach>
                   </select>
                </td>
             </tr>
            <tr>
                <td id="menuName" style="border:none;">업체명</td>
                <td style="border:none;">
                  <input type="text" class="form-control" style="width:30%" name="p_store" autofocus required>
                </td>
             </tr>
             
           <tr>
                <td id="menuName" style="border:none;">상품이름</td>
                <td style="border:none;">
                  <input type="text" class="form-control" name="p_name"   required>
                </td>
            </tr>
            
             <tr>
                <td id="menuName" style="border:none;">상품가격</td>
                <td style="border:none;">
                   <input type="text" class="form-control" style="width:30%" name="p_price"   required>&nbsp;&nbsp;원
                </td>
            </tr>
            
            <tr>
               <td id="menuName" style="border:none;">대표이미지</td>
                <td style="border:none;">
                  <input type="file" class="form-control" style="width:30%" id="p_image1" name="file1" required>
                </td>
            </tr>
            
            <tr>
               <td id="menuName" style="border:none;">상세이미지</td>
                <td style="border:none;">
                  <input type="file" class="form-control" style="width:30%" id="p_image2" name="file2" required>
                </td>
            </tr>
            
             <tr>
                <td id="menuName" style="border:none;">상품설명</td>
                <td style="border:none;">
                  <textarea rows="3" class="form-control" cols="50" name="p_description" ></textarea>
                </td>
            </tr>
            <tr>
                <td id="menuName" style="border:none;">펀딩기간</td>
                <td style="border:none;">
                 <input type="date" class="form-control" style="width:30%" name="p_start" id="from" min="${now}" required> ~ <input type="date" class="form-control" style="width:30%" name="p_end" id="to" min="${now}" max="${endDate}" required>
                 <span style="font-size: 12px;display:block;padding-top:0.5rem">※ 펀딩 기간은 최소 익일부터,시작일로부터 최대 60일까지 지정 가능합니다. 펀딩은 12시에 일괄 오픈됩니다. </span>
                 </td>
            </tr>
            
           <tr>
                <td id="menuName" style="border:none;">목표금액</td>
                <td style="border:none;">
                   <input type="number" class="form-control" style="width:30%" name="p_goalprice" min="500000" step="10000" required>&nbsp;&nbsp;원
                   <span style="font-size: 12px;display:block;padding-top:0.5rem;">※ 최소 금액은 500,000원부터 10,000원 단위로 지정 가능합니다.</span>
                </td>
            </tr>
             <tr>
               <td colspan="2" id="menuName" style="border:none;">
                  <hr>
               </td>
            </tr>            
            <tr >
               <td id="menuName" style="border:none;">안내사항</td>
               <td style="width: 75%;border:none;">
                  <p style="font-size:13px"> · 펀딩 기간과 목표 금액은 어떠한 경우에도 변경이 불가합니다. 신중히 결정하시기 바랍니다.</p>
                  <p style="font-size:13px"> · 성차별, 인종 비하, 종교 관련 등 상품 판매와 관계없는 내용이 포함된 경우 무통보 삭제처리 됩니다.</p>
                  <p style="font-size:13px"> · 이미 등록된 상품은 판매자 임의로 수정할 수 없으며 수정 시  Q&A 게시판을 이용하여 요청 주시기 바랍니다.</p>
                  <p style="font-size:13px"> · Q&A 게시판에 수정 요청 시 상품 판매와 관계없는 내용으로는 수정이 불가합니다.</p>
               </td>
            </tr>
            <tr>
               <td colspan="2" id="menuName" style="border:none;">
                  <hr>
               </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right;border:none;" id="menuName">
                  <input type="button" value="목록" class="btn btn-outline-secondary" style="font-size:1em" onclick="location.href='soldList'">
                  <input type="reset" value="취소" class="btn btn-outline-danger" style="font-size:1em" onclick="location.href='soldList'">
                  <input type="submit" value="등록" class="btn btn-outline-primary" style="font-size:1em">
                </td>
            </tr>
            
            </table>
        </form>
        </div>
     </div>
  </div>
<%@ include file="../footer.jsp" %>
</body>
</html>