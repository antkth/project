<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<!doctype html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="${contextPath}/resources/js/mypage.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
 <section class="confirmation_part section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
            <span>Thank you. Your order has been received.</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>회원정보</h4>
            <ul>
              <li>
                <p>아이디</p><span>: ${meminfo.id}</span>
              </li>
              <li>
                <p>이름</p><span>: ${meminfo.name}</span>
              </li>
              <li>
                <p>휴대폰번호</p><span>: ${meminfo.phone}</span>
              </li>
              <li>
                <p>이메일</p><span>: ${meminfo.email}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>배송지 정보</h4>
            <ul>
              <li>
                <p>주소1</p><span>: ${meminfo.d_addr1}</span>
              </li>
              <li>
                <p>주소2</p><span>: ${meminfo.d_addr2}</span>
              </li>
              <li>
                <p>주소3</p><span>: ${meminfo.d_addr3}</span>
              </li>
              <li>
                <p>주소4</p><span>: ${meminfo.d_addr4}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>포인트 정보</h4>
            <ul>
              <li>
                <p>현제 포인트</p><span>: ${meminfo.point}</span>
              </li>
              <li>
                <p>사용한 포인트</p><span>: ${meminfo.u_point}</span>
              </li>
            </ul>
          </div>
        </div>
         <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
          	<form action="${contextPath}/member/updateaddr.mem" method="post">
          	<input type="hidden" name="id" value="${meminfo.id}">
            <h4>배송지 변경</h4>
                <p><input type="text" name="d_addr1" id="sample6_postcode" placeholder="우편번호" value="${meminfo.d_addr1}"
					class="single-input" style="width: 35%; float: left;" readonly="readonly"></p><span><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="genric-btn success circle">
					<input type="submit" value="변경하기" class="genric-btn success circle">
					</span>
                <p><input type="text" name="d_addr2" 	id="sample6_address" placeholder="주소" class="single-input" readonly="readonly" value="${meminfo.d_addr2}"></p>
                <p><input type="text" name="d_addr3"	id="sample6_detailAddress" placeholder="상세주소" class="single-input" value="${meminfo.d_addr3}"> </p>
                <p><input type="text" name="d_addr4"	id="sample6_extraAddress" placeholder="참고항목" class="single-input" readonly="readonly" value="${meminfo.d_addr4}"></p>
            </form>
          </div>
        </div>
      </div>
      </div>
      </section>
    <section class="feature_part section_padding">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <div class="feature_part_tittle">
                        <h3>Credibly innovate granular
                        internal or organic sources
                        whereas standards.</h3>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="feature_part_content">
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_1.svg">
                        <h4>포인트 충전</h4>
                        <div class="mt-10">
							<input type="text" name="C_point" id="C_point" placeholder="결제금액"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '결제금액'" required
								class="single-input-primary" numberOnly>
						</div>
						<script type="text/javascript">
						$("#C_point").on("keyup", function() {
						    $(this).val($(this).val().replace(/[^0-9]/g,""));
						});
						</script>
                        <input type="button" class="genric-btn primary-border small" value="결제" onclick="insertpoint()">
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_2.svg">
                        <h4>Online Order</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_3.svg">
                        <h4>Free Delivery</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="${contextPath}/resources/img/icon/feature_icon_4.svg">
                        <h4>Product with Gift</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="../inc/footer.jsp"/>
</body>

</html>