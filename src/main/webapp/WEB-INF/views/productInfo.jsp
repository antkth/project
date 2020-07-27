<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
        <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
 <script>
 $(document).ready(function(){	
	 listReply();
		$("#btnReply").click(function(){
			var content = $("#content").val();
			var num = "${productVO.num}";
			var score=0;
			var radio_btn = document.getElementsByName("star");
			for(var i=0;i<radio_btn.length;i++){
				if(radio_btn[i].checked==true){
					score=radio_btn[i].value;
				}
			}
			if(content == null || content==""){
				alert("내용을 입력해주세요");
				return;
			}
			var param = "content="+content+"&num="+num+"&id=${sessionScope.id}"+"&score="+score;
			$.ajax({
				type: "post",
				async: false,
				url : "${contextPath}/reviewAdd.rev",
				data : param,
				success:function(data){
					alert("댓글작성이 완료되었습니다.");
					$("#content").val("");
					listReply();
				}
			});
		});
	 function listReply(){
		var num = "${productVO.num}";
		$.getJSON("${contextPath}/reviewList.rev?num=${productVO.num}",function(data){
			var output = '';
			$.each(data, function(index,item){
				     output += '<div class="comment-list">';
				     output += '<div class="single-comment justify-content-between d-flex">';
				     output += '<div class="user justify-content-between d-flex">';
				   	 output += '<div class="desc"><h5>작성자 : '+item.id+'&nbsp;&nbsp;&nbsp;&nbsp';
				   	 output += '작성일 : '+item.date+'&nbsp;&nbsp;&nbsp;&nbsp; 평점 : '+item.score+'';
				   	 if ('${sessionScope.id}' == item.id) {
				   		 output += '<a onclick="commentDelete('+item.r_num+');" class="genric-btn default-border circle"><font color="blue">삭제</font></a></h5>';
					}
				   	 output += '<div class="d-flex justify-content-between">';
				   	 output += '<div class="d-flex align-items-center">';
				     output += '<p class="comment">내용 : '+item.content+'</p>';
					 output += '</div></div></div></div></div><br>';
			});
			 $("#listReply").html(output);
		});
	} 			
}); 
	function commentDelete(r_num){
		 console.log(1);
		 $.ajax({
			 url : "${contextPath}/reviewDel.rev",
			 type : "post",
			 data : {r_num : r_num},
			 async : false,
			 success : function(data){
					alert("삭제가 완료되었습니다.");
					window.location.reload();
			 }
		 });
	 }	
</script>
<style type="text/css">
.img-fluid {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.img-fluid:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.img {width:325px; height:280px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */
</style> 
</head>
<body>
 <jsp:include page="inc/header.jsp"/>
    <section class="breadcrumb_part single_product_breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="product_image_area">
    <div class="container">
    	<form action="${contextPath}/addCart.car?num=${productVO.num}" method="post">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="product_img_slide owl-carousel">
            <div class="single_product_img">
              <img src="${contextPath}/resources/img_catfood/${productVO.image}" alt="#" class="img-fluid" style="height: 500px;">
            </div>
          </div>
        </div>
        <div class="col-lg-8">
          <div class="single_product_text text-center">
            <h3>${productVO.name}</h3>
            	<div class="container">
	            <table class="table table-striped" >
	            	<tr>
		            	<th>원산지</th>
		            	<th>제조사</th>
		            	<th>가격</th>
		            	<th>종류</th>
		            	<th>유통기한</th>
		            	<th>평점</th>
	            	</tr>
	            	<tr>
	            		<td>${productVO.origin}</td>
	            		<td>${productVO.manufacturer}</td>
                        <c:choose>
                        <c:when test="${productVO.price == productVO.real_price}">
	            		<td>${productVO.price}</td>
                        </c:when>
                        <c:otherwise>
	            		<td><font style="text-decoration: line-through;" color="gray">${productVO.price}</font><br>${productVO.real_price}</td>
                        </c:otherwise>
                        </c:choose>
	            		<td>${productVO.category3}</td>
	            		<td>
	            			<fmt:formatDate value="${productVO.exp_date}" pattern="yyyy-MM-dd" />
	            		</td>
	            		<td>
	            		<c:forEach begin="1" end="${scoreAVG}">
	            			<img src="resources/img/star/star01.gif" id="star">
	            		</c:forEach>
		            		<br><fmt:formatNumber value="${scoreAVG}" pattern=".00" /> 

	            		</td>
	            	</tr>
	            </table>
				</div>
            <div class="card_area">
                <div class="product_count_area">
                    <p>수량</p>
                    <div class="product_count d-inline-block">
                       <!--   <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span> -->
                        <select id="qty" class="product_count_item input-number" name="qty">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
                        	<option value="4">4</option>
                        </select>
                        <!-- <input class="product_count_item input-number" type="text" value="1" min="0" max="10" id="count"> -->
                        <!-- <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>  -->
                    </div>
                </div>
              <div class="add_to_cart">
              		<input type="hidden" name="id" value="${sessionScope.id}">
              		<input type="hidden" name="image" value="${productVO.image}">
              		<input type="hidden" name="name" value="${productVO.name}">
              		<input type="hidden" name="origin" value="${productVO.origin}">
	            	<input type="hidden" name="manufacturer" value="${productVO.manufacturer}">
	            	<input type="hidden" name="price" value="${productVO.real_price}">
	            	<input type="hidden" name="category3" value="${productVO.category3}"> 
                  <input type="submit" class="btn_3" value="장바구니 추가하기">
              </div>
            </div>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
  
  <!-- 댓글 -->
  <div class="container" style=" width:650px; text-align: center;">
  <table id="review" cellspacing="0" cellpadding="0" border="0">
  	<tr id="star_tr">
				<td></td>
					<td ><input type="radio" value="5" id="star" name="star" checked="checked">
					    <img src="resources/img/star/star01.gif" id="star" >
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star"> 
					</td>
					<td><input type="radio" value="4" id="star" name="star">
					    <img src="resources/img/star/star01.gif" id="star" >
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
				    </td>
					<td>
						<input type="radio" value="3" id="star" name="star">
					    <img src="resources/img/star/star01.gif" id="star" >
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star" > </td>
					<td><input type="radio" value="2" id="star" name="star">
					    <img src="resources/img/star/star01.gif" id="star" >
					    <img src="resources/img/star/star01.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star"> </td>
					<td><input type="radio" value="1" id="star" name="star">
					    <img src="resources/img/star/star01.gif" id="star" >
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star">
					    <img src="resources/img/star/star00.gif" id="star"> </td>
					    <td></td>
			</tr>
  	</table>
  	</div>
  <div style="width: 650px; text-align: left;" class="container">
  
  
  
  	<br>
  	<c:if test="${sessionScope.id != null}">
  		<textarea rows="5" cols="50" id="content" name="content" placeholder="댓글을 입력하세요."  ></textarea>
  	<br>
  	<button type="button" id="btnReply" class="btn btn-primary">댓글 작성</button>
  	</c:if>
  </div>
  <div class="container" style="width: 650px; text-align: center;"><div id="listReply" class="comment-area"></div></div>
  
  <!--================End Single Product Area =================-->
   <!-- subscribe part here -->
   <section class="subscribe_part section_padding">
      <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-8">
                  <div class="subscribe_part_content">
                      <h2>Get promotions & updates!</h2>
                      <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                      <div class="subscribe_form">
                          <input type="email" placeholder="Enter your mail">
                          <a href="#" class="btn_1">Subscribe</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- subscribe part end -->
 <jsp:include page="inc/footer.jsp"/>

</body>

</html>
