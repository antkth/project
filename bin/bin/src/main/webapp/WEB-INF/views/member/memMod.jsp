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
<script src="${contextPath}/resources/js/join.js"></script>
<style type="text/css">
#idc{display: none;}
</style>
</head>

<body>
	<jsp:include page="../inc/header.jsp" />
	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>회원정보 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!-- product list part start-->
	<section class="about_us padding_top">
		<h3 class="mb-30" align="center">회원정보 수정</h3>
		<form action="${contextPath}/member/updateMem.mem" style="width: 75%; padding-left: 25%"
			onsubmit="return checkForm();" method="post">
			<div class="input-group-icon mt-10">
				<label>아이디&nbsp;</label><span id="idInfo"><input type="text" id="idc" value="0"></span>
				<input type="text" id="id" name="id" placeholder="아이디" class="single-input" value="${meminfo.id}" disabled>
			</div>
			<input type="hidden" name="id" value="${meminfo.id}">
			<br>
			<div class="input-group-icon mt-10">
				<label>비밀번호&nbsp;</label><span name="c_pwd"></span> <input type="password" id="pwd" name="pwd"
					placeholder="비밀번호" class="single-input">
			</div>
			<br>
			<div class="input-group-icon mt-10">
				<label>비밀번호 확인&nbsp;</label><span name="c_pwd2"></span> <input type="password" id="pwd2"
					name="c_pwd" placeholder="비밀번호 확인" class="single-input">
			</div>
			<br>
			<div class="input-group-icon mt-10">
				<label>이름&nbsp;</label>
				<span name="c_name"></span> <input type="text" id="name" name="name"
					placeholder="이름" class="single-input" value="${meminfo.name}">
			</div>
			<br>
			<div class="input-group-icon mt-10">
				<label>이메일&nbsp;</label>
				<span name="c_email"></span> <input type="email" id="email"
					name="email" placeholder="이메일" class="single-input" value="${meminfo.email}">
			</div>
			<br>
			<div class="input-group-icon mt-10">
				<label>휴대폰번호&nbsp;</label>
				<span name="c_phone"></span> <input type="text" name="phone" value="${meminfo.phone}" id="phone"
					placeholder="휴대폰" class="single-input">
			</div>
			<br>
			<div class="input-group-icon mt-10">
				<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호"
					class="single-input" style="width: 35%; float: left;" readonly="readonly" value="${meminfo.addr1}"> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="genric-btn success circle">
				<input type="text" name="addr2" id="sample6_address" placeholder="주소" class="single-input" readonly="readonly" value="${meminfo.addr2}">
				<input type="text" name="addr3"	id="sample6_detailAddress" placeholder="상세주소" class="single-input" value="${meminfo.addr3}"> 
				<input type="text" name="addr4"	id="sample6_extraAddress" placeholder="참고항목" class="single-input" readonly="readonly" value="${meminfo.addr4}"><br>
			</div>
			<br>
			<div class="input-group-icon mt-10" align="center">
				<input type="submit" class="genric-btn success circle" value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="genric-btn success circle" value="돌아가기"
					onclick="history.back()">
			</div>
			<br> <br> <br> <br>
		</form>
	</section>
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>