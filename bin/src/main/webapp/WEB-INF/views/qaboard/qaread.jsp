<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                        <h2>single blog</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section_padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="blog_details">
                     <h2>${info.title}</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="far fa-user"></i>${info.id}</a></li>
                        <li><a href="#"><i class="far fa-comments"></i><f:formatDate value="${info.qa_date}" pattern="yyyy-MM-dd"/></a></li>
                     </ul>
                     <p class="excert">
                        ${info.content}
                     </p>
                     <div class="quote-wrapper">
                        <div class="quotes">
                          ${info.answer}
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>