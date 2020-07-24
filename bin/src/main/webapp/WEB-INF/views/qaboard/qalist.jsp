<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <jsp:include page="../inc/header.jsp"/>

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
          <table class="table">
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성날짜</th>
                <th scope="col">상태</th>
              </tr>
              <c:forEach items="${list}" var="i">
              <tr>
              	<td>${i.qa_num}</td>
              	<td><a href="${contextPath}/qaboard/qaread.qab?qa_num=${i.qa_num}">${i.title}</a></td>
              	<td><f:formatDate value="${i.qa_date}" pattern="yyyy-MM-dd"/></td>
              	<td>${i.cur_status}</td>
              </tr>
              </c:forEach>
 
            </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="${contextPath}/qaboard/qawrite.qab">문의하기</a>
          </div>
        </div>
      </div>
    </div>
  </section>
<jsp:include page="../inc/footer.jsp"/>
</body>

</html>