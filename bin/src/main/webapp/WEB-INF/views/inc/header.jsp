<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<meta charset="utf-8">
<body>
	<link rel="icon" href="img/favicon.png">
	<link rel="stylesheet"
		href="${contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
	<link rel="stylesheet"
		href="${contextPath}/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/all.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
	<link rel="stylesheet"
		href="${contextPath}/resources/css/themify-icons.css">
	<link rel="stylesheet"
		href="${contextPath}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/slick.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="${contextPath}/index.tem"> <img
							src="${contextPath}/resources/img/logo.png" alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/index.tem">Home</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/about.tem">For Cats</a></li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="${contextPath}/productlist.jsp" id="navbarDropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Food </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="${contextPath}/productlist.pro?category1=고양이&category3=건식사료">
											건식 사료
										</a> 
										<a class="dropdown-item" href="${contextPath}/productlist.pro?category1=고양이&category3=습식사료">
											습식 사료
										</a> 
										<a class="dropdown-item" href="${contextPath}/productlist.pro?category1=고양이&category3=건식간식">
											건식 간식
										</a> 
										<a class="dropdown-item" href="${contextPath}/productlist.pro?category1=고양이&category3=습식간식">
											습식 간식
										</a> 										
									</div>
								</li>
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="${contextPath}/blog.tem" id="navbarDropdown_3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Toys </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="${contextPath}/member/login.mem">
											login 
										</a> 
										<a class="dropdown-item" href="#">product checkout</a>
										<a class="dropdown-item" href="${contextPath}/cartList.car?id=${sessionScope.id}">shopping cart</a> 
										<a class="dropdown-item" href="${contextPath}/confirmation.tem">confirmation</a> 
										<a class="dropdown-item" href="${contextPath}/elements.tem">elements</a>
									</div>
								</li>
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="${contextPath}/blog.tem" id="navbarDropdown_2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
									Daily Products
								</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="${contextPath}/blog.tem">
											blog
										</a>
										<a class="dropdown-item" href="${contextPath}/singleblog.tem">Single blog</a>
									</div>
								</li>
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="${contextPath}/blog.tem" id="navbarDropdown_2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									My Page
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
									<c:choose>
									<c:when test="${id==null}">
										<a class="dropdown-item" href="${contextPath}/member/login.mem">Login</a>
										<a class="dropdown-item" href="${contextPath}/member/join.mem">Join</a>
										<a class="dropdown-item" href="${contextPath}/member/findId.mem">아이디 찾기</a>
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="${contextPath}/member/mypage.mem">마이페이지</a>
										<a class="dropdown-item" href="${contextPath}/qaboard/qalist.qab">1대1 문의</a>
										<a class="dropdown-item" href="${contextPath}/member/memMod.mem">회원정보 수정</a>
										<a class="dropdown-item" href="${contextPath}/member/logout.mem">로그아웃</a>
									</c:otherwise>
									</c:choose>
									<c:if test="${id=='admin'}">
										<a class="dropdown-item" href="${contextPath}/admin/insertPro.pro">관리자페이지</a>
									</c:if>
								</div>
								</li>
							</ul>
						</div>
						<div class="hearer_icon d-flex align-items-center">
							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a> 
								<c:if test="${sessionScope.id !=null}">
								<a href="${contextPath}/cartList.car?id=${sessionScope.id}"> <i	class="flaticon-shopping-cart-black-shape"></i></a>
								</c:if>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>