<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<style>
 .carousel-item img {
	    width:598px;
	    height:400px;
	    overflow:hidden;
	    margin:0 auto;
	    object-fit:cover;
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
div .cardbody {
    display: block;  
}
#reviewTitle {
  max-width: 200px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
   
#reviewSummary{
max-width: 200px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>


<c:set var="prod_num" value="${sessionScope.prod_num}" />
<c:set var="mem_num" value="${sessionScope.mem_num}" />

<div class="modal modal-center fade" id="prodContent" tabindex="-1"
	role="dialog" aria-labelledby="regionContentLabel">
	<div class="modal-dialog modal-center modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">${getProduct.prod_name}의
					정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			    
					<!-- 현재 이미지 캐러셀 -->
					&nbsp;
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active ">
								<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage1}" class="d-block w-100" alt="...">
							</div>
							<c:if test="${not empty getProduct.prod_viewImage2}">
							<div class="carousel-item ">
								<img  src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage2}" class="d-block w-100" alt="...">
							</div>
							</c:if>
							<c:if test="${not empty getProduct.prod_viewImage3}">
							<div class="carousel-item">
								<img  src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage3}" class="d-block w-100" alt="...">
							</div>
							</c:if>
							<c:if test="${not empty getProduct.prod_viewImage4}">
							<div class="carousel-item">
								<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage4}" class="d-block w-100" alt="...">
							</div>
							</c:if>
							<c:if test="${not empty getProduct.prod_viewImage5}">
							<div class="carousel-item">
								<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage5}" class="d-block w-100" alt="...">
							</div>
							</c:if>
						</div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
   						 <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
					</div>
			 <hr class="mb-4">		
			<div class="modal-body">${getProduct.prod_viewContent}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" 
					data-bs-dismiss="modal" style="width: 100%; background:#091835;">Close</button>
			</div>
			    
		</div>
	</div>
</div>
 
<style>
html, body {
	background: white;
}

body {
	background: white;
}

.row mb-3 {
	margin-left: 25px;
	margin-top: 60px;
}

#prodInfo li {
	width: 100%;
	padding-bottom: 0px;
	padding-top: 0px;
	border-color: #00205b;
}

.modal.modal-center {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center.modal-lg {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	 
}

#prodContent .modal-content {
	width: 600px;
	height: 800px;
}

#prodContent 
.border .border-4 {
	border-color: red;
}

//0701박혜성
div .cardbody {
    display: block;  
}
#reviewTitle {
  max-width: 200px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
   
#reviewSummary {
max-width: 200px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

</style>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous">
</script> -->

