<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminTop.jsp"%>
<%@ include file="left.jsp"%>   

<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">

	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>회원 목록</strong></p>
		</div>
		
	<div class="row justify-content-md-center">
		<!-- 드랍 버튼 -->
			<div class="col" align="left">
				<form name="sortMember" action="adminMember.admin" enctype="multipart/form-data" method="post">
					<select name="sort">
						<option value="mem_point">포인트</option>
						<option value="mem_rentalCount">대여건수</option>
					</select>
						<input type="hidden" name="name1" value="${name1}">
						<input type="hidden" name="name2" value="${name2}">
					<button type="submit">정렬</button>
				</form>
			</div>
			
		<!-- 드랍 버튼 끝 -->
		
		<!-- 회원 검색 버튼 -->
			<div class="col" align="right">
				<form name="search" action="adminMember.admin" enctype="multipart/form-data" method="post">
					<select name="name1">
						<option value="mem_id">아이디</option>
						<option value="mem_nickName">닉네임</option>
						<option value="mem_email">이메일</option>
						<option value="mem_userName">이름</option>
					</select>
					<input type="hidden" name="sort" value="${sort}">
					<input type="search" name="name2">
					<button type="submit">검색</button>
				</form>
			</div>
		<!-- 회원 검색 버튼 끝 -->
	</div>
</div>
	&nbsp;
	<script>
		function popup(a){
			var url = "adminViewMember.admin?mem_num="+a
			var name = "회원 정보"
			var option = "width=600,height=700,top=100,left=200,location=no"
			window.open(url,name,option);
		}
	</script>
	
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr class="table-info">
			<th>ID</th>
			<th>닉네임</th>
			<th>EMAIL</th>
			<th>실명</th>
			<th>포인트</th>
			<th>대여건수</th>
			<th>회원등록일</th>
			<th>이용제한</th>
			<th>정보</th>
		</tr>
		<c:if test="${not empty adminListMember}">
		<c:forEach items="${adminListMember}" var="dto">
			<tr>
				<td>${dto.mem_id}</td>
				<td>${dto.mem_nickName}</td>
				<td>${dto.mem_email}</td>
				<td>${dto.mem_userName}</td>
				<td>${dto.mem_point}</td>
				<td>${dto.mem_rentalCount}</td>
				<td>${dto.mem_sysdate}</td>
				<c:if test="${dto.mem_denied==0}">
					<td>제한</td>
				</c:if>
				<c:if test="${dto.mem_denied==1}">
					<td>일반</td>
				</c:if>
				<td><button type="button" class="btn btn-info"
				onclick="location.href='javascript:popup(${dto.mem_num})'">정보</button></td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty adminListMember}">
			<td colspan="9" align="center">해당하는 회원이 없습니다</td>
		</c:if>
	</table>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminMember.admin?page=${page-1}&sort=${sort}&name1=${name1}&name2=${name2}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminMember.admin?page=${i}&sort=${sort}&name1=${name1}&name2=${name2}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminMember.admin?page=${i}&sort=${sort}&name1=${name1}&name2=${name2}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminMember.admin?page=${page+1}&sort=${sort}&name1=${name1}&name2=${name2}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>
<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>