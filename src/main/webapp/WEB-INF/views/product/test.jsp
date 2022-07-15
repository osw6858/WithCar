<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<<<<<<< HEAD

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
			<div class="modal-body">${getProduct.prod_viewContent}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					data-bs-dismiss="modal" style="width: 100%;">Close</button>
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
			<form action="myPageCart.myPage" method="post" onsubmit="chk_rent()">
			<input type="hidden" name="prod_num" value="${getProduct.prod_num}">
            <c:if test="${not empty mem_num}">
               <input type="hidden" name="mem_num" value="${mem_num}">
            </c:if>
            <c:if test="${empty mem_num}">
               <input type="hidden" name="mem_num" value="0">
            </c:if>
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
						<img src="resources/images/sik.jpg" class="card-img-top"
						style="height: 250px;">
					</li>

					<li id="viewCount"
						class="list-group-item d-flex justify-content-between align-items-center">
						리 뷰 수
						<button type="button" class="btn btn-dark rounded-pill" disabled
							style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px;">
							${getProduct.prod_reviewCount}</button>
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
							<select name="agency_num" style="border: transparent;">
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
						<figcaption class="blockquote-footer">
							<cite title="Source Title"></cite>
						</figcaption>
					</figure>
				</div>
				<h2 style="margin-bottom: 20px;">${getProduct.prod_name}리뷰 목록</h2>
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
					<button type="button" class="btn btn-success"
						style="margin-left: 15px; background-color: #00205b; border-color: #00205b;"
						onclick="location.href ='productView.product?prod_num=${getProduct.prod_num}'">
						전체보기</button>
					<button type="button" class="btn btn-success"
						style="margin-left: 15px; background-color: #00205b; border-color: #00205b;"
						onclick="location.href='goods_review.review?prod_num=${getProduct.prod_num}'">
						리뷰 등록 하기</button>

				</div>

				<div class="col" align="right">
					<div class="input-group mb-3">
						<input type="hidden" name="mode" value="find" /> <select
							id="search" class="form-select"
							aria-label="Default select example">
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

			<!-- 본문 -->
			<table class="table table-borderless">
				<tr>
					<c:if test="${empty listBoard}">
						<c:if test="${not empty searchString }">
							<td><h2 align="center">검색 하신 리뷰는 존재하지 않습니다.</h2></td>
						</c:if>
						<c:if test="${empty searchString }">
							<td><h2 align="center">제일 먼저 리뷰를 등록해보세요!</h2>
								<button type="button" class="btn btn-success"
									style="margin-left: 431px; align: center; background-color: #00205b; border-color: #00205b; margin-top: 121px; height: 124px; width: 332px;"
									onclick="goods_review.review?prod_num=${getProduct.prod_num}">
									리뷰 등록 하기</button></td>
						</c:if>
					</c:if>
					<c:forEach var="pdto" items="${listBoard }">
						<td>
							<div class="card border-success" style="width: 18rem;">
								<img src="resources/images/sik.jpg" class="card-img-top"
									style="width: 284px; height: 200px;">
								<div class="card-body">
									<div class="card-body">
										<h5 class="card-title">${pdto.rp_title}</h5>
										<p class="card-text">${pdto.rp_summaryContent }</p>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">별점 (${pdto.rp_score}/5)
											<fieldset style="float: right;">
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
										<a href="javascript:popup(${pdto.rp_num })"><button
												type="button" class="btn btn-primary" style="width: 100%;">리뷰
												보러가기</button></a>
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
					style="float: right;">문의하기</button>
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
			var searchString = document.getElementById("searchString").value;
			var f = document.createElement("form");	
			f.setAttribute("method","post");
			f.setAttribute("action","productView.product");
			document.body.appendChild(f);
			var input_search = document.createElement("input");
			var input_searchString = document.createElement("input");
			var input_prodNum = document.createElement("input");
			
			input_search.setAttribute("type","text"); 
			input_search.setAttribute("name","search"); 
			input_search.setAttribute("value",search);  
			f.appendChild(input_search);
			input_searchString.setAttribute("type","text"); 
			input_searchString.setAttribute("name","searchString"); 
			input_searchString.setAttribute("value",searchString);  
			f.appendChild(input_searchString);
			input_prodNum.setAttribute("type","hidden"); 
			input_prodNum.setAttribute("name","prod_num"); 
			input_prodNum.setAttribute("value",'${getProduct.prod_num}');  
			f.appendChild(input_prodNum);
			f.submit(); 
		}
				
	    function contact() {
	          var url = "myPageContactUs.myPage";
	          var name = "popup test";
	          var option = "width = 600, height = 500, top = 100, left = 200, location = no"
	          window.open(url, name, option);
	  	}
	    
	    function chk_rent(){
	    	
	    }

		
</script>


<%@include file="../bottom.jsp"%>
=======
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="resources/css/dropdown.css">
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
</style>

<!-- 클래스명은 변경하면 안 됨 -->

