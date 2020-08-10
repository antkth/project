<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>정기구매 목록</title>
        <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
</head>

<body>
  <jsp:include page="inc/header.jsp"/>

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>정기구매 목록</h2>
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
        	<div style="float: right; margin-bottom: 15px;">
        	<input type="button" value="전체" onclick="location.href='${contextPath}/admin/getOrderList.pur?sort=1'">
            <input type="button" value="배송대기" onclick="location.href='${contextPath}/admin/getOrderList.pur?sort=2'">
            <input type="button" value="배송중" onclick="location.href='${contextPath}/admin/getOrderList.pur?sort=3'"> <br>
            </div>
          <table class="table">
              <tr>
             	<th scope="col">no</th>
                <th scope="col">상품</th>
                <th scope="col"></th>
                <th scope="col">수량</th>
                <th scope="col">결제금액</th>
                <th scope="col">다음결제일</th>
                <th scope="col">취소</th>
              </tr>
              <c:forEach items="${myResaleList}" var="VO" varStatus="NO">
              <tr>
              	<td>${NO.count}</td>
              	<td width="10%"><img src="${contextPath}/resources/img_catfood/${VO.image}" width="60%"></td>
              	<td>${VO.name}</td>
              	<td>${VO.qty}</td>
              	<td>${Math.round(VO.price * VO.qty/100*70/100)*100}</td>
              	<td><f:formatDate value="${VO.re_date}" pattern="yyyy-MM-dd"/></td>
              	<td><a href="${contextPath}/delResale.res?re_num=${VO.re_num}">취소</a></td>
              </c:forEach>
            </table>
          <div class="checkout_btn_inner float-right">
          </div>
        </div>
      </div>
	</div>
  </section>
<jsp:include page="inc/footer.jsp"/>
</body>

</html>