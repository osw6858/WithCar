<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>용품 리뷰</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="resources/css/review_styles.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.1.3/dist/litera/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css"
	integrity="sha384-eoTu3+HydHRBIjnCVwsFyCpUDZHZSFKEJD0mc3ZqSBSb6YhZzRHeiomAUWCstIWo"
	crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<style>
	#viewCount .btn-dark[disabled]{
		color: #fff;
   		background-color: #1a1a1a;
    	border-color: #1a1a1a;
	}
	textarea {
    resize: none;
  }
  #reviewTextarea {
   border-color = #E9EFC0;
  }
  .h5, h5 {
    font-size: 17px;
}
.blockquote {
    margin-bottom: 5px;
    margin-top: 5px;
}
.slide-gr{
	width:640px;
}
</style>

</head>
<body>

	<c:set var="review_num" value="${getReviewProduct.rp_num}"/>
 	<c:set var="mem_id" value="${sessionScope.mem_id}"/>
	<div id="wrapper">
		<!-- Begin Header -->
		<div align="center" id="header">
			<div class="card border-success mb-3"
				style="width: 700px; height: 960px">
				<div class="card-header" style="background-color: #83BD75;">
					<h2 style="margin-bottom: 0px;">${getReviewProduct.rp_title}</h2>
				</div>
				<div class="card-body">
					<img src="resources/images/sik.jpg" class="card-img rounded-circle" style="width: 145px; height: 145px; float: left;" />
					<ul class="list-group">
						<li class="list-group-item d-flex justify-content-between align-items-center" style="height:40px;">
							<h5>좋 아 요</h5>
							<c:if test="${check==0}">
								<button type="button" id="likeCount" class="btn rounded-pill" onclick="Like_function();" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px; background-color:#ffffff;">
									${getReviewProduct.rp_likeCount}💖
								</button>
							</c:if>
							<c:if test="${check==1 }">
								<button type="button" id="likeCount" class="btn rounded-pill" onclick="Like_function();" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 10px; height: 20px; background-color:#bb2d3b;">
									${getReviewProduct.rp_likeCount}💖
								</button>
							</c:if>
						</li>
						<li id="viewCount" class="list-group-item d-flex justify-content-between align-items-center" style="height:40px;">
							<h5>조 회 수</h5>
							<button  type="button" class="btn btn-dark rounded-pill" style="padding-top: 0px;padding-bottom: 0px; padding-left: 10px; padding-right: 10px;">
							${getReviewProduct.rp_readCount}
							</button>
						</li>
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<h5 style="padding-right: 180px;">별점 (${getReviewProduct.rp_score}/5)</h5>
							<div class="container" style="width: 424px;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: 0px;">
								<div class="row">
									<div id="myform">
										<fieldset style="float:right;">
										<c:choose>
				 				<c:when test="${getReviewProduct.rp_score >= 1 && getReviewProduct.rp_score < 2 }">
				  							<label for="rate1">⭐</label>
				 				</c:when>
				 				<c:when test="${getReviewProduct.rp_score >= 2 && getReviewProduct.rp_score < 3 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				 				</c:when>
								 <c:when test="${getReviewProduct.rp_score >= 3 && getReviewProduct.rp_score < 4 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				 				</c:when>
				 				<c:when test="${getReviewProduct.rp_score >= 4 && getReviewProduct.rp_score < 5 }">
				  						<label for="rate1">⭐</label>
				  						<label for="rate2">⭐</label>
				  						<label for="rate3">⭐</label>
				  						 <label for="rate4">⭐</label>
				 				</c:when>
				 				<c:when test="${getReviewProduct.rp_score eq 5 }">
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
					
					</ul>
					<p></p>
					<div class="progress" >
						<div
							class="progress-bar progress-bar-striped progress-bar-animated"
							role="progressbar" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100" style="width: 100%; background-color: #83BD75;" ></div>
					</div>
					<div align="center" id="leftcolumn"
						style="width: 666px;margin-top: 5px; background:#fff;border-left-width: 0px;border-top-width: 0px;border-bottom-width: 0px;border-right-width: 0px;">
						<div class="slider-gr" style="width:640px;">
							<c:forEach var="i" begin="1" end="${fn:length(rp_imageList)}"> 
									<input type="radio" name="slide" id="slide${i}" checked />
								</c:forEach>
							<!-- <input type="radio" name="slide" id="slide1" checked /> <input
								type="radio" name="slide" id="slide2" /> <input type="radio"
								name="slide" id="slide3" /> <input type="radio" name="slide"
								id="slide4" /> -->
							<ul id="imgholder" class="imgs">
								<c:forEach var="rp_images" items="${rp_imageList}">
									<li><img src="resources/images/${rp_images }" style="width:640px; height:300px;">/></li>
								</c:forEach>
								
								<!-- <li><img style="width: 100%; height: 100%;" src="sik.jpg" /></li>
								<li><img style="width: 100%; height: 100%;" src="sik.jpg" /></li>
								<li><img style="width: 100%; height: 100%;" src="sik.jpg" /></li> -->
							</ul>
							<div class="bullets">
									<c:forEach var="i" begin="1" end="${fn:length(rp_imageList)}"> 
									<label for="slide${i}">&nbsp;</label>
									</c:forEach>
								<!-- <label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
								<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label> -->
							</div>
						</div>
						<p></p>
						<div class="progress" style="background-color: #83BD75;">
							<div
								class="progress-bar progress-bar-striped progress-bar-animated"
								role="progressbar" aria-valuenow="75" aria-valuemin="0"
								aria-valuemax="100" style="width: 100%; background-color: #83BD75;""></div>
						</div>
						<div class="form-group">
							
							<blockquote class="blockquote">
								<p class="mb-0">REVIEW</p>
							</blockquote>
							<textarea class="form-control border border-5" id="reviewTextarea" rows="10" readonly>
							${getReviewProduct.rp_content}
							</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
		<script>
		var isRun = false; // ajax 동시 호출 막기(ajax가 호출되는 동안 버튼이 클릭돼도 중복으로 실행되는것을 막기위함)
		
		function Like_function(){
			var mid = '${sessionScope.mem_id}';
			var isEmpty = function(value){//빈값체크
	            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	              return true
	            }else{
	              return false
	            }
	          };
			
			if(isEmpty(mid)){ //아이디가 없으면
				console.log("아이디없음");
				alert("로그인을 해주세요 !!");
				
			}else{ //아이디가 있으면			
				 if(isRun == true) {
				        return;
				    }
				 isRun = true;
					//클릭시 로딩 이미지 호출
				  var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:50%;left:50%; text-align:center;"> ';
				    loadingHtml += '<div class="loading_box"><img src="<c:url value="/resources/images/loading_image.gif"/>"  /></div></div>'; 		   
				    $('body').fadeTo( "fast", 0.4 ).append(loadingHtml);
					var like_button = document.getElementById("likeCount");
	   				var like_color = like_button.style.backgroundColor;
	   				
	   				$.ajax({
						url: "updateProductReviewLike.product", //컨트롤러 맵핑
		                type: "POST",
		                data: { //사용자가 데이터를 정의한다	
		                	mem_id: '${sessionScope.mem_id}',
		                	rp_num: ${getReviewProduct.rp_num}
		                },         
		                success: function (res) { //아래 function에서 data를 사용하기 위해서 파라미터로 정의한 데이터 data를 넘겨주어야한다.
					       	// $('#test').text(data); // 바꾸고 싶은 태그의 아이디를 이용해서 태그에 접근하여 맵핑된 컨트롤러가 리턴한 스트링값으로 바꾼다.
					       	 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
		                	$("#likeCount").text(res+"💖");
		                	if(like_color == 'rgb(255, 255, 255)'){
		                		 alert("회원님의 좋아요가 성공적으로 등록되었습니다 !!😍"); 
		                		$("#likeCount").css("background-color","#bb2d3b");//#bb2d3b  rgb(187, 45, 59)
		               		}else if(like_color == 'rgb(187, 45, 59)'){          
		               			alert("회원님의 좋아요가 취소되었습니다 !!😢"); 
		               			$("#likeCount").css("background-color","white");
		               		}   
		                	isRun  = false;
		                }
					});
			}	
		}
		
		
		document.getElementById("reviewTextarea").scrollTop = document.getElementById("reviewTextarea").scrollHeight;
		
		</script>
	</body>

</html>
