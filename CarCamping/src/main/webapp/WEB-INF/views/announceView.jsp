<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
</head>

<body>
   <div align="center">
      <form name="viewAnnounce" method="post"
         action="adminViewAnnounce.admin" enctype="multipart/form-data"
         class="row g-3 needs-validation" novalidate>
         <input type="hidden" name="aa_num" value="${adto.aa_num}">
         <table class="table table-sm">
            
            <tr>
               <td colspan="2">
                  ${adto.aa_content}
                  <!-- 현재 이미지 캐러셀 --> &nbsp;
                  <div id="carouselExampleIndicators" class="carousel slide"
                     data-bs-ride="carousel">

                     <div class="carousel-inner">
                        <c:if test="${not empty adto.aa_image1}">
                           <div class="carousel-item active">
                              <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image1}" class="d-block w-100"
                                 alt="...">
                           </div>
                        </c:if>
                        <c:if test="${not empty adto.aa_image2}">
                           <div class="carousel-item active">
                              <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image2}" class="d-block w-100"
                                 alt="...">
                           </div>
                        </c:if>
                        <c:if test="${not empty adto.aa_image3}">
                           <div class="carousel-item active">
                              <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image3}" class="d-block w-100"
                                 alt="...">
                           </div>
                        </c:if>
                        <c:if test="${not empty adto.aa_image4}">
                           <div class="carousel-item active">
                              <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image4}" class="d-block w-100"
                                 alt="...">
                           </div>
                        </c:if>
                        <c:if test="${not empty adto.aa_image5}">
                           <div class="carousel-item active">
                              <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image5}" class="d-block w-100"
                                 alt="...">
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
               
            </tr>

         </table>
      </form>
   </div>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>

</html>