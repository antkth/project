<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Product List</title>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="inc/header.jsp"/>
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>${category1} product list</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="product_list section_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="product_sidebar">
                        <div class="single_sedebar">
                            <form action="${contextPath}/productSearch.pro" method="get">
                                <input type="text" name="search_key" placeholder="제품명을 검색하세요" value="${search_key}">
                                <input type="hidden" name="category1" value="${category1}">
                                <input type="hidden" name="category3" value="${category3}">                                                            
                                <i class="ti-search"></i>
                            </form>
                        </div>
                        <div class="single_sedebar">
                            <div class="select_option">
                                <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                                <div class="select_option_dropdown">
                                    <p><a href="#">건식 사료</a></p>
                                    <p><a href="#">습식 사료</a></p>
                                    <p><a href="#">건식 간식</a></p>
                                    <p><a href="#">습식 간식</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>             
                <div class="col-md-8">
                    <div class="product_list">
                        <div class="row" id="pp_product" >
                        <c:forEach var="product" items="${productList}">
                            <div class="col-lg-4 col-sm-8"  >                            
                                <div class="single_product_item" >
                                    <img src="${contextPath}/resources/img_catfood/${product.image}" class="img-fluid">
                                    <h3><a href="${contextPath}/productInfo.pro?num=${product.num}">${product.name}</a></h3>
                                  
                                  <c:choose>
                                  <c:when test="${product.inventory!=0}">
                                   <c:choose>
                                   <c:when test="${product.price == product.real_price}">
                                   <p>${product.price}</p>
                                   </c:when>
                                   <c:otherwise>
                                   <p><font style="text-decoration: line-through;" color="gray">${product.price}</font></p>
                                   <p>${product.real_price}</p>
                                   </c:otherwise>
                                   </c:choose>
                                   </c:when>
                                   <c:otherwise>
                                   <p><font color="red">품절</font></p>
                                   </c:otherwise>
                                   </c:choose>
                                   
                                   <c:if test="${id != null}">
                                   		<c:choose>
                                   		<c:when test="${product.wishCheck==1}">
                                   		<a>찜한상품</a>
                                   		</c:when>
                                   		<c:otherwise>
                                   		<form action="${contextPath}/addwishlist.pro" method="post">
                                   		<input type="hidden" name="num" value="${product.num}">
                                   		<input type="hidden" name="category1" value="${category1}">
                                   		<input type="hidden" name="category3" value="${category3}">
                                   		<input type="hidden" name="search_key" value="${search_key}">
                                   		<input type="hidden" name="nowPage" value="${p_map.nowPage}">
                                   		<input type="submit" value="찜하기">
                                   		</form>
                                   		</c:otherwise>
                                   		</c:choose>
                                   	</c:if>
                                </div>
                            </div>
                        </c:forEach>   
                        </div>
                       <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">                               
                                <li class="page-item">                                                                                          
                                <c:if test="${p_map.blockFirst!=1}">                                
                                    <a href="${contextPath}/productSearch.pro?search_key=${search_key}&nowPage=${p_map.blockFirst-p_map.blockSize}&category1=${category1}&category3=${category3}" class="page-link" aria-label="Previous">
                           	    	<i class="ti-angle-left"></i>
                           	    	</a>                           	    
                           	    </c:if>                           	                               	                              	     
                           	    </li>
                           	    <c:forEach var="i" begin="${p_map.blockFirst}" end="${p_map.blockLast}">   
                                <li class="page-item">          
                                    <a href="${contextPath}/productSearch.pro?search_key=${search_key}&nowPage=${i}&category1=${category1}&category3=${category3}" class="page-link">${i}</a>   
                                </li> 
                                </c:forEach>       
								<li class="page-item">									
								<c:if test="${p_map.blockLast!=p_map.totalPage}">                                		                        
		                        	<a href="${contextPath}/productSearch.pro?search_key=${search_key}&nowPage=${p_map.blockLast+1}&category1=${category1}&category3=${category3}" class="page-link" aria-label="Next">
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
    </section>
    <section class="client_review">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/client.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/client_1.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/client_2.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="feature_part section_padding">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <div class="feature_part_tittle">
                        <h3>Credibly innovate granular
                        internal or organic sources
                        whereas standards.</h3>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="feature_part_content">
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_1.svg" alt="#">
                        <h4>Credit Card Support</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_2.svg" alt="#">
                        <h4>Online Order</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_3.svg" alt="#">
                        <h4>Free Delivery</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_4.svg" alt="#">
                        <h4>Product with Gift</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
<jsp:include page="inc/footer.jsp"/>
</body>
</html>