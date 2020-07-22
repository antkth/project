<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<jsp:include page="inc/header.jsp" />

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>장바구니</h2>
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
					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th scope="col">가격</th>
								<th scope="col">수량</th>
								<th scope="col">총가격</th>
								<th scope="col">결제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${cartList}" varStatus="cnt">
								<c:set var="cart_qty" value="${cartList[cnt.count-1].qty}" />
								<tr>
									<td>
										<div class="media">
											<div class="d-flex">
												<img
													src="${contextPath}/resources/img_catfood/${cart.image}" />
											</div>
											<div class="media-body">
												<p>${cart.name}</p>
											</div>
										</div>
									</td>
									<td>
										<h5>
											<fmt:formatNumber value="${cart.price}" type="currency"
												currencySymbol="￦" />
										</h5>
									</td>
									<td>
										<!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                      class="input-text qty input-number" />
                    <button
                      class="increase input-number-increment items-count" type="button">
                      <i class="ti-angle-up"></i>
                    </button>
                    <button
                      class="reduced input-number-decrement items-count" type="button">
                      <i class="ti-angle-down"></i>
                    </button> -->
										<p>${cart.qty}개</p>
									</td>
									<td id="total">
										<h5>
											<fmt:formatNumber value="${cart.price * cart.qty}"
												type="currency" currencySymbol="￦" />
										</h5>
									</td>
									<td><a href="#">결제하기</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<h5>총 결제금액</h5>
								</td>
								<td>
									<h5>
										<fmt:formatNumber value="${total}" type="currency"
											currencySymbol="￦" />
									</h5>
								</td>
							</tr>
							<tr class="bottom_button">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<div class="cupon_text float-right">
										<a class="btn_1" href="#">Button</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	</section>
	<jsp:include page="inc/footer.jsp" />
</body>

</html>