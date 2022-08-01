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
      var con1 = window.confirm('정말 수정하시겠습니까?')
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
      <form name="viewRentalLog" method="post" action="adminViewRentalLog.admin" enctype="multipart/form-data">
      <input type = "hidden" name="rental_num" value="${rdto.rental_num}">
      <table class="table table-sm">
         <tr>
            <th>ID</th>
            <td>${rdto.memberDTO.mem_id}</td>   
         </tr>
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
            <td>${rdto.rental_from}</td>
         </tr>
         <tr>
            <th>대여종료일</th>
            <td>${rdto.rental_to}</td>
         </tr>
         <tr>
            <th>대여요금</th>
            <td>${rdto.rental_price}</td>
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
               반납상태 수정:<select name="rental_return">
               			<c:choose>
                           <c:when test="${rdto.rental_return==0}">
                              <option value="0" selected>대기</option>
                           </c:when>
                           <c:otherwise>
                              <option value="0">대기</option>
                           </c:otherwise>
                        </c:choose>
                        <c:choose>
                           <c:when test="${rdto.rental_return==1}">
                              <option value="1" selected>대여중</option>
                           </c:when>
                           <c:otherwise>
                              <option value="1">대여중</option>
                           </c:otherwise>
                        </c:choose>
                        <c:choose>
                           <c:when test="${rdto.rental_return==2}">
                              <option value="2" selected>반납완료</option>
                           </c:when>
                           <c:otherwise>
                              <option value="2">반납완료</option>
                           </c:otherwise>
                        </c:choose>
                        <c:choose>
                           <c:when test="${rdto.rental_return==3}">
                              <option value="3" selected>연장중</option>
                           </c:when>
                           <c:otherwise>
                              <option value="3">연장중</option>
                           </c:otherwise>
                        </c:choose>
                        <c:choose>
                           <c:when test="${rdto.rental_return==4}">
                              <option value="4" selected>미납</option>
                           </c:when>
                           <c:otherwise>
                              <option value="4">미납</option>
                           </c:otherwise>
                        </c:choose>
                       </select>
               <button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">수정</button>
            </td>
         </tr>
      </table>
      </form>
   </div>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
