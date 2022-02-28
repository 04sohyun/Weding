<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">

    <title>allMemberList 회원관리 </title>
	<script type="text/javascript" src="js/jquery.js"></script>
 
    <script type="text/javascript">
	   function selectBoxChange(mini_cat){
		   $("#mini_cat").val(mini_cat);
	   }
    
    </script>
    
    <style>
    	.allMemberList_member_total{
    		text-align: right;
    	}
    	.allMemberList_table_top{
    		width: 100%;
    		text-align: center;
    	}
    	.allMemberList_table_bottom{
    		width: 100%;
    		height: 100%;
    		text-align: center;
    		margin-top: 10px;
    	}
    	.row-h1{
    		text-align: center;
    	}
    	.allMemberList_table_btn{
    		margin-top: 20px;
    		text-align: center;
    	}
    	
    	.allMemberList_table_th1, 
    	.allMemberList_table_td1{
    		width: 10%;
    	}
    	.allMemberList_table_th2,
    	.allMemberList_table_td2{
    		width: 10%;
    	}
    	.allMemberList_table_th3,
    	.allMemberList_table_td3{
    		width: 12%;
    	}
    	.allMemberList_table_th4,
    	.allMemberList_table_td4{
    		width: 20%;
    	}
    	.allMemberList_table_th5,
    	.allMemberList_table_td5{
    		width: 8%;
    	}
    	.allMemberList_table_th6,
    	.allMemberList_table_td6{
    		width: 12%;
    	}
    	.allMemberList_table_th7,
    	.allMemberList_table_td7{
    		width: 10%;
    	}
    	.allMemberList_table_th8,
    	.allMemberList_table_td8{
    		width: 8%;
    	}
    	.allMemberList_table_th9,
    	.allMemberList_table_td9{
    		width: 8%;
    	}
    	
    	.paging {
			clear: both;
			width: fit-content;
			margin: 0 auto;
		} 
    </style>
</head>

<body>
	<%@include file = "../header.jsp" %>
    <div class="container">
     <div class="sub-banner">
   		<h2 class="sub-title">회원관리</h2>
    </div>
    	<div class="row">
		<%@include file = "../mypage/menu.jsp" %>
        <div class="col-10">
        	<div class="allMemberList_member_total">총 회원수 : ${total}</div><p>
           	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>

					<table class="table" style="text-align: center">
						<tr class="table-dark">
					        <th class="allMemberList_table_th1">아이디</th>
					        <th class="allMemberList_table_th2">이름</th>
					        <th class="allMemberList_table_th3">연락처</th>
					        <th class="allMemberList_table_th4">이메일</th>
					        <th class="allMemberList_table_th5">회원상태</th>
					        <th class="allMemberList_table_th6">현재</th>
					        <th class="allMemberList_table_th7">구분</th>
					        <th class="allMemberList_table_th8">전환</th>
					    </tr>
					    <c:forEach var="member" items="${memberList}">
						    <form action="updateMember" method="post" >
								<input type="hidden" name="id" value="${member.id}">
								<tr>
									<td class="allMemberList_table_td1">${member.id}</td>
									<td class="allMemberList_table_td2">${member.name}</td>
									<td class="allMemberList_table_td3">${member.phone}</td>
									<td class="allMemberList_table_td4">${member.email}</td>
									<td class="allMemberList_table_td5">${member.status}</td>
									<td class="allMemberList_table_td6">${member.current_content}</td>
									<td class="allMemberList_table_td7">
										<select name="mini_cat" class="form-select" id="mini_cat" onchange="selectBoxChange(this.value);">
											<c:forEach var="memberCat" items="${catList}"> 
												<option value="${memberCat.mini_cat}">${memberCat.mini_content}</option> 
											</c:forEach>
							       		</select>
							    	    </td>
							    	    <td class="allMemberList_table_td8">
							    			<button type="submit" class="btn btn-outline-info">전환</button>
							    	    </td>
								</tr>
							</form>
						</c:forEach>
					<c:set var="num" value="${num-1}"></c:set>
					</table> 
			
				<nav aria-label="..." class="paging">
				  <ul class="pagination">
				  	<c:if test="${pg.startPage > pg.pageBlock}">
					    <li class="page-item">
					      <a class="page-link" onclick="location.href='allMemberList?currentPage=${pg.startPage - pg.pageBlock}'">&laquo;</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					    <li class="page-item">
					    		<a class="page-link" href="allMemberList?currentPage=${i}">${i}</a>
			    		</li>
		    		</c:forEach>
		    		<c:if test="${pg.endPage < pg.totalPage}">
					    <li class="page-item">
					      <a class="page-link" href="allMemberList?currentPage=${pg.startPage + pg.pageBlock}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
				
				<div class="allMemberList_table_btn">
			        <form action="getSearchMember" method="get" style="text-align: center;">
		          		<input name="keyword" class="form-control" style="width:20%;display:inline" type="text" placeholder="검색">
		          		<input type="submit" class="btn btn-outline-primary" style="width:5rem;height:34px;" value="검색">
		      		</form>
				</div>
        	</div>
        </div>
	</div>
<%@ include file= "../footer.jsp" %>
</body>
</html>