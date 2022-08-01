<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        
<c:set var="region_num" value="${region_num}"/>
    
<style>
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
.list-group-item{
   border:0;
}
</style>
    </head>
    <body>     
        <!-- Section-->
        <section class="py-5">
        <div style="display: flex;float: right;margin-right: 305px;">
      <div class="btn-group">
                  <button type="button" class="btn btn-primary dropdown-toggle"
                     data-bs-toggle="dropdown" aria-expanded="false"
                     style="background-color: #00205b; border-color: #00205b;">정렬</button>
                  <ul class="dropdown-menu" style="margin-right: 13px;">
                     <li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=ccr_reviewCount&pageNum=1">리뷰순</a></li>
                     <li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=ccr_likeCount&pageNum=1">좋아요순</a></li>  
                     <li><a class="dropdown-item" href="board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=ccr_score&pageNum=1">별점순</a></li>
            </ul>
               </div>
      <select name="search" id="search">
         <option value="ccr_name">장소명</option>
         <option value="ccr_content">장소설명</option>
      </select>
      <input class="form-control me-2" type="text" id="searchString" name="searchString" placeholder="검색" aria-label="Search2" style="width:400px;"> 
      <input type="submit" value="검색" onclick="search_function();" style="padding-left: 0px; padding-right: 0px; width: 62px;">   
</div>
<br>
<br>
<br>

            <div class="container px-4 px-lg-5 mt-5">
            
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   <table class="table table-borderless">

                    <c:if test="${empty {list}}">
               <tr>
                  <td>해당 지역에 등록된 차박지가 없습니다.</td>
               </tr>
               </c:if>
                    <c:forEach items="${list}" var="bdto">
                     <td>
                        <div class="card" style="display: inline-block">
                         <!-- hot badge-->
                         <c:if test="${ bdto.ccr_popular == 0}">
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">hot</div>
                           </c:if>
                            <!-- 장소 이미지 -->   
                            <img class="card-img-top" src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${bdto.ccr_viewImage1}" style="width: 300px; height: 200px;"  alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" style="padding-bottom: 20px;">${bdto.ccr_name }</h5>
                                    <!-- Product price-->
                                         리뷰 수 : ${bdto.ccr_reviewCount}<br>
                                         좋아요 수 : ${bdto.ccr_likeCount}<br>
                                         
                                         <li class="list-group-item" >
                                 
                                    <c:choose>
                         <c:when test="${bdto.ccr_score >= 1 && bdto.ccr_score < 2 }">
                                   <label for="rate1">⭐</label>
                         </c:when>
                         <c:when test="${bdto.ccr_score >= 2 && bdto.ccr_score < 3 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                         </c:when>
                         <c:when test="${bdto.ccr_score >= 3 && bdto.ccr_score < 4 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                         </c:when>
                         <c:when test="${bdto.ccr_score >= 4 && bdto.ccr_score < 5 }">
                                <label for="rate1">⭐</label>
                                <label for="rate2">⭐</label>
                                <label for="rate3">⭐</label>
                                 <label for="rate4">⭐</label>
                         </c:when>
                         <c:when test="${bdto.ccr_score eq 5 }">
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
                                 
                              </li>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="regionView.region?ccr_num=${bdto.ccr_num}">장소 보러 가기</a></div>
                            </div>
                        </div>
                        </td>
              <c:set var="count" value="${count+1}"/>
            <c:if test="${count==4}">
               <c:set var="count" value="0"/>
              </tr><tr>
            </c:if>
           </c:forEach>
           
                   
                    </table>
                        </div>
                    </div>
               
        </section>
       
       
        <div class="col-xs-6 col-xs-offset-3"> 
   <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
               <c:if test="${rowCount>0 }">
                  <c:if test="${startPage>1}">
                        <li class="page-item">
                        <a class="page-link" onclick="location.href='board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=${orderBy }&pageNum=${startPage-1}'">
                           Previous</a>
                        </li> 
                  </c:if>
                  <c:forEach var="i" begin="${startPage}" end="${endPage}">
                     <li class="page-item">
                     <a class="page-link" onclick="location.href='board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=${orderBy }&pageNum=${i }'">
                           <c:out value="${i}" /></a>
                     </li>                  
                   </c:forEach>
                  <c:if test="${endPage < pageCount }">
                     <li class="page-item">
                     <a class="page-link" onclick="location.href='board.region?region_num=${region_num}&mode=${mode}&search=${search}&searchString=${searchString}&orderBy=${orderBy }&pageNum=${endPage+1}'">
                           Next</a>                     
                     </li>
                  </c:if>
               </c:if>   
            </ul>
         </nav>
         <br>
         <br>
</div>
        
    </body>
    <script>
    
    function search_function(){
      var searchSelect = document.getElementById("search");
      var search = searchSelect.options[searchSelect.selectedIndex].value;
      var searchString = document.getElementById("searchString").value;
      location.href="board.region?region_num="+${region_num}+"&mode=searchCcr&orderBy=ccr_num&search="+search+"&searchString="+searchString+"&pageNum=1";
      
   }
    </script>
</html>

   <%@include file="../bottom.jsp"%>