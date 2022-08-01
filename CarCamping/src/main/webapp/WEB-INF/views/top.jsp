   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="TemplateMo">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">
   
<!-- 프로필 오프캔버스 -->
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

<title>WithCar HomePage</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/css/fontawesome.css">
<link rel="stylesheet" href="resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet" href="resources/css/owl.css">
<link rel="stylesheet" href="resources/css/lightbox.css">
<link rel="stylesheet" href="resources/css/map_region.css">

<!--바케성 0613 배너 css js-->

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
            


<style>
.has-sub>.sub-menu>a{
background: transparent;
}
.has-sub>.sub-menu>li{
border :1px solid black;
}
.has-sub>.sub-menu{.
background: transparent;
padding-left: 0px;
}

.list-group-flush > a : hover{
background: #fff;
}

.floating {
  position: fixed; 
  right: 37%; 
  top: 55%; 
  margin-right: -680px;
  text-align:center;
  width: 120px;
}   
</style>

</head>

<body>
   <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky" style="background-color : #FFFFFF"><!-- 색깔 바꾸기 -->
      <div class="container" style="height: 90px";>   
         <div class="row" style="height: 90px";>
            <div class="col-12">
               <nav class="main-nav">
                  <!-- ***** Logo Start ***** -->
                  <a href="index.do" class="logo" style="height: 90px;"><img src="resources/images/withcar.png" style="width: 170px;height: 70px;"/></a>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                     <li ><a  href="index.do"><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                       <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                     </svg></a></li>
                     <c:if test="${empty mbdto}">   
                     <li><a href="login.login">로그인</a></li>
                     <li><a href="sign.login">회원가입</a></li>
                     </c:if>
                     <c:if test="${not empty mbdto}">
                     <li><a href="logout.login">로그아웃</a></li>
                     </c:if>
                     <li class="has-sub"><a href="javascript:void(0)">바로가기</a>
                        <ul class="sub-menu" >
                           <li><a href="goRegion.region"  style="background: transparent;">차박지 메인</a></li>
                           <li><a href="goProduct.product"  style="background: transparent;">용품 대여</a></li>
                        </ul></li>
                     <li class="has-sub"><a href="javascript:void(0)">리뷰쓰기</a>
                     <ul class="sub-menu" >
                               <li><a style="background: transparent; " onclick="location.href='field_review.review'">장소 리뷰</a></li>
                           <li><a style="background: transparent;" onclick="location.href='goods_review.review'">용품 리뷰</a></li>
                        </ul></li>
                         <c:if test="${empty mbdto}">   
                         <li>
                         </li>
                         </c:if>
                         <c:if test="${not empty mbdto}">
                     <li class="scroll-to-section">
                        <button class="btn btn-link" data-bs-toggle="offcanvas" href="#offcanvasExample" aria-controls="offcanvasExample"
                        style="background-color: #091835;  color: #ffffff; text-decoration: none;">
                           프로필
                        </button>
                     </li>
                     </c:if>
                            <div class="offcanvas offcanvas-start" tabindex="-1"
                        id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="background-color: #091835;">
                        <div class="offcanvas-header" style="padding-left: 90px; background-color: #091835;">
                           <h5 class="offcanvas-title" id="offcanvasExampleLabel"><b><font style="
                              color: #c4c3cb;" size="12">My Menu</b></font></h5>
                           <button type="button" class="btn-close text-reset"
                              data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body" style="background-color: #091835;">
                           <div>
                           <c:if test="${empty mbdto}">   
                                      <img src="sik.jpg" class="card-img rounded-circle"
                                  style="width: 150px;height: 150px;display: inline-block; border-left-width: 150px;margin-left: 100px;" />
                                  </c:if>
                                  <c:if test="${not empty mbdto}">
                                  <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${mbdto.mem_image}" class="card-img rounded-circle"
                                 style="width: 150px;height: 150px;display: inline-block; border-left-width: 150px;margin-left: 100px;" />
                                  <br></br>
                              <span style=" margin:auto ; color: #c4c3cb;"><b style="margin-left: 160px;">${mbdto.mem_nickName}</b></span>
                                  </c:if>
                              
                           </div>
                           <div class="list-group-flush" style="margin-bottom: 0px;margin-top: 40px; margin-right: 10px; ">
                              <a href="myPageProfile.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color:#c4c3cb; background-color: #091934">      
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                   <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                 </svg>
                                 &nbsp;내 정보 </a> 
                              <a href="myPageWriteReview.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color: #c4c3cb; background-color: #091934">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                   <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                   <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                 </svg>
                                 &nbsp;내가 쓴 리뷰</a> 
                              <a href="myPageLikeReview.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color: #c4c3cb; background-color: #091934">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                   <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                 </svg>
                                 &nbsp;내가 좋아한 리뷰</a> 
                              <a href="myPageCart2.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color: #c4c3cb; background-color: #091934">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                   <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                 </svg>
                                 &nbsp;장바구니</a> 
                              <a href="myPageRental.myPage"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color: #c4c3cb; background-color: #091934">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                                   <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                   <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                 </svg>
                                 &nbsp;대여내역</a>
                              <a href="myPageQuestion.myPage?mem_num=${mem_num}"
                                 class="list-group-item list-group-item-action list-group-item-light p-3" style="color: #c4c3cb; background-color: #091934">
                                 <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
                                   <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
                                 </svg>
                                 &nbsp;문의내역</a>    
                           </div>
                        </div>
                     </div>
                  </ul>
                  <a class='menu-trigger'> <span>Menu</span>
                  </a>
                  <!-- ***** Menu End ***** -->
               </nav>
            </div>
         </div>
      </div>
      <div class="floating">
          <img src="resources/images/warning.png" onclick="location.href='uesrAnnounce.admin'"/>
      </div>
   </header>
   <section>
   
   
   <!-- ***** Header Area End ***** -->