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
			<p class="h2"><strong>장소 리뷰 목록</strong></p>
		</div>	
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
		<div class="col" align="left">
			<form name="sortForm" action="adminReviewRegion.admin" method="post" enctype="multipart/form-data">
				<select name="sort">
					<option value="review_likeCount">좋아요순</option>
					<option value="review_sysdate">최신순</option>
					<option value="review_adminConfirm">승인안됨</option>	
				</select>
				<input type="hidden" name="search" value="${search}">
				<button type="submit">정렬</button>
			</form>
		</div>
		
		<!-- 리뷰 검색 버튼 -->
		<div class="col" align="right">
			<form name="searchForm" action="adminReviewRegion.admin" method="post" enctype="multipart/form-data">
				<input type="search" name="search" placeholder="제목|내용">
				<input type="hidden" name="sort" value="${sort}">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
</div>
	&nbsp;

	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr class="table-info">
			<th>리뷰 제목</th>
			<th>개시일</th>
			<th>평점</th>
			<th>좋아요</th>
			<th>승인여부</th>
			<th> </th>
		</tr>
			<c:if test="${not empty adminListReviewRegion}">
			<c:forEach items="${adminListReviewRegion}" var="dto">
				<tr>
					<td>${dto.review_title}</td>
					<td>${dto.review_sysdate}</td>
					<td>${dto.review_regionScore}</td>
					<td>${dto.review_likeCount}</td>
					<td>
						<c:if test="${dto.review_adminConfirm==0}">
							승인 완료
						</c:if>
						<c:if test="${dto.review_adminConfirm==1}">
							승인 대기중
						</c:if>
					</td>
					<td>
						<button type="button" class="btn btn-info"
								onclick="location.href='javascript:popup(${dto.review_num})'">
								내용
						</button>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty adminListReviewRegion}">
				<tr>
					<td colspan="6" align="center">해당하는 리뷰가 없습니다</td>
				</tr>
			</c:if>
	</table>
	<script>
		function popup(a){
			var url = "adminViewReviewRegion.admin?review_num="+a
			var name = "장소 리뷰 보기"
			var option = "width=700,height=800,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
		
	</script>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminReviewRegion.admin?page=${page-1}&sort=${sort}&search=${search}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminReviewRegion.admin?page=${i}&sort=${sort}&search=${search}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminReviewRegion.admin?page=${i}&sort=${sort}&search=${search}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminReviewRegion.admin?page=${page+1}&sort=${sort}&search=${search}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>