<div id="doc" class="gm-t7">
	<div class="gm-b">
		<div id="secondary">
			<div id="leftcolumn">
				<!-- 중앙 정렬을 위해서 d-flex justify-content-center는 지우면 안됩니다 !! -->
				<nav class="navbar d-flex justify-content-center"
					style="margin-bottom: 5px;">
					<h2>🔥 인기 용품을 지금 바로 만나보세요 🔥</h2>
				</nav>
			</div>

			<div id="ccm-doc-hs" class="ccm-t7-hs">
				<div id="ccm-bd-hs">
					<div id="ccm-main-hs">
						<div class="ccm-b-hs">
							<div class="ccm-gc-hs">
								<div class="ccm-u-hs first">
									<div class="carousel"
										data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>

										<c:forEach items="${popList}" var="proddto">

											<a href="productView.product?prod_num=${proddto.prod_num}">
												<div class="carousel-cell"
													style="width: 300px; height: 380px">
													<div class="card" style="width: 70%; height: 100%">
														<!-- 이미지 불러오기 수정해야함 -->
														<img src="resources/images/sik.jpg" class="card-img-top"
															alt="...">
														<div class="card-body">
															<h5 class="card-title">${proddto.prod_name}</h5>
															<hr>
															<p class="card-text">${proddto.prod_summary}</p>
														</div>
													</div>
												</div>
											</a>

										</c:forEach>
									</div>
								</div>

								<div class="region_content-hs rounded-4 " style="height: 402px;">
									<ul class="list-group list-group-flush rounded-4 ">

										<li class="list-group-item fs-2 text-center"><button
												disabled class="btn btn-outline-warning btn-lg"
												type="button"
												onclick="location.href='board.region?region_num=${regionDTO.region_num}'"
												style="-bs-btn-padding-x: 70px; - -bs-btn-padding-y: 15px;">
												<i class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i> 용품 인기순위 <i
													class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i>
											</button> <%--  <c:forEach items="${popList}" var="proddto"> --%> <!-- 1,2,3위만 잘라서 가져와야 할듯 -->
										<li class="list-group-item position-relative"><img
											src="resources/images/logoyogo-1-261.jpg"
											class="img-responsive rounded-circle"
											style="width: 107px; height: 107px;">
											<div
												class="position-absolute top-50 start-50 translate-middle">
												<i class="bi bi-trophy-fill" width="40" height="40"
													fill="currentColor"></i>
											</div></li>
										<%-- </c:forEach> --%>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이전 버튼 -->
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>

			<nav
				class="navbar navbar-expand-lg border rounded-4 border-4 aria-label="
				Eighth
				navbarexample" 
					style="margin-bottom: 20px; background-color: #0d6efd; border-left-width: 100px; margin-left: 250px; margin-right: 250px; margin-top: 10px;">
				<div class="container-fluid" align="center">

					<div class="container">
						<a class="navbar-brand text-light" href="#" text>전 체 용 품 목 록 </a>
					</div>


					<!-- 검색 form  #091835-->
					<div class="d-flex" style="width: 500px; height: 40px;">
						<button type="button"
							style="width: 150px; height: 40px; font-size: revert; margin-right: 10px;"
							onclick="location.href ='goProduct.product'">전체보기</button>
						<!-- 검색 form -->
						<form class="d-flex" action="goProduct.product"
							style="width: 500px; height: 40px;" method="get">
							<select name="search">
								<option value="prod_name">용품명</option>
								<option value="brand_name">브랜드명</option>
							</select> <input class="form-control me-2" type="text" name="searchString"
								placeholder="인기용품을 검색해보세요!" aria-label="Search"
								style="margin-left: 8px;"> <input type="submit"
								value="검색"
								style="padding-left: 0px; padding-right: 0px; width: 122px;">
							<div class="dropdown">

								<button type="button" class="dropbtn" data-bs-toggle="dropdown"
									aria-expanded="false"
									style="width: 66px; height: 40px; border-left-width: 2px; margin-left: 10px;">정렬</button>
								<div class="dropdown-content">
									<a
										href="goProduct.product?search=${search}&searchString=${searchString}&mode=listProductNew">최신순</a>
									<a
										href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPop">인기순</a>
									<a
										href="goProduct.product?search=${search}&searchString=${searchString }&mode=listProductPrice">가격순</a>
								</div>
							</div>
						</form>

					</div>
			</nav>


			<c:set var="i" value="0" />
			<c:set var="j" value="4" />
			<table align="center"
				style="border: 1px solid; border-left-width: 50px; border-color: transparent;">
				<c:forEach items="${listProduct}" var="pdto">
					<c:if test="${i%j == 0 }">
						<tr>
					</c:if>
					<td>
						<div class="card"
							style="width: 18rem; margin-right: 30px; margin-bottom: 50px;">
							<a href="productView.product?prod_num=${pdto.prod_num}"><img
								src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}"></a>
							<div class="card-body">
								<p class="card-text">

									용품명 :${pdto.prod_name}<br /> 브랜드명
									:${pdto.brandCategoryDTO.brand_name}<br /> 평점 :
									${pdto.prod_reviewScore } 용품명 :${pdto.prod_name}<br> 브랜드명
									:${pdto.brandCategoryDTO.brand_name}

								</p>
								<br>
								<p class="card-text">가격 :${pdto.prod_price}</p>
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

<%@ include file="../bottom.jsp"%>
>>>>>>> 오신웅3
