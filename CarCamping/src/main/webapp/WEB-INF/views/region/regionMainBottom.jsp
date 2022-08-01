<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</div>
				</div>

			</div>
		</div>
	</div>

<style>
 .card img {
	    width:298px;
	    height:195px;
	    overflow:hidden;
	    margin:0 auto;
	    object-fit:cover;
	}

</style>
		<!--HOT차박지  -->
		<div class="ccm-b-hs">
			<div id="hot-loaction-title-hs" style="margin-top: 20px;">
				<!-- <nav
					class="navbar navbar-expand-lg border rounded-4 border-4 aria-label="
					Eighth
					navbarexample" 
					style="margin-bottom: 0px; background-color: #dc3545d4;"> -->
					<div class="container">
						<font size="5"><b>🔥 H O T 차 박 지 </b></font>
						<hr style="border: 0;height: 2px;background-color: #585858d4;">
					</div>
				<!-- </nav> -->
			</div>
			<div id="hot-loaction-content-hs"
				style="margin-bottom: 0px; margin-top: 10px;">
				<div class="carousel"
					data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>

					<c:forEach var="hotRegion" items="${hotRegionList}">
			
						<a href="regionView.region?ccr_num=${hotRegion.ccr_num}">
							<div class="carousel-cell" style="width: 300px; height: 380px">
								<div class="card" style="width: 100%; height: 100%">
									<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${hotRegion.ccr_viewImage1}"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title"><font color="black" ><b>${hotRegion.ccr_name}</b></font></h5>
										<hr style="background-color: #585858d4;">
										<p class="card-text">${hotRegion.ccr_summary}</p>
										
										<li class="list-group-item d-flex justify-content-between align-items-center">
							<div class="container" style="width: 300px;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: 0px;">
								<div class="row">
									<div id="myform">
										<fieldset style="width: 100%;">
										<c:choose>
				 				<c:when test="${hotRegion.ccr_score >= 1 && hotRegion.ccr_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${hotRegion.ccr_score >= 2 && hotRegion.ccr_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${hotRegion.ccr_score >= 3 && hotRegion.ccr_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${hotRegion.ccr_score >= 4 && hotRegion.ccr_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${hotRegion.ccr_score eq 5 }">
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
								<label style="padding-right: 50px;"><font size="2" color ="gray">(${hotRegion.ccr_score}/5) ${hotRegion.ccr_reviewCount} 개의 리뷰</font></label>
										</fieldset>										
									</div>
								</div>
							</div>
						</li>
									</div>
								</div>
							</div>
						</a>

					</c:forEach>

				</div>
			</div>
		</div>

	<!--추천차박지  -->
	<div class="ccm-b-hs" style="margin-top: 20px; margin-bottom: 45px;">
		<!--  <nav
			class="navbar navbar-expand-lg navbar navbar-dark bg-primary border rounded-4 border-4"
			aria-label="Eighth navbar example" style="margin-bottom: 0px;">
			<div class="container">
				<a class="navbar-brand text-light" href="#">추 천 차 박 지</a>
			</div>-->
			<div class="container">
						<font size="5"><b>👍︎  추 천 차 박 지 </b></font>
						<hr style="border: 0;height: 2px;background-color: #585858d4;">
					</div>
		<!-- </nav> -->
		<div id="recommand-loaction-content-hs ">
			<div class="carousel"
				data-flickity='{ "cellAlign": "left", "contain": true ,
 									"autoPlay": 1200,"pauseAutoPlayOnHover": false,
									"dragThreshold": 10,"imagesLoaded": true,
									"freeScroll": true,"wrapAround": true}'>
				<c:forEach var="recommandRegion" items="${recommandRegionList}">

					<a href="regionView.region?ccr_num=${recommandRegion.ccr_num}">
						<div class="carousel-cell" style="width: 300px; height: 380px">
							<div class="card" style="width: 100%; height: 100%">
								<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${recommandRegion.ccr_viewImage1}"
									class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title"><font color="black"><b>${recommandRegion.ccr_name}</b></font></h5>
									<hr style="background-color: #585858d4;">
									<p class="card-text">${recommandRegion.ccr_summary}</p>
									
									<li class="list-group-item d-flex justify-content-between align-items-center">
							<div class="container" style="width: 300px;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: 0px;">
								<div class="row">
									<div id="myform">
										<fieldset style="width: 100%;">
										<c:choose>
				 				<c:when test="${recommandRegion.ccr_score >= 1 && recommandRegion.ccr_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${recommandRegion.ccr_score >= 2 && recommandRegion.ccr_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${recommandRegion.ccr_score >= 3 && recommandRegion.ccr_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${recommandRegion.ccr_score >= 4 && recommandRegion.ccr_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${recommandRegion.ccr_score eq 5 }">
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
								<label style="padding-right: 50px;"><font size="2" color ="gray">(${recommandRegion.ccr_score}/5) ${recommandRegion.ccr_reviewCount} 개의 리뷰</font></label>										</fieldset>
										
									</div>
								</div>
							</div>
						</li>
								</div>
							</div>
						</div>
					</a>

				</c:forEach>
			</div>
		</div>
	</div>
