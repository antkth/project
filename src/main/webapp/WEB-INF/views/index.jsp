<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!doctype html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
    
    <!-- Important Owl stylesheet -->
	<link rel="stylesheet" href="owl-carousel/owl.carousel.css">
	<!-- Default Theme -->
	<link rel="stylesheet" href="owl-carousel/owl.theme.css">
	<!--  jQuery 1.7+  -->
	<script src="jquery-1.9.1.min.js"></script>
	<!-- Include js plugin -->
	<script src="assets/owl-carousel/owl.carousel.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
		$("#owl-example").owlCarousel();
		});
	</script>
	
</head>

<body>
<jsp:include page="inc/header.jsp"/>

<%--     <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h1>Best quality
                                pillow</h1>
                            <p>Seamlessly empower fully researched 
                                growth strategies and interoperable internal</p>
                            <a href="product_list.html" class="btn_1">shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner_img">
            <img src="${contextPath}/resources/img/banner.png" alt="#" class="img-fluid">
            <img src="${contextPath}/resources/img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
        </div>
    </section>
    <!-- banner part start--> --%>
    
 
    <!-- Hero Section Begin -->
    <section class="hero">
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="${contextPath}/resources/img/pet03(1).png" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="${contextPath}/resources/img/pet03(1).png" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="${contextPath}/resources/img/pet03(1).png" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
		      </div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
    </section>
    <!-- Hero Section End --> 
    
    <!-- 슬라이드(인기제품 늘어놓기) -->
    <div id="owl-example" class="owl-carousel" style="margin-top: 50px;">
	  <div> <img src="${contextPath}/resources/img/b1.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b2.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b3.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b1.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b2.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b3.jpg"> </div>
	  <div> <img src="${contextPath}/resources/img/b1.jpg"> </div>
	</div>
    <!-- 슬라이드 -->

<%-- 
    <!-- product list start-->
    <section class="single_product_list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="${contextPath}/resources/img/single_product_1.png" class="img-fluid" alt="#">
                                    <img src="${contextPath}/resources/img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
                                    <h5>Started from $10</h5>
                                    <h2> <a href="single-product.html">Printed memory foam 
                                        brief modern throw 
                                        pillow case</a> </h2>
                                    <a href="product_list.html" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="${contextPath}/resources/img/single_product_2.png" class="img-fluid" alt="#">
                                    <img src="${contextPath}/resources/img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
                                    <h5>Started from $10</h5>
                                    <h2> <a href="single-product.html">Printed memory foam 
                                        brief modern throw 
                                        pillow case</a> </h2>
                                    <a href="product_list.html" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="${contextPath}/resources/img/single_product_3.png" class="img-fluid" alt="#">
                                    <img src="${contextPath}/resources/img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
                                    <h5>Started from $10</h5>
                                    <h2> <a href="single-product.html">Printed memory foam 
                                            brief modern throw 
                                            pillow case</a> </h2>
                                    <a href="product_list.html" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product list end-->
    --%> 
    <!-- trending item start-->
    <section class="trending_items">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>Trending Items</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${worstProductList}" var="VO" begin="0" end="6">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <div class="single_product_item_thumb">
                            <a href="${contextPath}/productInfo.pro?num=${VO.num}"><img src="${contextPath}/resources/img_catfood/${VO.image}" alt="#" class="img-fluid"></a>
                        </div>
                        <h3> <a href="single-product.html">${VO.name}</a></h3>
                        <p>${VO.real_price}</p>
                    </div>
                </div>
            </c:forEach>
<%--                 <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="${contextPath}/resources/img/tranding_item/tranding_item_2.png" alt="#" class="img-fluid">
                        <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3>
                        <p>From $5</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="${contextPath}/resources/img/tranding_item/tranding_item_3.png" alt="#" class="img-fluid">
                        <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>
                        <p>From $5</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="${contextPath}/resources/img/tranding_item/tranding_item_4.png" alt="#" class="img-fluid">
                        <h3> <a href="single-product.html">Cervical pillow for airplane
                        car office nap pillow</a> </h3>
                        <p>From $5</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="${contextPath}/resources/img/tranding_item/tranding_item_5.png" alt="#" class="img-fluid">
                        <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3>
                        <p>From $5</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <img src="${contextPath}/resources/img/tranding_item/tranding_item_6.png" alt="#" class="img-fluid">
                        <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3>
                        <p>From $5</p>
                    </div>
                </div> --%>
            </div>
        </div>
    </section>
    <!-- trending item end-->

    <!-- client review part here -->
    <section class="client_review">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/pet03.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/pet02.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="${contextPath}/resources/img/pet01.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- client review part end -->


    <!-- feature part here -->
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
    <!-- feature part end -->

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