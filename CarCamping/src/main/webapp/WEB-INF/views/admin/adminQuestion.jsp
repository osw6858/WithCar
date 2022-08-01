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
			<p class="h2"><strong>문의사항 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortForm" action="adminQuestion.admin" method="post" enctype="multipart/form-data">
					<select name="sort">
						<option value="question_sysdate">최신순</option>
						<option value="question_reply">답변 미완료</option>
					</select>
					<button type="submit">정렬</button>
				</form>
			</div>
		<!-- 드랍 버튼 끝 -->
	</div>
</div>
	&nbsp;
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr class="table-info">
			<th>문의일시</th>
			<th>회원ID</th>
			<th>제목</th>
			<th> </th>
		</tr>
		<c:if test="${not empty adminListQuestion}">
			<c:forEach items="${adminListQuestion}" var="dto">
				<tr>
					<td>${dto.question_sysdate}</td>
					<td>${dto.memberDTO.mem_nickName}</td>
					<td>${dto.question_content}</td>
					<td><button type="button" 
							class="btn btn-info" onclick="location.href='javascript:popup(${dto.question_num})'">
								내용
						</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminListQuestion}">
			<tr>
				<td colspan="4" align="center">등록된 문의사항이 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<script>
		function popup(a){
			var url = "adminViewQuestion.admin?question_num="+a
			var name = "문의 내용"
			var option = "width=500,height=500,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminQuestion.admin?page=${page-1}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminQuestion.admin?page=${i}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminQuestion.admin?page=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminQuestion.admin?page=${page+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>