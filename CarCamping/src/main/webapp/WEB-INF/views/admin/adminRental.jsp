<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminTop.jsp"%>
<%@ include file="left.jsp"%>   
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
</style>
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>대여 목록</strong></p>
		</div>
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
			<div class="col" align="center">
				<form name="sortForm" method="post" enctype="multipart/form-data" action="adminRental.admin">
					<select name="sort">
						<c:if test="${sort == 4}">	
							<option value="4" selected>미납</option>
						</c:if>
						<c:if test="${sort != 4}">	
							<option value="4">미납</option>
						</c:if>
						
						<c:if test="${sort == 3}">
							<option value="3" selected>연장</option>
						</c:if>
						<c:if test="${sort != 3}">
							<option value="3">연장</option>
						</c:if>
						
						<c:if test="${sort == 2}">
							<option value="2" selected>반납완료</option>
						</c:if>
						<c:if test="${sort != 2}">
							<option value="2">반납완료</option>
						</c:if>
						
						<c:if test="${sort == 1}">
							<option value="1" selected>대여중</option>
						</c:if>
						<c:if test="${sort != 1}">
							<option value="1">대여중</option>
						</c:if>
						<c:if test="${sort == 0}">
							<option value="0" selected>대기</option>
						</c:if>
						<c:if test="${sort != 0}">
							<option value="0">대기</option>
						</c:if>
					</select>
					<select name="rental_date">
						<option value="rental_from">대여시작일</option>
						<option value="rental_to">대여종료일</option>
						<option value="rental_pay">결제일시</option>
					</select>
					
					<input type="date" name="rental_from_date">~
					<input type="date" name="rental_to_date">
					
					<input type="search" name="search" placeholder="ID | 용품명">
					<input type="hidden" name="sort" value="${sort}">
					<input type="hidden" name="search" value="${search}">
					<input type="submit" value="검색">
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
		
		<!-- ID 검색 버튼 -->
		<%-- <div class="col" align="right">
			<form name="searchForm" action="adminRental.admin" method="post" enctype="multipart/form-data">
				<input type="search" name="search" placeholder="ID | 용품명">
				<input type="hidden" name="sort" value="${sort}">
				<button type="submit">검색</button>
			</form>
		</div> --%>
	</div>
</div>
	&nbsp;
	<script>
		function popup(a){
			var url = "adminViewRentalLog.admin?rental_num="+a
			var name = "대여 정보"
			var option = "width=600,height=800,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">	
	<table class="table table-striped">
		<tr class="table-info">
			<th>회원ID</th>
			<th>용품명</th>
			<th>대리점명</th>
			<th>수량</th>
			<th>대여시작일</th>
			<th>대여종료일</th>
			<th>대여요금</th>
			<th>포인트 사용 요금</th>
			<th>반납상태</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListRentalLog}">
		<c:forEach items="${adminListRentalLog}" var="dto">
			<tr>
				<td>${dto.memberDTO.mem_id}</td>
				<td>${dto.productDTO.prod_name}</td>
				<td>${dto.agencyDTO.agency_name}</td>
				<td>${dto.rental_productCount}</td>
				<td>${dto.rental_from}</td>
				<td>${dto.rental_to}</td>
				<td>${dto.rental_price}</td>
				<td>${dto.rental_usePoint}</td>
				<c:if test="${dto.rental_return==0}">
					<td>대기</td>
				</c:if>
				<c:if test="${dto.rental_return==1}">
					<td>대여중</td>
				</c:if>
				<c:if test="${dto.rental_return==2}">
					<td>반납완료</td>
				</c:if>
				<c:if test="${dto.rental_return==3}">
					<td>연장중</td>
				</c:if>
				<c:if test="${dto.rental_return==4}">
					<td>미납</td>
				</c:if>					
				<td><button type="button" class="btn btn-info"
				onclick="location.href='javascript:popup(${dto.rental_num})'">정보</button></td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty adminListRentalLog}">
			<td colspan="10" align="center">해당하는 대여내역이 없습니다</td>
		</c:if>
	</table>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminRental.admin?page=${page-1}&sort=${sort}&search=${search}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminRental.admin?page=${i}&sort=${sort}&search=${search}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminRental.admin?page=${i}&sort=${sort}&search=${search}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminRental.admin?page=${page+1}&sort=${sort}&search=${search}&rental_from__date=${rental_from_date}&rental_to_date=${rental_to_date}&rental_date=${rental_date}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!— End Content Column Grid —>
<%@ include file="../bottom.jsp"%>