<div class="container-fluid themed-container" style="margin-left: 90px;"
	id="test">
	<div class="row mb-3">
	
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white border border-4 border-dark"
			style="width: 332px; padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; height: 632px; margin-right: 86px; margin-top: 50px;">
		<form action="myPageCart.myPage" method="post" onsubmit="return chk_rent()">
			<input type="hidden" name="productDTO.prod_num" value="${getProduct.prod_num}">
            <c:if test="${not empty mem_num}">
               <input type="hidden" name="memberDTO.mem_num" value="${mem_num}">
            </c:if>
          <%--   <c:if test="${empty mem_num}">
               <input type="hidden" name="loginCheck" value='0'>
            </c:if> --%>
				<span class="fs-4 text-center" style="height: 40px;">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#prodContent"
						style="background-color: #00205b; border-color: #00205b; width: 100%">${getProduct.prod_name}</button>
				</span>

				<hr style="margin-top: 0px; margin-bottom: 5px;">
				<ul id="prodInfo" class="nav nav-pills flex-column mb-auto"
					style="margin-bottom: 0px; height: 490px;">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getProduct.prod_viewImage1}" class="card-img-top"
						style="height: 250px;">
					</li>

					<li id="viewCount"
						class="list-group-item d-flex justify-content-between align-items-center">
						리 뷰 수
						<button type="button" class="btn btn-dark rounded-pill" disabled
							style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px;">
							${countReviewProd}</button>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						별점 (${getProduct.prod_reviewScore}/5)
						<div class="container"
							style="width: 424px; margin-left: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px;">
							<div class="row">
								<div id="myform">
									<fieldset style="float: right;">
										<c:choose>
											<c:when
												test="${getProduct.prod_reviewScore >= 1 && getProduct.prod_reviewScore < 2 }">
												<label for="rate1">⭐</label>
											</c:when>
											<c:when
												test="${getProduct.prod_reviewScore >= 2 && getProduct.prod_reviewScore < 3 }">
												<label for="rate1">⭐</label>
												<label for="rate2">⭐</label>
											</c:when>
											<c:when
												test="${getProduct.prod_reviewScore >= 3 && getProduct.prod_reviewScore < 4 }">
												<label for="rate1">⭐</label>
												<label for="rate2">⭐</label>
												<label for="rate3">⭐</label>
											</c:when>
											<c:when
												test="${getProduct.prod_reviewScore >= 4 && getProduct.prod_reviewScore < 5 }">
												<label for="rate1">⭐</label>
												<label for="rate2">⭐</label>
												<label for="rate3">⭐</label>
												<label for="rate4">⭐</label>
											</c:when>
											<c:when test="${getProduct.prod_reviewScore eq 5 }">
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
									</fieldset>
								</div>
							</div>
						</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center"
						style="height: 31px;">일일대여 요금
						<div>${getProduct.prod_price }원</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center"
						style="height: 31px;">대여 시작 날짜
						<div>
							<input type="date" id="indate1" name="cart_from"
								style="border: transparent;">
						</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center"
						style="height: 31px;">반납 날짜
						<div>
							<input type="date" id="outdate1" name="cart_to"
								style="border: transparent;">
						</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center"
						style="height: 31px;">대여 수량 입력
						<div align="center">
							<input type="number" name="cart_prodCount" value="1"
								pattern="[0-9]+" min="1" max="10">
						</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center"
						style="height: 31px;">대리점 선택
						<div>
							<select name="agencyDTO.agency_num" style="border: transparent;">
								<c:forEach items="${getAgency}" var="dto">
									<option value="${dto.agency_num}">${dto.agency_name}</option>
								</c:forEach>
							</select>
						</div>
					</li>
				</ul>
				<input type="submit" value="대여하기"
					style="background-color: #0D6EFD; color: white; height: 55px; width: 100%">
			</form>
		</div>
		
		<div class="col-md-8 themed-grid-col">
			<div class="row" align="center">
					<div class="row">
					<figure class="text-center">
						<blockquote class="blockquote">
							<p></p>
						</blockquote>
					</figure>
				</div>
				<h3 style="margin-bottom: 11px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; padding-right: 15px;">${getProduct.prod_name} 리뷰 목록</h3>
			</div>
			<div class="row">
				<!-- 드랍 버튼 -->
				<div class="col">
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="background-color: #00205b; border-color: #00205b;">정렬</button>
						<ul class="dropdown-menu" style="margin-right: 13px;">
							<li><a class="dropdown-item" href="productViewOrder.product?search=${prodsearch}&searchString=${prodsearchString}&mode=listReviewNew&prod_num=${prod_num}"> <!-- 정렬 넣기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
									최신순
							</a></li>
							<li><a class="dropdown-item" href="productViewOrder.product?search=${prodsearch}&searchString=${prodsearchString}&mode=listReviewLike&prod_num=${prod_num}"> 좋아요순</a></li>
							<li><a class="dropdown-item" href="productViewOrder.product?search=${prodsearch}&searchString=${prodsearchString}&mode=listReviewPop&prod_num=${prod_num}"> 별점순</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-dark"
						style="margin-left: 15px; background-color: #00205b; border-color: #00205b;"
						onclick="location.href ='productView.product?prod_num=${getProduct.prod_num}'">
						전체보기</button>
					<button type="button" class="btn btn-dark"
						style="margin-left: 15px; background-color: #00205b; border-color: #00205b;"
						onclick="location.href='goods_review.review?prod_num=${getProduct.prod_num}'">
						리뷰 등록 하기</button>

				</div>

				<div class="col" align="right">
				<div class="col-md-8 mb-2" >
					<div class="input-group mb-1" style="left: 12px;">
						<input type="hidden" name="mode" value="find" /> 
						<select	id="search" class="form-select"	aria-label="Default select example">
							<option value="rp_title" align="center">리뷰제목</option>
							<option value="rp_content" align="center">리뷰내용</option>
							<!-- <option value="mem_nickName" align="center">리뷰작성자</option> -->
						</select> <input type="text" id="searchString" class="form-control"
							placeholder="리뷰를 검색하세요 !" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-primary" type="button" id="button-addon2"
							style="background-color: #00205b; border-color: #00205b;"
							onclick="search_function();">검색</button>
					</div>
				</div>
			</div>
		</div>	
			<!-- 본문 -->
			<table class="table table-borderless">
				<tr>
					<c:if test="${empty listBoard}">
						<c:if test="${not empty searchString }">
							<td><h2 align="center">검색 하신 리뷰는 존재하지 않습니다.</h2></td>
						</c:if>
						<c:if test="${empty searchString }">
							<td><h2 align="center">제일 먼저 리뷰를 등록해보세요!</h2>
						</td>
						</c:if>
					</c:if>
					<c:forEach var="pdto" items="${listBoard }">
						<td>
							<div class="card border-dark" style="width: 18rem;">
								<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.rp_image1}" class="card-img-top"
									style="width: 286px; height: 200px;  display:inline-block;"><span style=" text-align:center; margin-top: 10px;">${pdto.memberDTO.mem_nickName}</span>
								
								<div class="card-body">
									<div class="card-body">
										<h5 id="reviewTitle" class="card-title">${pdto.rp_title}</h5>
										<p class="card-text" id="reviewSummary">${pdto.rp_summaryContent }</p>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">별점 (${pdto.rp_score}/5)
											<fieldsest style="float: right;">
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
													<c:when test="${pdto.rp_score >= 4 && pdto.rp_score < 5 }">
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
												</c:choose>
											</fieldset>
										</li>
										<li
											class="list-group-item d-flex justify-content-between align-items-center">
											조회수
											<div>
												<p>${pdto.rp_readCount}</p>
											</div>
										</li>
										<li
											class="list-group-item d-flex justify-content-between align-items-center">
											좋아요
											<div>
												<p>${pdto.rp_likeCount}</p>
											</div>
										</li>
									</ul>
								
									<div class="card-body">
										<a href="javascript:popup(${pdto.rp_num })"><button type="button" class="btn btn-dark" style="width: 100%; background:#091835;">
										리뷰 보기</button></a>
										<span style="float: left;font-size: 14px;">작성일자 : ${pdto.rp_sysdate }</span>
									</div>
								</div>
							</div>
						</td>
						<c:set var="count" value="${count+1 }" />
						<c:if test="${count%3==0 }">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page-3>1}">
						<li class="page-item"><a class="page-link"
							href="productView.product?page=${page-1}&prod_num=${getProduct.prod_num}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${page-3<1?1:page-3}"
						end="${page+3>pageCount?pageCount:page+3}">
						<c:if test="${i==page}">
							<li class="page-item"><a class="page-link"
								href="productView.product?page=${i}&prod_num=${getProduct.prod_num}"
								style="color: blue;">${i}</a></li>
						</c:if>
						<c:if test="${i!=page}">
							<li class="page-item"><a class="page-link"
								href="productView.product?page=${i}&prod_num=${getProduct.prod_num}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${page+3<pageCount}">
						<li class="page-item"><a class="page-link"
							href="productView.product?page=${page+1}&prod_num=${getProduct.prod_num}">Next</a></li>
					</c:if>
				</ul>
				<button class="btn btn-primary" onclick="contact();"
					style="float: right; background-color: #00205b; border-color: #00205b;">문의하기</button>
			</nav>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

