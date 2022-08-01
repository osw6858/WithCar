<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<%@ include file="../top.jsp" %>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<section class="pt-5 pb-5">
  <div class="container">
    <div class="row w-100">
        <div class="col-lg-12 col-md-12 col-12">
            <h3 class="display-5 mb-2 text-center">장바구니</h3>
            <h3 class="mb-5 text-center">- 장바구니에 담긴 상품 <i class="text-info font-weight-bold"></i> -</h3>
            <table id="shoppingCart" class="table table-condensed table-responsive">
                <thead>
                    <tr>
                        <th style="width:60%">상품</th>
                        <th style="width:12%">가격</th>
                        <th style="width:10%">수량</th>
                        <th style="width:16%"></th>
                    </tr>
                </thead>
                <tbody>
        <!-- ------------------------------------------- -->
       <c:if test="${empty cartList}">
        <tr>
                        <td data-th="Product">
                       
                            <div class="row">
                                <div class="col-md-3 text-left">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <h4>장바구니에 추가된 상품이 없습니다</h4>
                                   <br>
                                    <br>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">0원</td>
                    </tr>
       </c:if>
         <c:forEach items="${cartList}" var="mdto">
                    <tr>
                        <td data-th="Product">
                       
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${mdto.productDTO.prod_viewImage1}" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                
                                    <h4>용품명 : ${mdto.productDTO.prod_name}</h4>
                                    <p class="font-weight-light">대여하실 날짜는 ${mdto.cart_from} ~ ${mdto.cart_to} 까지 입니다.<br>
                                     	대리점명 : ${mdto.agencyDTO.agency_name}
                                    </p><br>
                                  			
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">${mdto.productDTO.prod_price}원</td>
                        
                        <td>
                             <form action="mall_cartEdit.myPage" method="post">
                             	<input type="number" min="1" max="10" name= "cart_prodCount" value="${mdto.cart_prodCount}">
                             	<input type="hidden" name= "prod_num" value="${mdto.productDTO.prod_num }">
                             	<input type="hidden" name= "cart_from" value="${mdto.cart_from }">
                             	<input type="hidden" name= "cart_to" value="${mdto.cart_to }">
                             	<br><br>
                                <button type="submit" class="btn btn-white border-secondary bg-white btn-md mb-2">
                                  		  수정
                                </button>
                               </form>
                            <a  href="mall_cartDel.myPage?prod_num=${mdto.productDTO.prod_num }&cart_from=${mdto.cart_from}&cart_to=${mdto.cart_to}&cart_num=${mdto.cart_num}">
                            <button class="btn btn-white border-secondary bg-white btn-md mb-2" >
                                   		삭제
                                </button></a> 
                        </td> 
                    </tr>
                    </c:forEach>
         <!-- ------------------------------------------------- -->
                </tbody>
            </table>
            <div style="float:right">
          	<c:set var ="cartTotalPrice" value="0"/>
         <c:forEach items="${cartList}" var="mdto">
        <c:set var="cartTotalPrice" value="${cartTotalPrice + mdto.productDTO.prod_price * mdto.cart_prodCount}"/>
         </c:forEach>
                <h4>합계</h4>
                <h1>${cartTotalPrice}원</h1>
            </div>
        </div>
    </div>
    
    <div class="row mt-4 d-flex align-items-center">
        <div class="col-sm-6 order-md-2 text-right">
            <a href="checkOut.myPage" class="btn btn-dark mb-4 btn-lg pl-5 pr-5" style="background:#091835">결제하기</a>
        </div>
        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
            <a href="goProduct.product"><!-- 로그인하면 회원번호 추가 -->
                <i class="fas fa-arrow-left mr-2"></i> 계속 쇼핑하기</a>
        </div>
    </div>
</div>
</section>
 <%@ include file="../bottom.jsp" %>
 
 