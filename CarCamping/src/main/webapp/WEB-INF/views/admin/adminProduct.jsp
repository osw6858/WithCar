<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
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
			<p class="h2"><strong>차박 용품 목록</strong></p>
		</div>
	
	<div class="row justify-content-md-center">
		<!-- 검색 버튼 -->
		<div class="col" align="left">
			<form name="search" action="adminProduct.admin" enctype="multipart/form-data" method="post">
				<input type="search" name="search" placeholder="브랜드|카테고리|용품명">
				&nbsp;<button type="submit">검색</button>
			</form>
		</div>

		<div class="col" align="right">
			<!-- 용품 등록 버튼 -->
			<button type="button" class="btn btn-info" onclick="location.href='javascript:popup()'">
			용품 등록</button>
			<!-- 용품 등록 버튼 끝 -->
		</div>
	</div>
</div>
	<script>
		function popup(){
			var url = "adminRegisterProduct.admin"
			var name = "용품 등록"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
		}
		function view(a){
			var url = "adminViewProduct.admin?prod_num="+a
			var name = "용품 보기"
			var option = "width=470,height=700,top=100,left=200,location=no,resizable=no"
			window.open(url,name,option);
			}
	</script>
	
	&nbsp;
	<!-- 본문 -->
<div class="row" style="overflow:hidden;">
	<table class="table table-striped">
		<tr class="table-info">
			<th>분류</th>
			<th>브랜드</th>
			<th>용품명</th>
			<th>일일대여요금(원)</th>
			<th>평점</th>
			<th> </th>
		</tr>
			<c:if test="${not empty adminListProduct}">
			<c:forEach items="${adminListProduct}" var="dto">
			<tr>
				<td>
					${dto.productCategoryDTO.pc_name}
				</td>
				<td>
					${dto.brandCategoryDTO.brand_name}
				</td>
				<td>
					${dto.prod_name}
				</td>
				<td>
					${dto.prod_price}
				</td>
				<td>
					<button type="button" class="btn btn-info"
							onclick="location.href='javascript:view(${dto.prod_num})'">
							보기
					</button>
				</td>	
			
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty adminListProduct}">
				<tr>
					<td colspan="6" align="center">해당하는 용품이 없습니다</td>
				</tr>
			</c:if>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
				<li class="page-item"><a class="page-link" href="adminProduct.admin?page=${page-1}&search=${search}">Previous</a></li>
			</c:if>
		<c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
			<c:if test="${i==page}">
				<li class="page-item"><a class="page-link" href="adminProduct.admin?page=${i}&search=${search}" style="color:blue;">${i}</a></li>
			</c:if>
			<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link" href="adminProduct.admin?page=${i}&search=${search}">${i}</a></li>
			</c:if>
		</c:forEach>
			<c:if test="${page+3<pageCount}">
				<li class="page-item"><a class="page-link" href="adminProduct.admin?page=${page+1}&search=${search}">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>
</div>

<!-- End Content Column Grid -->
<%@ include file="../bottom.jsp"%>