<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
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
<!-- Content Column Grid -->
<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
   <div class="row">
   </div>
   <div class="row" align="center">
      <div class="col">
         <p class="h2"><strong>대여 내역</strong></p>
      </div>
   <div class="row">
      <!-- 드랍 버튼 -->
         <div class="col" align="left">
            <%-- <div class="dropdown">
               <button class="btn btn-secondary dropdown-toggle" type="button"
                  id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                  정렬</button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                  <li><button class="dropdown-item" type="button" onclick="location.href='myPageRental.myPage?page=${page}&sort=rental_pay'">최신순</button></li>
                  <li><button class="dropdown-item" type="button" onclick="location.href='myPageRental.myPage?page=${page}&sort=rental_price'">대여금</button></li>
                  
               </ul>
            </div> --%>
            <form name="sortForm" method="post" enctype="multipart/form-data" action="myPageRental.myPage">
					<select name="rental_date">
						<option value="rental_from">대여시작일</option>
						<option value="rental_to">대여종료일</option>
						<option value="rental_pay">결제일시</option>
					</select>
					
					<input type="date" name="rental_from_date">~
					<input type="date" name="rental_to_date">
					
					<input type="submit" value="조회">
				</form>
         	</div>
      <!-- 드랍 버튼 끝 -->
         
            <!-- 포인트 적립 내역 -->
            <div class="col" align="right">
               <button type="button" class="btn btn-dark" style=" background:#091835;" data-bs-toggle="modal" data-bs-target="#exampleModal">
                 포인트 적립 내역
               </button>
               
               <!-- 포인트 적립 내역 모달 -->
               <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">포인트 적립내역</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body" style="overflow:auto;">
                       <table class="table table-striped">
                        <tr>
                           <th>적립일시</th>
                           <th>적립내용</th>
                           <th>적립금</th>
                        </tr>
                        <c:forEach items="${listPointLog}" var="pdto">
                           <tr>
                              <td>${pdto.point_sysdate}</td>
                              <td>
                                 <c:if test="${pdto.point_reason==1}">
                                    첫 리뷰 작성
                                 </c:if>
                                 <c:if test="${pdto.point_reason==2}">
                                    리뷰 작성 승인
                                 </c:if>
                                 <c:if test="${pdto.point_reason==3}">
                                    인기글 리뷰 선정
                                 </c:if>
                                 <c:if test="${pdto.point_reason==5}">
                                    용품 대여 적립
                                 </c:if>
                              </td>
                              <td>${pdto.point_saving}</td>
                           </tr>
                        </c:forEach>
                     </table>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                     </div>
                   </div>
                 </div>
               </div>
         </div>
   </div>
   <div class="row">
      &nbsp;
   </div>
</div>
<script>
   function popup(a){
      var url = "myPageViewRentalLog.myPage?rental_num="+a
      var name = "대여 정보"
      var option = "width=600,height=800,top=100,left=200,location=no"
      window.open(url,name,option);
   }
</script>
   
   <!-- 본문 -->
   <c:if test="${not empty cartList}">
	   <table class="table table-striped">
	      <tr>
	         <th>용품명</th>
	         <th>대리점명</th>
	         <th>결제일시</th>
	         <th>대여시작일</th>
	         <th>대여종료일</th>
	         <th>수량</th>
	         <th>대여요금</th>
	         <th>포인트사용요금</th>
	         <th>반납상태</th>
	         <th></th>
	      </tr>
      
	       <c:forEach items="${cartList}" var="mdto">
	      <tr>
	         <td>${mdto.productDTO.prod_name}</td>
	         <td>${mdto.agencyDTO.agency_name}</td>
	         <td>${mdto.rental_pay}</td>
	         <td>${mdto.rental_from}</td>
	         <td>${mdto.rental_to}</td>
	         <td>${mdto.rental_productCount}개</td>
	         <td>${mdto.rental_price}원</td>
	         <td>${mdto.rental_usePoint}</td>
	         
	         <c:if test="${mdto.rental_return==0}">
	               <td>대기</td>
	            </c:if>
	            <c:if test="${mdto.rental_return==1}">
	               <td>대여중</td>
	            </c:if>
	            <c:if test="${mdto.rental_return==2}">
	               <td>반납완료</td>
	            </c:if>
	            <c:if test="${mdto.rental_return==3}">
	               <td>연장중</td>
	            </c:if>
	            <c:if test="${mdto.rental_return==4}">
	               <td>미납</td>
	            </c:if>
	            <td><button type="button" class="btn btn-dark" style="width: 100%; background:#091835;"
	            onclick="location.href='javascript:popup(${mdto.rental_num})'">정보</button></td>
	            
	   
	      </tr>
	     	 </c:forEach>
   		</table>
   	</c:if>
   	<c:if test="${empty cartList}">
   		<p class="h4"><strong>해당하는 대여내역이 없습니다</strong></p>
   	</c:if>
   <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
      <c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="myPageRental.myPage?page=${page-1}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="myPageRental.myPage?page=${i}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="myPageRental.myPage?page=${i}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="myPageRental.myPage?page=${page+1}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">Next</a></li>
		</c:if>
      </ul>
   </nav>
   <br><br>
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>