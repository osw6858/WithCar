<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminTop.jsp"%>
<%@ include file="left.jsp"%>
<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">
	<div class="row" align="center">
		<div class="col">
			<p class="h2"><strong>카테고리 목록</strong></p>
		</div>
		
		<div class="row justify-content-md-center" >

			<!-- 카테고리 등록 버튼 -->
			<div class="col" align="right">
				<button type="button" class="btn btn-info" onclick="location.href='javascript:popup()'">
				카테고리 등록</button>
			</div>
			<!-- 카테고리 버튼 끝 -->
		</div>
	</div>
	<script>
		function popup(){
			var url = "adminInsertCategory.admin"
			var name = "카테고리 등록"
			var option = "width=500,height=150,top=100,left=200,location=no"
			window.open(url,name,option);
		}
		function con_deleteBrand(a){
			var con2 = window.confirm('정말 삭제하시겠습니까?')
			if (con2){
				location.href="adminDeleteBrand.admin?brand_num="+a
			}
		}
		function con_deleteProduct(a){
			var con2 = window.confirm('정말 삭제하시겠습니까?')
			if (con2){
				location.href="adminDeleteProductCategory.admin?pc_num="+a
			}
		}
	</script>
	&nbsp;
	<!-- 본문 -->
	<div class="row">
		<div class="col">
			<table class="table table-striped" style="overflow:scroll">
				<tr class="table-info">
					<th colspan="2" align="center"><p class="h4"><strong>브랜드 카테고리</strong></p></th>
				</tr>
				
				<tr class="table-info">
					<th>카테고리명</th>
					<th> </th>
				</tr>
				<c:if test="${not empty adminListBrand}">
					<c:forEach items="${adminListBrand}" var="dto">
						<tr>
							<td>${dto.brand_name}</td>
							<td>
								<button type="button" class="btn btn-info"
									onclick="location.href='javascript:con_deleteBrand(${dto.brand_num})'">
									삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty adminListBrand}">
					<td colspan="2">등록된 브랜드가 없습니다</td>
				</c:if>
			</table>
		</div>
		<div class="col">
			<table class="table table-striped" style="overflow:scroll">
				<tr class="table-info">
					<th colspan="2" align="center"><p class="h4"><strong>용품 카테고리</strong></p></th>
				</tr>
				<tr class="table-info">
					<th>카테고리명</th>
					<th> </th>
				</tr>
				<c:if test="${not empty adminListProductCategory}">
					<c:forEach items="${adminListProductCategory}" var="dto">
						<tr>
							<td>${dto.pc_name}</td>
							<td>
								<button type="button" class="btn btn-info"
									onclick="location.href='javascript:con_deleteProduct(${dto.pc_num})'">
									삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty adminListProductCategory}">
					<td colspan="2">등록된 상품분류가 없습니다</td>
				</c:if>
			</table>
		</div>
	</div>
</div>
<%@ include file="../bottom.jsp"%>