<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Container -->
<head>
	<!-- rating -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/rating.css">
    
</head>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous">
</script> 

<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script> -->

<!-- CSS only -->


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>


<div class="container-fluid themed-container">
	<!-- Row Grid -->
	<div class="row justify-content-md-center">
    <!-- List Column Grid -->
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light text-center" style="width: 250px; height: 700px;">
    <a href="goAdmin.admin" class="sidebar-heading border-bottom bg-light">
      <use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4"><b>관리자 페이지</b></span>
    </a>
     <br>
    <ul class="nav nav-pills flex-column mb-auto">
    
      <li>
        <a href="adminRegion.admin" class="list-group-item list-group-item-action list-group-item-light p-3" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg> 
         
      차박 장소 관리
        </a>
      </li>
      
      <li>
        <a href="adminAgency.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
         
      대리점 관리
        </a>
      </li>
 
      <li>
        <a href="adminCategory.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
        
     카테고리 관리
        </a>
      </li>
      
      <li>
        <a href="adminProduct.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
         
        차박 용품 관리
        </a>
      </li>
      
      <li>
        <a href="adminMember.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
          
   회원 관리
        </a>
      </li>
      
      <li>
        <a href="adminReviewRegion.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
        
  장소 리뷰 관리
        </a>
      </li>
      
      <li>
        <a href="adminReviewProduct.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
         
  용품 리뷰 관리
        </a>
      </li>
      
      <li>
        <a href="adminAnnounce.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-leftr">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
         
         공지사항 관리
        </a>
      </li>
      
      <li>
        <a href="adminQuestion.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
        
         문의사항 관리
        </a>
      </li>
      
      <li>
        <a href="adminRental.admin" class="list-group-item list-group-item-action list-group-item-light p-3 text-left">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
        
         대여현황
        </a>
        
      </li>
    </ul>
    
    
  </div>
	

