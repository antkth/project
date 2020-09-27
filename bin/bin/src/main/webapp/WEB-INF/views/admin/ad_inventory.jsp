<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>재고 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
     	
</head>

<body>

  <jsp:include page="../inc/header.jsp"/>

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>Inventory Management</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!--================Cart Area =================-->
<section class="about_us padding_top" style="margin-left: 20%">
	<div class="section-top-border">
		<div class="row">			
		<div class="col-lg-2 col-md-4 mt-sm-30">
			<div class="single-element-widget mt-30">
				<h3 class="mb-30">목록</h3>
				<div class="switch-wrap d-flex justify-content-between">
					<a href='${contextPath}/admin/insertPro.pro'>상품 등록</a>
					<div></div>
				</div>
				<div class="switch-wrap d-flex justify-content-between">
					<a href='${contextPath}/admin/ad_qalist.qab'>문의 내역</a>
					<div></div>
				</div>
				<div class="switch-wrap d-flex justify-content-between">
					<a href='${contextPath}/admin/inventorylist.inv'>재고 관리</a>
					<div></div>
				</div>
			</div>
		</div>		
		<div class="col-lg-8 col-md-8">	
		<h3 class="mb-30" style="text-align: center;">재고 관리</h3>
		<form action="${contextPath}/admin/inventorylist.inv" method="get">
			<select name="searchField">
				<option ${(param.searchField == "name")?"selected":""} value="name">상품명</option>
				<option ${(param.searchField == "manufacturer")?"selected":""} value="manufacturer">제조사명</option>
	        </select>         
	        &nbsp;
        
			<c:choose>
			<c:when test="${search} eq none">
				<input type="text" name="search" value="" style="padding: 7px;">
			</c:when>
			<c:otherwise>
				<input type="text" name="search" value="${param.search}" style="padding: 7px;">
			</c:otherwise>
			</c:choose>                    		    	

		        <button class="class__filter__btn" type="submit" style="padding: 6px;"><i class="fa fa-search"></i></button>
		</form>			
		<br>	
	    <div class="container">
	    <div class="cart_inner">		
	        <div class="table-responsive">
	          <table class="table">
	              <tr>
				      <th scope="col">#</th>
				      <th scope="col">분류</th>
				      <th scope="col">상품명</th>
				      <th scope="col">가격</th>
				      <th scope="col">제조사</th>
				      <th scope="col">입고날짜</th>
				      <th scope="col">유통기한</th>
				      <th scope="col">재고수량</th>		      
				    </tr>				
				<c:forEach var="i" items="${inventoryList}">
				    <tr>				    
				      <td>${i.num}</td>
				      <td>${i.category1}</td>
				      <td>${i.name}</td>
				      <td>${i.price}</td>
				      <td>${i.manufacturer}</td>
				      <td><f:formatDate value="${i.w_date}" pattern="yyyy-MM-dd"/></td>
				      <td><f:formatDate value="${i.exp_date}" pattern="yyyy-MM-dd"/></td>
				      <td>${i.inventory}&nbsp;&nbsp;<a href="${contextPath}/admin/addInventory.inv?num=${i.num}"><i class="fa fa-plus" style="font-size:20px"></i></a>
				      					&nbsp;&nbsp;<a href="${contextPath}/admin/subInventory.inv?num=${i.num}"><i class="fa fa-minus" style="font-size:20px"></i></a>
				      </td>
				    </tr>	
				</c:forEach>				 
			</table>
		<nav class="blog-pagination justify-content-center d-flex">                       		
            <ul class="pagination">                               
            	<li class="page-item">                                                                                          
            	<c:if test="${i_map.blockFirst!=1}">                                
	                <a href="${contextPath}/admin/inventorylist.inv?search=${search}&nowPage=${i_map.blockFirst-i_map.blockSize}" class="page-link" aria-label="Previous">
	       	    	<i class="ti-angle-left"></i>
	       	    	</a>                           	    
                </c:if>                           	                               	                              	     
                </li>
           	    <c:forEach var="i" begin="${i_map.blockFirst}" end="${i_map.blockLast}">   
                <li class="page-item">          
                    <a href="${contextPath}/admin/inventorylist.inv?searchField=${searchField}&search=${search}&nowPage=${i}" class="page-link">${i}</a>   
                </li> 
                </c:forEach>       
				<li class="page-item">									
				<c:if test="${i_map.blockLast!=i_map.totalPage}">                                		                        
                   	<a href="${contextPath}/admin/inventorylist.inv?searchField=${searchField}&search=${search}&nowPage=${i_map.blockLast+1}" class="page-link" aria-label="Next">
                   	<i class="ti-angle-right"></i>
                    </a>
	            </c:if>			                        	                        		                        
	            </li>                                                              
           </ul>                           
        </nav>						         
		</div>		
	</div>
	</div>	
	</div>	
</div>
</div>
</section>
<div style="position: relative; top: 1000px;"></div>


<jsp:include page="../inc/footer.jsp"/>
</body>
</html>