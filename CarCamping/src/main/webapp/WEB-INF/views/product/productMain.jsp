<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>



<!-- CSS only -->
<style type="text/css">
.swiper-container {
   height: 420px;
   border: 5px solid silver; 
   border-radius: 7px;
   box-shadow: 0 0 20px #ccc inset;
}
.swiper-slide {
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
}
.swiper-slide img {
   box-shadow: 0 0 5px #555;
   max-width: 100%;
}
.d-flex .card {
   margin-right: 20px;
}
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

</style>

<i class="fa-brands fa-searchengin"></i>
<!-- 클래스명은 변경하면 안 됨 -->

<div id="doc" class="gm-t7">
   <div class="gm-b">
      <div id="secondary">
       

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style=" margin-left: 255px;margin-right: 255px;"">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/banner1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/banner2.JPG" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/banner_2.PNG" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>            <!-- 이전 버튼 -->
            <!-- 페이징 -->
            <div class="swiper-pagination"></div>
         </div>
			<nav class="navbar navbar-expand-lg "Eighthnavbarexample" 
               style="margin-bottom: 0px;background-color: #fff;border-left-width: 100px;margin-left: 213px;margin-right: 213px;margin-top: 10px;">
           

               <div class="container">
                                  <a class="navbar-brand text-dark" style="margin-right:570px;" href="goProduct.product"><font size="5"><b>✨ 전 체 용 품</b></font></a>
               <!-- 검색 form  #091835-->
               <div class="d-flex" style="width: 500px; height: 40px;">
                <div class="input-group">
                  <!-- 검색 form -->
                  <form class="d-flex" action="goProduct.product" style="width: 500px; height: 40px;" method="get">
                     <select class="form-control" name="search" style="width: 156px;">
                        <option value="prod_name">용품명</option>
                        <option value="brand_name">브랜드명</option>
                     </select> 
                     <input class="form-control" class="form-control me-3" type="text" name="searchString" placeholder="용품을 검색해보세요!" aria-label="Search" style="margin-left: 0px;"> 
                        <button type="submit" class="btn btn-dark" style="padding-left: 0px; padding-right: 0px; width: 122px; background-color: #00205b; border-color: #00205b; margin-right: 3px;">검색</button>
                  
						<div class="btn-group">
                       <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #00205b; border-color: #00205b;">정렬</button>
                           <ul class="dropdown-menu" style="margin-right: 13px;">
                           <li><a class="dropdown-item" href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductNew">최신순 </a></li>
                           <li><a class="dropdown-item" href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductPop">별점순</a></li>
                          <li> <a class="dropdown-item" href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductPrice">가격순</a></li>
                        </ul>
                        </div>
                  </form>
				</div>
               </div>
               </div>
         </nav>
          <div 
               style="margin-bottom: 0px;background-color: #fff;border-left-width: 100px;margin-left: 255px;margin-right: 255px;margin-top: 2px;">

                <hr style="border: 0;height: 2px;background-color: #585858d4;margin-top: -16;margin-top: -16;margin-top: 0px;margin-bottom: 16px;">
         </div>
 
         <c:set var="i" value="0" />
         <c:set var="j" value="4" />
         <table align="center"
            style="border: 1px solid;border-left-width: 30px;border-color: transparent;">
            <c:forEach items="${listProduct}" var="pdto">
               <c:if test="${i%j == 0 }">
                  <tr>
               </c:if>
               <td>
                  <div class="card"
                     style="width: 18rem; margin-right: 30px; margin-bottom: 50px;">
                     <a href="productView.product?prod_num=${pdto.prod_num}"><img
                        src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}" width="286" height="200"
                        ></a>
                     <div class="card-body" style="width: 286px; height: 235px;" >
                           <div class="card-body">
										<h5 class="card-title"><font color="black" ><b>${pdto.prod_name}</b></font></h5>
										<hr style="background-color: #585858d4;">
										<p class="card-text"> <font size="2" color ="gray">${pdto.brandCategoryDTO.brand_name}</font></p>
										<p class="card-text">${pdto.prod_price} 원</p>
										<li class="list-group-item d-flex justify-content-between align-items-center" style="border: 0;padding-left: 0px;">
							<div class="container" style="width: 300px;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: 0px;">
								<div class="row">
									<div id="myform">
										<fieldset style="width: 100%;">
										<c:choose>
				 				<c:when test="${pdto.prod_reviewScore >= 1 && pdto.prod_reviewScore < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${pdto.prod_reviewScore >= 2 && pdto.prod_reviewScore < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${pdto.prod_reviewScore >= 3 && pdto.prod_reviewScore < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${pdto.prod_reviewScore >= 4 && pdto.prod_reviewScore < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${pdto.prod_reviewScore eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						<label for="rate4">⭐</label>
				  						<label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
										별점을 등록해 주세요! 
								 </c:otherwise>
								</c:choose>
								<label style="padding-right: 50px;"><font size="2" color ="gray">(${pdto.prod_reviewScore}/5) ${pdto.prod_reviewCount}개의 리뷰</font></label>
										</fieldset>										
									</div>
								</div>
							</div>
						</li>
									</div>

                       
                        <br>

                     </div>
                  </div>
               </td>
               <c:if test="${i%j == j-1 }">
                  </tr>
               </c:if>
               <c:set var="i" value="${i+1 }" />
            </c:forEach>
            <c:if test="${empty listProduct}">
               <div class="card" style="width: 20rem;">
                  <h4>등록된 상품이 없습니다!</h4>
                  <br>
                  <div class="card-body">
                     <p class="card-text">다시 검색해 주세요!</p>
                  </div>
               </div>
            </c:if>
         </table>
      </div>
   </div>
</div>


<nav aria-label="Page navigation example">
   <ul class="pagination justify-content-center">
      <c:if test="${rowCount>0 }">
         <c:if test="${startPage>1}">
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${startPage-1}&mode=${mode}'">
                  Previous</a></li>
         </c:if>
         <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <!-- 1 2  -->
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${i}&mode=${mode}'">
                  <c:out value="${i}" />
            </a></li>
         </c:forEach>
         <c:if test="${endPage < pageCount }">
            <li class="page-item"><a class="page-link"
               onclick="location.href='goProduct.product?&pageNum=${endPage+1}&mode=${mode}'">
                  Next</a></li>
         </c:if>
      </c:if>
   </ul>
</nav>
<br><br>

<%@ include file="../bottom.jsp"%>