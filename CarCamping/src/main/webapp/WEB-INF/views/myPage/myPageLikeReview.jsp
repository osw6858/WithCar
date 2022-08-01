<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<!-- Content Column Grid -->
<style>
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
.list-group-item{
	border:0;
}

 .card img {
	    width:286px;
	    height:190px;
	    overflow:hidden;
	    margin:0 auto;
	    object-fit:cover;
	}

</style>		

	<script>
		function popup_region(a){
			var url = "regionReviewView.region?review_num="+a
			var name = "내가 좋아요 한 리뷰"
			var option = "width=800,height=1000,top=100,left=300,location=no"
			window.open(url,name,option);
		}

		function popup_product(a){
			var url = "productReviewView.product?rp_num="+a
			var name = "내가 좋아요 한 리뷰"
			var option = "width=800,height=1000,top=100,left=300,location=no"
			window.open(url,name,option);
		}
		</script>
		
<div class="container" align="center"
   class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
   <div class="row" align="center">
      <h3 class="fw-bolder">내가 좋아요 한 리뷰</h3>
   </div>
      <!-- 리뷰 검색 모달 버튼 -->
<!--       <div class="col" align="right">
         <button type="button" class="btn btn-primary" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop">리뷰 검색</button>
      </div> -->
      <div class="col" align="left">
      <!-- 리뷰 검색 모달 버튼 끝 -->
    <div class="row"> 
      <!-- 드랍 버튼 -->
      <div class="col" align="right">
         <div class="btn-group">
            <button type="button" class="btn btn-dark dropdown-toggle"
               data-bs-toggle="dropdown" aria-expanded="false" style=" border-top-width: 0px;border-bottom-width: 0px; padding-bottom: 6px;">정렬</button>
            <ul class="dropdown-menu" style="">
               <li><a class="dropdown-item" href="myPageLikeReview.myPage?mode=ReviewRegionList">차박지 리뷰</a></li>
               <li><a class="dropdown-item" href="myPageLikeReview.myPage?mode=ReviewProductList">용품 리뷰</a></li>
               
            </ul>
         </div>
      </div>
   </div>
   </div> 
   <div class="row">&nbsp;</div>


   <!-- 리뷰 검색 모달 -->
   <form class="row gy-2 gx-3 align-items-center">
      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
         data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel">리뷰 검색</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
            </div>
         </div>
      </div>
   </form>
   <!--
   <!-- 리뷰 검색 모달 끝 -->
      <!-- 검색 form 끝 -->
               <%-- <c:set var="i" value="0" />
               <c:set var="j" value="3" />
               <table border="1">
                  <c:forEach items="${list }" var="list">
                     <c:if test="${i%j == 0 }">
                        <tr>
                     </c:if>
                     <td>${list }</td>
                     <c:if test="${i%j == j-1 }">
                        </tr>
                     </c:if>
                     <c:set var="i" value="${i+1 }" />
                  </c:forEach>
               </table> --%>
   <!-- 본문 -->

   <c:set var="i" value="0" />
     <c:set var="j" value="3" />
   <table class="table table-borderless">
   <c:if test="${mode eq 'ReviewProductList'}">
    <c:forEach items="${ReviewProductList}" var="rpdto">
    <c:if test="${i%j == 0 }">
      <tr> 
       </c:if>
         <td>
            <div class="card" style="width: 18rem;">
               <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rpdto.rp_image1}" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title">${rpdto.rp_title}</h5>
                  
                  <p class="card-text">
                     <label for="disabledRange" class="form-label">평점 : 
                     ${rpdto.rp_score}</label><br>
                     	별점 :
                              <c:choose>
                         <c:when test="${rpdto.rp_score >= 1 && rpdto.rp_score< 2 }">
                                   <label for="rate1">⭐</label>
                         </c:when>
                         <c:when test="${rpdto.rp_score >= 2 && rpdto.rp_score < 3 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                         </c:when>
                         <c:when test="${rpdto.rp_score >= 3 && rpdto.rp_score < 4 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                         </c:when>
                         <c:when test="${rpdto.rp_score >= 4 && rpdto.rp_score < 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                 <label for="rate4">⭐</label>
                         </c:when>
                         <c:when test="${rpdto.rp_score eq 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                <label for="rate4">⭐</label>
                                <label for="rate5">⭐</label> 
                         </c:when>
                         <c:otherwise>
                     		          ☆☆☆☆☆
                         </c:otherwise>
                        </c:choose>
                          <br>
                     조회수${rpdto.rp_readCount}&nbsp;|&nbsp;좋아요 개수 ${rpdto.rp_likeCount}<br>작성일:${rpdto.rp_sysdate}<br>
                   
                  </p>
                  <button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_product(${rpdto.rp_num})'">
							상세보기</button>&nbsp;&nbsp;
               </div>
            </div>
         </td>   
         <c:if test="${i%j == j-1 }">
      </tr>
      </c:if>
      <c:set var="i" value="${i+1 }" />
       
          </c:forEach>  
             </c:if>
   </table>
   
   <c:set var="i" value="0" />
     <c:set var="j" value="3" />
   <table class="table table-borderless">
   <c:if test="${empty mode || mode eq 'ReviewRegionList'}">
    <c:forEach items="${ReviewRegionList}" var="rvdto">
    <c:if test="${i%j == 0 }">
      <tr> 
       </c:if> 
         <td>
            <div class="card" style="width: 18rem;">
               <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rvdto.review_regionImage1}" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title">${rvdto.review_title}</h5>
                  
                  <p class="card-text">
                  
                     <label for="disabledRange" class="form-label">평점 :
                     ${rvdto.review_regionScore}</label> <br>
         		            별점 : 
                      
                              <c:choose>
                         <c:when test="${rvdto.review_regionScore >= 1 && rvdto.review_regionScore< 2 }">
                                   <label for="rate1">⭐</label>
                         </c:when>
                         <c:when test="${rvdto.review_regionScore >= 2 && rvdto.review_regionScore < 3 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                         </c:when>
                         <c:when test="${rvdto.review_regionScore >= 3 && rvdto.review_regionScore < 4 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                         </c:when>
                         <c:when test="${rvdto.review_regionScore >= 4 && rvdto.review_regionScore < 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                 <label for="rate4">⭐</label>
                         </c:when>
                         <c:when test="${rvdto.review_regionScore eq 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                <label for="rate4">⭐</label>
                                <label for="rate5">⭐</label> 
                         </c:when>
                         <c:otherwise>
                               ☆☆☆☆☆
                         </c:otherwise>
                        </c:choose>
                              <br>
                     조회수:${rvdto.review_readCount}&nbsp;|&nbsp;좋아요:${rvdto.review_likeCount}<br> 작성일:${rvdto.review_sysdate}<br>
                  </p>
                  <button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_region(${rvdto.review_num})'">
							상세보기</button>&nbsp;&nbsp;
                     
                     
               </div>
            </div>
         </td>   
         <c:if test="${i%j == j-1 }">
      </tr>
      </c:if>
      <c:set var="i" value="${i+1 }" />
          </c:forEach>  
          </c:if>     
   </table>

   

   <!-- 용품 내용 모달 -->
   <!-- <form class="row gy-2 gx-3 align-items-center">
      <div class="modal fade" id="staticBackdrop-1"
         data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" align="center">
                  <h5 class="modal-title" id="staticBackdropLabel">리뷰 제목</h5>
                  <div id="passwordHelpBlock" class="form-text">작성 일시</div>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <div class="modal-body">

                  리뷰요약내용
                  <div class="col">
                     <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="floatingInput"
                           placeholder="name@example.com"> <label
                           for="floatingInput">리뷰요약내용</label>
                     </div>
                  </div>

                  리뷰 상세  내용

                  <div class="form-floating">
                     <textarea class="form-control" placeholder="Leave a comment here"
                        id="floatingTextarea2" style="height: 100px"></textarea>
                     <label for="floatingTextarea2">리뷰 상세 설명</label>
                  </div>

                  리뷰 이미지 슬라이드

                  <div id="carouselExampleIndicators" class="carousel slide"
                     data-bs-ride="carousel">
                     <div class="carousel-indicators">
                        <button type="button"
                           data-bs-target="#carouselExampleIndicators"
                           data-bs-slide-to="0" class="active" aria-current="true"
                           aria-label="Slide 1"></button>
                        <button type="button"
                           data-bs-target="#carouselExampleIndicators"
                           data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button"
                           data-bs-target="#carouselExampleIndicators"
                           data-bs-slide-to="2" aria-label="Slide 3"></button>
                     </div>
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="HipProfile.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="BasicProfile.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                           <img src="HipProfile.png" class="d-block w-100" alt="...">
                        </div>
                     </div>
                     <button class="carousel-control-prev" type="button"
                        data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button"
                        data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                     </button>
                  </div>
                  <div class="row">&nbsp;</div>

                  인기리뷰 여부

                  <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" role="switch"
                        id="flexSwitchCheckDefault"> <label
                        class="form-check-label" for="flexSwitchCheckDefault">
                        인기리뷰 </label>
                  </div>

                  관리자 승인 여부

                  <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" role="switch"
                        id="flexSwitchCheckDefault"> <label
                        class="form-check-label" for="flexSwitchCheckDefault">
                        승인 </label>
                  </div>

                  버튼 영역
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary">닫기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form> -->
   <!-- 용품 내용 모달 끝 -->

   <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
         <c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="myPageLikeReview.myPage?page=${page-1}">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="myPageLikeReview.myPage?page=${i}" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="myPageLikeReview.myPage?page=${i}">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="myPageLikeReview.myPage?page=${page+1}">Next</a></li>
         </c:if>
      </ul>
   </nav> 
</div>
<!-- <script>
      function popup(review_num) {
         var isEmpty = function(value){//빈값체크
               if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
                 return true
               }else{
                 return false
               }
             };
         var mid = '${mem_id}';
         if(!isEmpty(mid)){
         var url = "myPageProductReview.myPage?mem_num="+mem_num;
         var name = "popup";
          var _left = Math.ceil(( window.screen.width - 800 )/2);
         var _top = Math.ceil(( window.screen.height - 1000 )/2); 
         var option = "width = 800, height = 900, top ="+_top+", left = "+_left+"'y', location = no,  menubar=no,resizable=no.toolbar=no";
         window.open(url, name, option);
         }else{
            alert("리뷰를 보기위해서는 로그인이 필요합니다 !");
         }
      }
      </script> -->
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>