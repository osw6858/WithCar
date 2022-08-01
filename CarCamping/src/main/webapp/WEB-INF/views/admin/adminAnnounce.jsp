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
<div class="col-md-8 themed-grid-col">

	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>공지사항 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortForm" method="post" action="adminAnnounce.admin">
					<select name="sort">
							<option value="desc">최신순</option>
							<option value="asc">오래된순</option>
					</select>
					<button type="submit">정렬</button>
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
	
		<!-- 공지사항 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-info" onclick="location.href='javascript:popup()'">
				공지사항 등록</button>
			</div>
		<!-- 공지사항 등록 버튼 끝 -->
	</div>
</div>
		&nbsp;
	<script>
		function popup(){
			var url = "adminRegisterAnnounce.admin"
			var name = "공지사항 등록"
			var option = "width=500,height=500,top=100,left=200,location=no"
			window.open(url,name,option);
		}
		function con_view(a){
			var url = "adminViewAnnounce.admin?aa_num="+a
			var name = "공지사항 보기"
			var option = "width=500,height=500,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
	
	<table class="table table-striped">
		<tr class="table-info">
			<th>제목</th>
			<th>게시일</th>
			<th>최종 수정일</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListAnnounce}">
			<c:forEach items="${adminListAnnounce}" var="dto">
				<tr>
					<td>${dto.aa_title}</td>
					<td>${dto.aa_sysdate}</td>
					<td>${dto.aa_update}</td>
					<td>
						<button type="button" class="btn btn-info"
								onclick="location.href='javascript:con_view(${dto.aa_num})'">
								보기</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminListAnnounce}">
			<tr>
				<td colspan="4" align="center">등록된 공지사항이 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminAnnounce.admin?page=${page-1}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminAnnounce.admin?page=${i}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminAnnounce.admin?page=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminAnnounce.admin?page=${page+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>