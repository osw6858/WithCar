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

<title>WithCar HomePage</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/css/fontawesome.css">
<link rel="stylesheet" href="resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet" href="resources/css/owl.css">
<link rel="stylesheet" href="resources/css/lightbox.css">
<link rel="stylesheet" href="resources/css/map_region.css">
<link rel="stylesheet" href="resources/css/ghost.css">
<style>
img, svg {
    vertical-align: middle;
}
.container{
   margin-left:15%;
   margin-right:15%;
}
.jb-box {
  overflow: hidden;
  margin: 0px auto;
  position: relative;
}
.hoverLogo {
  position: absolute;
 left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  display:none;
}

.hoverLogo #hoverLogoImage {
	width:0px; /*450 350 */
	height:0px;
}



</style>
	
<script src="resources/js/jquery.js"></script>
    <script>
    $( document ).ready( function() {
    	$(".jb-text #goMainButton").click(function(){
    		  $( '.hoverLogo' ).fadeIn(3000);
    		  $('#hoverLogoImage').animate(
    		  	{width:'450px',height :'350px'},
    		  	3000,
    		  	function() {
    		  	  $( '.hoverLogo' ).fadeOut(3000);	    		
    		  	}
    	 		);
    	});
    });
    	      
    </script>
</head>
<body style="padding-top: 0px;">
   <div class="jb-box">
      <header class="header-area header-sticky">
         <div class="container">
            <div class="row">
               <div class="col-12">
                  <nav class="main-nav navbar-expand-lg navbar-dark shadow-5-strong">
                     <!-- ***** Logo Start ***** -->
                     <a href="index.do" class="logo"> <img src="resources/images/withcar.png" style="width: 170px;height: 70px;"/></a>
                     <!-- ***** Logo End ***** -->
                     <!-- ***** Menu Start ***** -->
                     <ul class="nav">
                     <!-- 처음들어갔을때 -->
                        <!--    요ㅕ걸롱!!!!!!!!!!!!!!!
                        <li><a href="홈페이지로"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                          <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                        </svg></a></li>
                        <li class="scroll-to-section"><a href="회원가입으로">회원가입</a></li>
                        <li><a href="로그인으로">로그인</a></li>
                         -->
                        <!-- 로그인 시 ver 1-->
                         <!-- 
                         <li><a href="홈페이지로"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                          <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
                        </svg></a></li>
                        <li><a href="">로그아웃</a></li>
                        <li><a href=""> nickname... 마이페이지</a></li> -->
                        
                        <!-- 로그인 시 ver 2 <====요걸로!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                        
                        
                        
                        
                        
                        <c:if test="${empty mbdto}">   
                        <li class="has-sub"><a href="javascript:void(0)">
                           사용자
                           <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16" style="margin-bottom: 2.5;">
                             <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                           </svg>
                           </a>
                           
                           <ul class="sub-menu">
                           
                              <li><a href="login.login">로그인</a></li>
                              <li><a href="sign.login">회원가입</a></li>

                           </ul>
                        </li>
                        </c:if> 
                        
                        
                        
                        <c:if test="${not empty mbdto}">
                           <li class="has-sub"><a href="javascript:void(0)">
                           사용자
                           <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16" style="margin-bottom: 2.5;">
                             <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                           </svg>
                           </a>
                           
                           <ul class="sub-menu">
                           
                              <li><a href="logout.login">로그아웃</a></li>
                              <li><a href="myPageProfile.myPage">마이페이지</a></li>
                           </ul>
                        </li>


                        </c:if> 
                           <li class="has-sub"><a href="javascript:void(0)"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                          <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                        </svg>
                        </a>
                        <ul class="sub-menu">
                           
                              <li><a href="uesrAnnounce.admin">공지사항</a></li>
                        </ul>
                     </ul>
                     
               
                     <!-- ***** Menu End ***** -->
                  </nav>
               </div>
            </div>
         </div>
      </header>
      <video muted autoplay loop>
         <source src="resources/video/highway-loop.mp4" type="video/mp4">
      </video>
      <div class="hoverLogo">
    	<img src="resources/images/123.png" id="hoverLogoImage" style=" pointer-events: none; "/>
  	  </div>
      <div class="jb-text">

			<div class="button-row" id="goMainButton">
				<div style="display: flex;">
					<a title="차박지" href="goRegion.region"></a>
				</div>
				<div style="display: flex;">
					<a title="용품 " href="goProduct.product"></a>
				</div>
			</div>

		</div>
   </div>
   <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
    
	  <div class="footer" style="padding-bottom: 0px;margin-top: 0px;padding-top: 0px;">
      <p style=" background-color:#2c3e50; color:#fff;margin-bottom: 0px;">Copyright © 2022 <a href="#">WITHCAR Co.</a> Ltd. All Rights Reserved. 
          <br>
          Design: <a href="#">WITHCAR DESIGN TEAM</a>
          <br>
          MADE BY: <a href="#">WITHCAR TEAM</a>
        </p>
    </div>
<!--/.section -->
</body>
<!-- jQuery -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- Bootstrap JavaScript -->

<!-- Scripts -->
   
  <!-- Bootstrap core JavaScript -->
  
    <script src="resources/js/jquery.min.js"></script>
    
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>

    <script src="resources/js/isotope.min.js"></script>
    <script src="resources/js/owl-carousel.js"></script>
    <script src="resources/js/lightbox.js"></script>
    <script src="resources/js/tabs.js"></script>
    <script src="resources/js/video.js"></script>
    <script src="resources/js/slick-slider.js"></script>
    <script src="resources/js/custom.js"></script>
    <script>
    
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>

