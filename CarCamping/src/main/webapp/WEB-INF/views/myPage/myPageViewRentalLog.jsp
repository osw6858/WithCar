 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
   function con(){
      var con1 = window.confirm('연장은 하루단위로 한 번만 신청가능합니다. 신청시 환불할 수 없습니다. 신청하시겠습니까?')
      if (con1){
         document.viewRentalLog.submit()
      }
   }
</script>
<style>
 .carousel-item img {
       width:400px;
       height:350px;
       overflow:hidden;
       margin:0 auto;
       object-fit:cover;
   }

</style>
<body>
   <div align="center">
      <form name="viewRentalLog" method="post" action="myPageExtendRentalLog.myPage" enctype="multipart/form-data">
      <input type = "hidden" name="rental_num" value="${rdto.rental_num}">
      <table class="table table-sm">
          <%-- <tr>
             <td colspan="2">
                <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${rdto.productDTO.prod_viewImage1}">
             </td>
          </tr> --%>
         <tr>
            <th>용품명</th>
            <td>${rdto.productDTO.prod_name}</td>
         </tr>
         <tr>
            <th>수량</th>
            <td>${rdto.rental_productCount}</td>
         </tr>
         <tr>
            <th>대리점명</th>
            <td>${rdto.agencyDTO.agency_name}</td>
         </tr>
         <tr>
            <th>대여시작일</th>
            <td>${rdto.rental_from}
               <input type="hidden" name="rental_from" value="${rdto.rental_from}">
            </td>
         </tr>
         <tr>
            <th>대여종료일</th>
            <td>${rdto.rental_to}
               <input type="hidden" name="rental_to" value="${rdto.rental_to}">
            </td>
         </tr>
         <tr>
            <th>대여요금</th>
            <td>${rdto.rental_price}
               <input type="hidden" name="rental_price" value="${rdto.rental_price}">
            </td>
         </tr>
         <tr>
            <th>포인트사용요금</th>
            <td>${rdto.rental_usePoint}</td>
         </tr>
         <tr>
            <th>결제일시</th>
            <td>${rdto.rental_pay}</td>
         </tr>
         <tr>
            <th>반납상태</th>
            <c:if test="${rdto.rental_return==0}">
               <td>대기</td>
            </c:if>
            <c:if test="${rdto.rental_return==1}">
               <td>대여중</td>
            </c:if>
            <c:if test="${rdto.rental_return==2}">
               <td>반납완료</td>
            </c:if>
            <c:if test="${rdto.rental_return==3}">
               <td>연장중</td>
            </c:if>
            <c:if test="${rdto.rental_return==4}">
               <td>미납</td>
            </c:if>   
         </tr>
         <tr>
            <th>연장기간</th>
            <td>${rdto.rental_extend}</td>
         </tr>
         <tr>
            <th>연장요금</th>
            <td>${rdto.rental_extendPrice}</td>
         </tr>
         <tr>
            <th>미납기간</th>
            <td>${rdto.rental_notReturn}</td>
         </tr>
         <tr>
            <th>미납요금</th>
            <td>${rdto.rental_notReturnPrice}</td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <c:if test="${rdto.rental_return==1}">
                     <button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">연장신청하기</button>
               </c:if>
            </td>
         </tr>
      </table>
      </form>
   </div>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>