function popup(rp_num) {
	   var isEmpty = function(value){//빈값체크
	        if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	          return true
	        }else{
	          return false
	        }
	      };
	   var mid = '${mem_num}';
	   console.log(mid);			
	   if(!isEmpty(mid)){
	   	var url = "productReviewView.product?rp_num="+rp_num;
	   	var name = "popup";
	    var _left = Math.ceil(( window.screen.width - 800 )/2);
	   var _top = Math.ceil(( window.screen.height - 1000 )/2); 
	   var option = "width = 800, height = 900, top ="+_top+", left = "+_left+"'y', location = no,  menubar=no,resizable=no.toolbar=no";
	   window.open(url, name, option);
	   }else{
	      alert("리뷰를 보기위해서는 로그인이 필요합니다 !");
	   }
	}
		
		function search_function(){
			
			var searchSelect = document.getElementById("search");
			var search = searchSelect.options[searchSelect.selectedIndex].value;
			var searchString = encodeURIComponent(document.getElementById("searchString").value);
			var f = document.createElement("form");	
			f.setAttribute("method","post");
			f.setAttribute("action","productView.product");
			document.body.appendChild(f);
			var input_search = document.createElement("input");
			var input_searchString = document.createElement("input");
			var input_prodNum = document.createElement("input");
			
			input_search.setAttribute("type","hidden"); 
			input_search.setAttribute("name","search"); 
			input_search.setAttribute("value",search);  
			f.appendChild(input_search);
			input_searchString.setAttribute("type","hidden"); 
			input_searchString.setAttribute("name","searchString"); 
			input_searchString.setAttribute("value",searchString);  
			f.appendChild(input_searchString);
			input_prodNum.setAttribute("type","hidden"); 
			input_prodNum.setAttribute("name","prod_num"); 
			input_prodNum.setAttribute("value",'${prod_num}');
			f.appendChild(input_prodNum);
			f.submit(); 
		}
				
	    function contact() {
	          var url = "myPageContactUs.myPage";
	          var name = "popup test";
	          var option = "width = 800, height = 400, top = 100, left = 200, location = no"
	          window.open(url, name, option);
	  	}
	    
	    function chk_rent(){
	    	
	    }

	    function getTodayDate() {
	           const today = new Date(); 
	           const year = today.getFullYear(); // 2021
	           const month = ('0' + (today.getMonth() + 1)).slice(-2); // 12
	           const day = ('0' + today.getDate()).slice(-2); // 20
	           const dateString = year + '-' + month + '-' + day; // 2021.12.20
	           return dateString;
	       }
	       function chk_rent(){
	    	   var isEmpty = function(value){//빈값체크
			        if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
			          return true
			        }else{
			          return false
			        }
			      };
			   var mid = '${mem_num}';
			   if(isEmpty(mid)){
				   alert("대여하기 위해서는 로그인이 필요합니다 !");
				   return false;
			   }
	          var today = getTodayDate();
	          var indate = document.getElementById("indate1").value;
	          var outdate = document.getElementById("outdate1").value;
	         console.log(indate)
	         console.log(outdate)
	          if(indate == "" || outdate == ""){
	             alert("대여 날짜와 반납 날짜를 선택해주세요 !")
	             return false;
	          }
	          else if(indate<today){
	             alert("현재 날짜보다 이전의 날짜는 선택하실 수 없습니다.");
	             return false;
	          }else if(indate>outdate){
	             alert("반납 날짜를 다시 선택해주세요")
	             return false;   
	          }
	          
	          return true;   
	       }
		
</script>


<%@include file="../bottom.jsp"%>