<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
        <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
    
</head>

<body>
 <jsp:include page="inc/header.jsp"/>
    <section class="breadcrumb_part single_product_breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="product_image_area">
    <div class="container">
    	<form action="${contextPath}/addCart.car?num=${productVO.num}" method="post">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="product_img_slide owl-carousel">
            <div class="single_product_img">
              <img src="${contextPath}/resources/img_catfood/${productVO.image}" alt="#" class="img-fluid" style="height: 500px;">
            </div>
          </div>
        </div>
        <div class="col-lg-8">
          <div class="single_product_text text-center">
            <h3>${productVO.name}</h3>
            	<div class="container">
	            <table class="table table-striped" >
	            	<tr>
		            	<th>원산지</th>
		            	<th>제조사</th>
		            	<th>가격</th>
		            	<th>종류</th>
		            	<th>유통기한</th>
	            	</tr>
	            	<tr>
	            		<td>${productVO.origin}</td>
	            		<td>${productVO.manufacturer}</td>
	            		<td>${productVO.price}</td>
	            		<td>${productVO.category3}</td>
	            		<td>
	            			<fmt:formatDate value="${productVO.exp_date}" pattern="yyyy-MM-dd" />
	            		</td>
	            	</tr>
	            </table>
				</div>
            <div class="card_area">
                <div class="product_count_area">
                    <p>수량</p>
                    <div class="product_count d-inline-block">
                       <!--   <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span> -->
                        <select id="qty" class="product_count_item input-number" name="qty">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
                        	<option value="4">4</option>
                        </select>
                        <!-- <input class="product_count_item input-number" type="text" value="1" min="0" max="10" id="count"> -->
                        <!-- <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>  -->
                    </div>
                </div>
              <div class="add_to_cart">
              		<input type="hidden" name="id" value="${sessionScope.id}">
              		<input type="hidden" name="image" value="${productVO.image}">
              		<input type="hidden" name="name" value="${productVO.name}">
              		<input type="hidden" name="origin" value="${productVO.origin}">
	            	<input type="hidden" name="manufacturer" value="${productVO.manufacturer}">
	            	<input type="hidden" name="price" value="${productVO.price}">
	            	<input type="hidden" name="category3" value="${productVO.category3}"> 
                  <input type="submit" class="btn_3" value="장바구니 추가하기">
              </div>
            </div>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
  <!--================End Single Product Area =================-->
   <!-- subscribe part here -->
   <section class="subscribe_part section_padding">
      <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-8">
                  <div class="subscribe_part_content">
                      <h2>Get promotions & updates!</h2>
                      <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                      <div class="subscribe_form">
                          <input type="email" placeholder="Enter your mail">
                          <a href="#" class="btn_1">Subscribe</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- subscribe part end -->
 <jsp:include page="inc/footer.jsp"/>

</body>

</html>