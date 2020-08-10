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
<title>pillloMart</title>
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
 
</head>
<body>
<jsp:include page="../inc/header.jsp" />

<script src="${contextPath}/resources/js/join.js"></script>
	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>Join</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!-- product list part start-->
	<section class="about_us padding_top" style="margin-left: 20%">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<h3 class="mb-30">Form Element</h3>
					<form action="${contextPath}/admin/insertItem.pro" method="post" enctype="multipart/form-data">
						<div class="mt-10">
							<input type="text" name="name" placeholder="name"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'name'" required
								class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="price" placeholder="price" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'price'" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="origin" placeholder="origin" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'origin'" required class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="manufacturer" placeholder="manufacturer" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'manufacturer'" required class="single-input">
						</div>
						<div class="mt-10">
							<div class="form-select" id="default-select">
								<select name="category1">
									<option value="1">개</option>
									<option value="1">고양이</option>
								</select>
							</div>
						</div>
						<div class="mt-10">
							<div class="form-select" id="default-select_2" >
								<select name="category3">
								<option>사료</option>
								<option>간식</option>
								<option>치약</option>
								<option>스크래쳐</option>
								<option>캣타워</option>
								<option>소형장난감</option>
								<option>위생</option>
								<option>하우스</option>
								<option>외출</option>
								</select>
							</div>
						</div>
						<div class="mt-10">
							<input type="file" name="image" placeholder="image"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'image'" required
								class="single-input-accent">
						</div>
						<div class="mt-10">
							<input type="text" name="exp_date" placeholder="exp_date" id="testDatepicker"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'exp_date'" required
								class="single-input-accent">
						</div>						
						<div class="input-group-icon mt-10" align="center">
				<input type="submit" class="genric-btn success circle" value="상품등록">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="genric-btn success circle" value="다시작성">
			</div>
					</form>
				</div>
				<div class="col-lg-3 col-md-4 mt-sm-30">
					<div class="single-element-widget mt-30">
						<h3 class="mb-30">목록</h3>
						<div class="switch-wrap d-flex justify-content-between">
							<a href='${contextPath}/admin/insertPro'>상품등록</a>
							<div></div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<a href='${contextPath}/admin/ad_qalist.qab'>문의내역</a>
							<div></div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<p>03. Confirm Color Checkbox</p>
							<div></div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<a href='${contextPath}/admin/getOrderList.pur?sort=1'>주문관리</a>
							<div></div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<p>05. Disabled Checkbox active</p>
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>