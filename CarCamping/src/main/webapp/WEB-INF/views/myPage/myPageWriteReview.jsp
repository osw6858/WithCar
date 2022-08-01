<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myPageWriteReviewButton.jsp"%> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
	<div class="row" align="center">
		</div>
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
}T
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
<!-- Content Column Grid -->
	<script>
		function popup_region(a){
			var url = "regionReviewView.region?review_num="+a
			var name = "내가 쓴 리뷰"
			var option = "width=800,height=1000,top=100,left=300,location=no"
			window.open(url,name,option);
		}

		function popup_product(a){
			var url = "productReviewView.product?rp_num="+a
			var name = "내가 쓴 리뷰"
			var option = "width=800,height=1000,top=100,left=300,location=no"
			window.open(url,name,option);
		}
		</script>

<table class="table table-borderless">


<!-- 차박지 리뷰 -->
<c:if test="${empty param.mode}">
	<!-- 본문 -->

	<c:if test="${empty listRegion}">
			<tr>
				<td>작성한 차박지 리뷰가 없습니다.</td>
			</tr>
		</c:if>
			<br>		
		<c:forEach var="rdto" items="${listRegion}">
			<td>
				<div class="card" style="width: 18rem;">
					<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage1}" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${rdto.review_title}</h5>
						<p class="card-text">
							<!-- 별점 -->	
							<label for="disabledRange" class="form-label">평점 :
												${rdto.review_regionScore}</label> <br>
											별점 : 	
													<c:choose>
				 				<c:when test="${rdto.review_regionScore >= 1 && rdto.review_regionScore < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.review_regionScore >= 2 && rdto.review_regionScore < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${rdto.review_regionScore >= 3 && rdto.review_regionScore < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.review_regionScore >= 4 && rdto.review_regionScore < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.review_regionScore eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				  						 <label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
								  ☆☆☆☆☆
								 </c:otherwise>
								</c:choose> <br>
							조회수 ${rdto.review_readCount} &nbsp;|&nbsp;좋아요 개수 ${rdto.review_likeCount}<br>작성일 ${rdto.review_sysdate}<br>
						</p>
						<button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_region(${rdto.review_num})'">
							상세보기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-dark"
							onclick="location.href='myPageWriteReviewRegionDelete.myPage?review_num=${rdto.review_num}'">
							삭제하기</button>
						</div>
					</div>
				</td>
		<c:set var="count" value="${count+1}"/>
            <c:if test="${count==3}">
               <c:set var="count" value="0"/>
               </tr><tr>   
            </c:if>
		</c:forEach>
	</c:if>



		<!-- 용품 리뷰만 보기 -->	
<c:if test="${not empty param.mode}">
	<c:if test="${empty listProduct}">
			<tr>
				<td>작성한 용품 리뷰가 없습니다.</td>
			</tr>
		</c:if>	
					<br>		
		<c:forEach var="pdto" items="${listProduct}">
			<td>
				<div class="card" style="width: 18rem;">
					<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.rp_image1}" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${pdto.rp_title}</h5>
						<p class="card-text">
													<!-- 별점 -->	
							<label for="disabledRange" class="form-label">평점 :
												${pdto.rp_score}</label> <br>
											별점 : 	
													<c:choose>
				 				<c:when test="${pdto.rp_score >= 1 && pdto.rp_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${pdto.rp_score >= 2 && pdto.rp_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${pdto.rp_score >= 3 && pdto.rp_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${rdto.review_regionScore >= 4 && pdto.rp_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${pdto.rp_score eq 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				  						 <label for="rate5">⭐</label> 
				 				</c:when>
								 <c:otherwise>
								  ☆☆☆☆☆
								 </c:otherwise>
								</c:choose> <br>
							
							조회수 ${pdto.rp_readCount} &nbsp;|&nbsp;좋아요 개수 ${pdto.rp_likeCount}<br>작성일 ${pdto.rp_sysdate}<br>
						</p>
						<button type="button" class="btn btn-dark"
							onclick="location.href='javascript:popup_product(${pdto.rp_num})'">
							상세보기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-dark"
							onclick="location.href='myPageWriteReviewProductDelete.myPage?rp_num=${pdto.rp_num}'">
							삭제하기</button>
						</div>
					</div>
				</td>
				
			<c:set var="count" value="${count+1}"/>
            <c:if test="${count==3}">
               <c:set var="count" value="0"/>
               </tr><tr>   
            </c:if>
		</c:forEach>
	</c:if>
</table>	

<c:if test="${empty param.mode}">	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${page-1}&mem_num=${sessionScope.mem_num}">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${i}&mem_num=${sessionScope.mem_num}" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${i}&mem_num=${sessionScope.mem_num}">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${page+1}&mem_num=${sessionScope.mem_num}">Next</a></li>
         </c:if>
		</ul>
	</nav>
	</c:if>
	<c:if test="${not empty param.mode}">	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${page-1}&mem_num=${sessionScope.mem_num}&mode=product">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${i}&mem_num=${sessionScope.mem_num}&mode=product" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${i}&mem_num=${sessionScope.mem_num}&mode=product">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="myPageWriteReview.myPage?page=${page+1}&mem_num=${sessionScope.mem_num}&mode=product">Next</a></li>
         </c:if>
		</ul>
	</nav>
	</c:if>
	<br>
	<br>
</div>

<%@ include file="../bottom.jsp"%>