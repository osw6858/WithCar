<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminTop.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
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

<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>대리점 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 정렬 지역 버튼 -->
		<div class="col" align="left">
			<form name="searchRegion" method="post" action="adminAgency.admin">
				<select name="region_num_admin">
					<c:forEach items="${adminListRegion}" var="dto">
						<option value="${dto.region_num}">${dto.region_name}</option>
					</c:forEach>
				</select>
				<button type="submit">정렬</button>
			</form>
		</div>
		<!-- 정렬 지역 버튼 끝 -->
		
		<!-- 대리점 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-info"
					onclick="location.href='javascript:popup()'">
						대리점 등록
			</button>
			</div>
		<!-- 대리점 등록 버튼 끝 -->
	</div>
	</div>
	&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterAgency.admin"
			var name = "대리점 등록"
			var option = "width=500,height=400,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr class="table-info">
			<th>지역</th>
			<th>대리점명</th>
			<th>위치</th>
			<th>전화번호</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListAgency}">
			<c:forEach items="${adminListAgency}" var="dto">
				<tr>
					<td>${dto.regionDTO.region_name}</td>
					<td>${dto.agency_name}</td>
					<td>${dto.agency_location}</td>
					<td>${dto.agency_phone}</td>
					<td><button type="button" 
							class="btn btn-info"
							onclick="location.href='javascript:popup2(${dto.agency_num})'">
								수정
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminListAgency}">
			<tr>
				<td colspan="5" align="center">해당하는 대리점이 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<script>
		function popup2(a){
			var url = "adminViewAgency.admin?agency_num="+a
			var name = "대리점 수정"
			var option = "width=500,height=400,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>


	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminAgency.admin?page=${page-1}&region_num_admin=${region_num_admin}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminAgency.admin?page=${i}&region_num_admin=${region_num_admin}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminAgency.admin?page=${i}&region_num_admin=${region_num_admin}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminAgency.admin?page=${page+1}&region_num_admin=${region_num_admin}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>