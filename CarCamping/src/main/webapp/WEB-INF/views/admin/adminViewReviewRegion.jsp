<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 리뷰 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 변경하시겠습니까?')
		if (con1){
			document.viewReviewRegion.submit()
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewReviewRegion" method="post" action="adminViewReviewRegion.admin" enctype="multipart/form-data">
			<input type = "hidden" name="review_num" value="${rdto.review_num}">
		<table class="table table-sm">
			<tr>
				<th>차박장소</th>
				<td>${rdto.carCampingRegionDTO.ccr_name}</td>	
			</tr>
			<tr>
				<th>작성자</th>
				<td>${rdto.memberDTO.mem_nickName}</td>
			<tr>
				<th>
					제목
				</th>
				<td>
					${rdto.review_title}
				</td>
			</tr>
			<tr>
				<th>
					작성일
				</th>
				<td>
					${rdto.review_sysdate}
				</td>
			</tr>
			<tr>
				<th>리뷰 요약</th>
				<td>
					${rdto.review_summaryContent}
				</td>
			</tr>
			<tr>
				<th>리뷰 내용</th>
				<td>
					${rdto.review_regionContent}
				</td>
			</tr>
			<tr>
				<td colspan="2">
			<!-- 현재 이미지 캐러셀 -->
						&nbsp;
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
								<c:if test="${not empty rdto.review_regionImage1}">
									<div class="carousel-item active">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage1}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty rdto.review_regionImage2}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage2}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty rdto.review_regionImage3}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage3}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty rdto.review_regionImage4}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage4}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty rdto.review_regionImage5}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.review_regionImage5}" class="d-block w-100" alt="...">
									</div>
								</c:if>
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
					</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>${rdto.review_regionScore}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${rdto.review_readCount}</td>
			</tr>
			<tr>
				<th>좋아요수</th>
				<td>${rdto.review_likeCount}</td>
			</tr>
			<tr>
				<th>인기리뷰</th>
				<c:choose>
					<c:when test="${rdto.review_popular==0}">
						<td><input type="checkbox" name="review_popular1" id="checkPopular" checked>체크시(예)</td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" name="review_popular1" id="checkPopular">체크시(예)</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>승인여부</th>
				<c:choose>
					<c:when test="${rdto.review_adminConfirm==0}">
						<td><input type="checkbox" name="review_adminConfirm1" id="checkConfirm" checked>체크시(예)</td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" name="review_adminConfirm1" id="checkConfirm">체크시(예)</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="reset" class="btn btn-primary">취소</button>
					<button type="button" class="btn btn-primary" id="sendMessage" onclick="location.href='javascript:con()'">변경하기</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<!-- Web Socket -->
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<c:url var="root" value="/"></c:url>

	<!-- 웹소켓 부분 -->
	<script type="text/javascript">
		
		var sock = new SockJS("${root}carCamping");
		
		var msg = '${rdto.memberDTO.mem_num}/'
		msg += new Date()+'/';

		$(function(){	
			$('#sendMessage').click(function(){
				if($('#checkConfirm').val() != null){
					msg += '2/';
					msg += '${rdto.memberDTO.mem_nickName}님의 리뷰(제목 : ${rdto.review_title})가 승인되었습니다/';
					msg += 'myPageLikeReview.myPage?mem_num=${rdto.memberDTO.mem_num}/';
					msg += '${rdto.review_num}';
					
					sock.send(msg);
				}
				
			});
		});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>