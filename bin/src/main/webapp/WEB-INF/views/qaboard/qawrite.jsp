<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pillloMart</title>
<script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
</head>

<body>
	<jsp:include page="../inc/header.jsp" />

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>cart list</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================Cart Area =================-->
	<section class="cart_area section_padding">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
				<form action="${contextPath}/qaboard/insertQaboard.qab" method="post">
					<div class="mt-10">
						<input type="text" name="title" placeholder="title"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'title'" required
							class="single-input-primary">
					</div>
					<div class="mt-10">
						<textarea class="single-textarea" name="content" placeholder="content"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'content'" required></textarea>
					</div><br>
					<div class="checkout_btn_inner float-right">
						<input class="btn_1" type="submit" value="문의글쓰기">
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>