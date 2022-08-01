<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../top.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
	<div class="row" align="center">
		<h3 class="fw-bolder">내가 쓴 리뷰</h3><br><br>

		<!-- 드랍 버튼 -->
		<div class="col" align="right">
			<div class="btn-group">
				<button type="button" class="btn btn-dark dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false" style=" border-top-width: 0px;border-bottom-width: 0px; padding-bottom: 6px;">승인 리뷰 보기</button>
				<ul class="dropdown-menu" style="">
					<li><a class="dropdown-item" href="myPageWriteReview.myPage?mem_num=${mem_num}">차박지 리뷰</a></li>
					<li><a class="dropdown-item" href="myPageWriteReview.myPage?mem_num=${mem_num}&mode=product">용품 리뷰</a></li>
				</ul>
			</div>
			

         <div class="btn-group">
            <button type="button" class="btn btn-dark dropdown-toggle"
               data-bs-toggle="dropdown" aria-expanded="false">미승인 리뷰 보기</button>
            <ul class="dropdown-menu" style="">
               <li><a class="dropdown-item" href="myPageWriteReview.myPage?mem_num=${mem_num}&adminConfirm=no">차박지 리뷰</a></li>
               <li><a class="dropdown-item" href="myPageWriteReview.myPage?mem_num=${mem_num}&mode=product&adminConfirm=no">용품 리뷰</a></li>
            </ul>

      </div>
	


	</div>
		</div>
		
		
		
	




</div>
</body>
</html>