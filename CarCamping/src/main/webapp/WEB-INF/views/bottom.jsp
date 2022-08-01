<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</section>
<div id="hd">
<div class="banner_slide"> <!--바케성 0613 배너  -->
   <div class="card text-center"> 
      <div class="card-body" >
         <a href="#">
            <img src="resources/images/banner_bottom1.jpg" style="width:1870px; height:150px; padding:0px;"/>
         </a>
      </div>
   </div>
   <div class="card text-center">
      <div class="card-body" >
         <a href="#">
            <img src="resources/images/banner_bottom2.jpg" style="width:1870px; height:150px; padding:0px;"/>
         </a>
      </div>
   </div>
   <div class="card text-center">
      <div class="card-body" >
         <a href="#">
            <img src="resources/images/banner_bottom3.jpg" style="width:1870px; height:150px; padding:0px;"/>
         </a>
      </div>
   </div>
   <div class="card text-center"> 
      <div class="card-body" >
         <a href="#">
            <img src="resources/images/banner_bottom4.jpg" style="width:1870px; height:150px; padding:0px;"/>
         </a>
      </div>
   </div>
   <div class="card text-center"> 
      <div class="card-body" >
         <a href="#">
            <img src="resources/images/banner_bottom5.jpg" style="width:1870px; height:150px; padding:0px;"/>
         </a>
      </div>
   </div>
</div>
   
</div>
<div class="footer"
   style="padding-bottom: 0px; margin-top: 0px; padding-top: 0px;">
   <p
      style="background-color: #2c3e50; color: #fff; margin-bottom: 0px;">
      Copyright © 2022 <a href="#">WITHCAR Co.</a> Ltd. All Rights Reserved.
      <br> Design: <a href="#">WITHCAR DESIGN TEAM</a> <br> MADE
      BY: <a href="#">WITHCAR TEAM</a>
   </p>
</div>

<!-- 바케성0613 배너 js -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>

</body>
<!-- jQuery -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- Bootstrap JavaScript -->

<!-- Scripts -->

<!-- Bootstrap core JavaScript -->

<script src="resources/js/jquery.min.js"></script>

<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->
<!--   <script src="resources/js/bootstrap.bundle.min.js"></script>
 -->
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
        /*바케성 0613 배너추가  */
        $(document).ready(function(){
            $('.banner_slide').slick({
               slide: 'div',      //슬라이드 되어야 할 태그 ex) div, li 
            infinite : true,    //무한 반복 옵션    
            slidesToShow : 1,      // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,      //스크롤 한번에 움직일 컨텐츠 개수
            speed : 2000,    // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : false,       // 옆으로 이동하는 화살표 표시 여부
            dots : false,       // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,         // 자동 스크롤 사용 여부
            autoplaySpeed : 3000,       // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : false,      // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,      // 세로 방향 슬라이드 옵션
            /* prevArrow : "<button type='button' class='slick-prev'>Previous</button>",      // 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='slick-next'>Next</button>",      // 다음 화살표 모양 설정
            dotsClass : "slick-dots",    //아래 나오는 페이지네이션(점) css class 지정 */
            draggable : true,    //드래그 가능 여부 
            });
          });

    </script>
    
</body>
</html>