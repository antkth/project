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
</head>
<body>
	<jsp:include page="inc/header.jsp" />

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>주문정보</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
  <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner" style="text-align: center;">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col">번호</th>
                <th scope="col">상품</th>
                <th scope="col">수량</th>
                <th scope="col">가격</th>
                <th scope="col">구매일</th>
                <th scope="col">현재상태</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="VO" items="${getpurList}" varStatus="cnt">
              <tr>
              	<td>
              		${cnt.count}
              	</td>
                <td>
                  <div class="media">
                    <div class="d-flex">
                      <a href="${contextPath}/productInfo.pro?num=${VO.num}"><img src="${contextPath}/resources/img_catfood/${VO.image}"/></a>
                    </div>
                    <div class="media-body">
                      <a href="${contextPath}/productInfo.pro?num=${VO.num}"><p>${VO.name}</p></a>
                    </div>
                  </div>
                </td>
                <td>
                  <h5>
                  	  <p>${VO.qty}</p>
                  </h5>
                </td>
                <td>
                  <h5>
                 	  <fmt:formatNumber value="${VO.price}" type="currency" currencySymbol="￦"/>
                  </h5>
                </td>
                <td width="13%">
                	<p><fmt:formatDate value="${VO.put_date}" pattern="YYYY-MM-dd"/></p>
                </td>
                
                <c:choose>
                <c:when test="${VO.pur_status==1}">
                 <td><p>입금완료</p></td>
                </c:when>
                <c:when test="${VO.pur_status==2}">
                 <td><p>배송대기</p></td>
                </c:when>
                <c:when test="${VO.pur_status==3}">
                 <td><p>배송출발</p></td>
                </c:when>
                <c:when test="${VO.pur_status==4}">
                 <td>
                 <p>배송완료</p>
                 <p>
                 	<form action="${contextPath}/deletewish.pro" method="post">
					<input type="hidden" name="id" value="${id}">
					<input type="hidden" name="num" value="${VO.num}">
					<input type="button" value="반송신청"> <br>
					<input type="submit" value="삭제">
					</form>
				 </p>
                 </td>
                </c:when>
                <c:otherwise>
                 <td>
					<form action="${contextPath}/deletewish.pro" method="post">
					<input type="hidden" name="id" value="${id}">
					<input type="hidden" name="num" value="${VO.num}">
					<input type="submit" value="삭제">
					</form>
				 </td>
				</c:otherwise>
				</c:choose>
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