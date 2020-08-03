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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
        <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
       <c:if test="${msg != null}">
               <script type="text/javascript">
               window.alert('${msg}');
               </script>
       </c:if>
       <c:remove var="msg"/>
</head>
<body>
	<jsp:include page="inc/header.jsp" />

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>위시 리스트</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
  <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">상품</th>
                <th scope="col">가격</th>
                <th scope="col">결제</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="wish" items="${wishList}" varStatus="cnt">
              <tr>
                <td>
                  <div class="media" style="cursor: pointer;" onclick="location.href='${contextPath}/productInfo.pro?num=${product.num}'">
                    <div class="d-flex">
                      <img src="${contextPath}/resources/img_catfood/${wish.image}"/>
                    </div>
                    <div class="media-body">
                      <p>${wish.name}</p>
                    </div>
                  </div>
                </td>
                <td>
                  <h5>
                  <fmt:formatNumber value="${wish.price}" type="currency" currencySymbol="￦"/>
                  </h5>
                </td>
                <td>
				<form action="${contextPath}/deletewish.pro" method="post">
				<input type="hidden" name="id" value="${id}">
				<input type="hidden" name="num" value="${wish.num}">
				<input type="submit" value="삭제">
				</form>
                </td>
              </tr>
              </c:forEach>
              <tr class="bottom_button">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                <div class="clear"></div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div> 
  </section>
<jsp:include page="inc/footer.jsp"/>
</body>
</html>