<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>정기구매 신청</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  <script>
  $(function() {
	    $( "#testDatepicker" ).datepicker({
	    	minDate : 0,
	    	dateFormat: "yy-mm-dd"
	    });
	});
  </script>  

<style type="text/css">
#idc{display: none;}
</style>
</head>

<body>
  	<jsp:include page="../inc/header.jsp"/>	
  	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>재고관리</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!-- product list part start-->
	<section class="about_us padding_top">
		<h3 class="mb-30" align="center">유통기한 변경</h3>

			<div class="product_count_area">
			<p>시작일</p>
				<input type="text" name="startDate" id="testDatepicker" class="single-input" required="required">
			</div>
			<br>
			<br>
			<div class="product_count_area"></div>


	</section>
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>