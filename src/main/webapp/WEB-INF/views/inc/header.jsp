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
						<a class="navbar-brand" href="${contextPath}/index.pro"> <img
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
									
								<c:choose>
								<c:when test="${chegecategory==null || chegecategory == '1'}">
								<li class="nav-item"><a class="nav-link" href="${contextPath}/chegecategory.pro">For Cats</a></li>
								</c:when>
								<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="${contextPath}/chegecategory.pro">For Dogs</a></li>
								</c:otherwise>
								</c:choose>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Food </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
									<c:choose>
									<c:when test="${chegecategory==null || chegecategory == '1'}">
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=수제간식">
											수제 간식
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=사료">
											사료
										</a> 
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=건식사료">
											건식 사료
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=습식사료">
											습식 사료
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=건식간식">
											건식 간식
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=습식간식">
											습식 간식
										</a> 
									</c:otherwise>
									</c:choose>
									</div>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Toys </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<c:choose>
									<c:when test="${chegecategory==null || chegecategory == '1'}">
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=노즈워크매트">
											노즈워크매트
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=봉제장난감">
											봉제장난감
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=라텍스">
											라텍스
										</a> 
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=소형 장난감">
											소형 장난감
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=스크레치">
											스크레치
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=낚시대">
											낚시대
										</a> 
									</c:otherwise>
									</c:choose>
									</div>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Daily Necessities </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
																			<c:choose>
									<c:when test="${chegecategory==null || chegecategory == '1'}">
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=샴푸">
											샴푸
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=하우스">
											하우스
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=강아지&category3=하네스">
											하네스
										</a> 
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=샴푸">
											샴푸
										</a> 
										<a class="dropdown-item" href="${contextPath}/productSearch.pro?category1=고양이&category3=집">
											집
										</a>
									</c:otherwise>
									</c:choose>
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
										<a class="dropdown-item" href="${contextPath}/wishList.pro">위시리스트</a>
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
								<c:if test="${lastview1_num !=null}">
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="${contextPath}/blog.tem" id="navbarDropdown_2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									최근본 상품
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="${contextPath}/productInfo.pro?num=${lastview1_num}">
										<img src="${contextPath}/resources/img_catfood/${lastview1_image}" width="50px">
										${lastview1_name}</a>
										<c:if test="${lastview2_num !=null}">
										<a class="dropdown-item" href="${contextPath}/productInfo.pro?num=${lastview2_num}">
										<img src="${contextPath}/resources/img_catfood/${lastview2_image}" width="50px">
										${lastview2_name}</a>
										</c:if>
										<c:if test="${lastview3_num !=null}">
										<a class="dropdown-item" href="${contextPath}/productInfo.pro?num=${lastview3_num}">
										<img src="${contextPath}/resources/img_catfood/${lastview3_image}" width="50px">
										${lastview3_name}</a>
										</c:if>
										<c:if test="${lastview4_num !=null}">
										<a class="dropdown-item" href="${contextPath}/productInfo.pro?num=${lastview4_num}">
										<img src="${contextPath}/resources/img_catfood/${lastview4_image}" width="50px">
										${lastview4_name}</a>
										</c:if>
										<c:if test="${lastview5_num !=null}">
										<a class="dropdown-item" href="${contextPath}/productInfo.pro?num=${lastview5_num}">
										<img src="${contextPath}/resources/img_catfood/${lastview5_image}" width="50px">
										${lastview5_name}</a>
										</c:if>
								</div>
								</li>
								</c:if>
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
				<form class="d-flex justify-content-between search-inner" action="${contextPath}/productSearch.pro" method="get">
					<input type="text" class="form-control" id="search_input" name="search_key"
						placeholder="제품명을 입력해주세요.">
                    <input type="hidden" name="category1" value="total">
                    <input type="hidden" name="category3" value="total"> 
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>