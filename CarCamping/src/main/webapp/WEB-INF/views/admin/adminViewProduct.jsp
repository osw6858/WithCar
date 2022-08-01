<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewProduct.submit()
		}
	}
	function con_delete(){
		var con2 = window.confirm('정말 삭제하시겠습니까?')
		if (con2){
			location.href="adminDeleteProduct.admin?prod_num="+${pdto.prod_num}
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
		<form name="viewProduct" method="post" action="adminViewProduct.admin" enctype="multipart/form-data"
		class="row g-3 needs-validation" novalidate>
		<input type = "hidden" name="prod_num" value="${pdto.prod_num}">
		<table class="table table-sm">
			<tr>
				<td colspan="2" align="center">
					<p class="h3"><strong>${pdto.brandCategoryDTO.brand_name} | ${pdto.productCategoryDTO.pc_name}</strong></p>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="prod_name" value="${pdto.prod_name}" class="form-control" id="validationCustom01" maxlength="20" placeholder="1" required>
						<label for="validationCustom01">용품명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="number" name="prod_price" value="${pdto.prod_price}" class="form-control" id="validationCustom02" min="0" placeholder="1" required>
						<label for="validationCustom02">일일 대여 요금(원)</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="prod_summary" value="${pdto.prod_summary}" class="form-control" id="validationCustom03" maxlength="20" placeholder="1" required>
						<label for="validationCustom03">용품 요약 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<textarea name="prod_viewContent" style="resize: none;" class="form-control" id="validationCustom04" maxlength="1000" placeholder="1" required>${pdto.prod_viewContent}</textarea>
						<label for="validationCustom04">용품 상세 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
			<!-- 현재 이미지 캐러셀 -->
						&nbsp;
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<c:if test="${not empty pdto.prod_viewImage1}">
									<div class="carousel-item active">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage1}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty pdto.prod_viewImage2}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage2}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty pdto.prod_viewImage3}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage3}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty pdto.prod_viewImage4}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage4}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty pdto.prod_viewImage5}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${pdto.prod_viewImage5}" class="d-block w-100" alt="...">
									</div>
								</c:if>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</td>
			</tr>
			<tr>
					<td colspan="2">
						<div class="accordion accordion-flush" id="accordionFlushExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
										aria-expanded="false" aria-controls="flush-collapseOne">
										이미지 수정</button>
								</h2>
								<div id="flush-collapseOne" class="accordion-collapse collapse"
									aria-labelledby="flush-headingOne"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<input class="form-control" id="formFileMultiple-1"
											type="file" multiple accept="image/*" name="prod_viewImage"
											class="form-control" id="validationCustom05" required>

										<!-- 기존 이미지 Hidden -->
										<c:if test="${not empty pdto.prod_viewImage1}">
											<input type="hidden" name="prod_viewImageHidden1"
												value="${pdto.prod_viewImage1}">
										</c:if>
										<c:if test="${not empty pdto.prod_viewImage2}">
											<input type="hidden" name="prod_viewImageHidden2"
												value="${pdto.prod_viewImage2}">
										</c:if>
										<c:if test="${not empty pdto.prod_viewImage3}">
											<input type="hidden" name="prod_viewImageHidden3"
												value="${pdto.prod_viewImage3}">
										</c:if>
										<c:if test="${not empty pdto.prod_viewImage4}">
											<input type="hidden" name="prod_viewImageHidden4"
												value="${pdto.prod_viewImage4}">
										</c:if>
										<c:if test="${not empty pdto.prod_viewImage5}">
											<input type="hidden" name="prod_viewImageHidden5"
												value="${pdto.prod_viewImage5}">
										</c:if>
										<div id="validationCustom05" class="form-text">수정시, 기존
											이미지는 삭제되고 선택된 이미지들로 대체됩니다</div>
										<ul id="file-list-1">
											<li class="no-items"></li>
										</ul>

										<script>
											var filesUpload = document
													.getElementById("formFileMultiple-1"), fileList = document
													.getElementById("file-list-1");

											function traverseFiles(files) {
												var li, file, fileInfo;
												fileList.innerHTML = "";

												for (var i = 0, il = files.length; i < il; i++) {
													li = document
															.createElement("li");
													file = files[i];
													fileInfo = "<div><strong>파일명:</strong> "
															+ file.name
															+ "</div>";

													li.innerHTML = fileInfo;
													fileList.appendChild(li);
												}
												;
											};

											filesUpload.onchange = function() {
												traverseFiles(this.files);
											};
										</script>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			<tr>
				<th>리뷰수</th>
				<td>${pdto.prod_reviewCount}</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>${pdto.prod_reviewScore}</td>
			</tr>
			<tr>
				<th>최초등록일</th>
				<td>${pdto.prod_sysdate}</td>
			</tr>
			<tr>
				<th>최종수정일</th>
				<td>${pdto.prod_update}</td>
			</tr>
			<tr>
				<th>인기용품</th>
				<c:choose>
					<c:when test="${pdto.prod_popular==0}">
						<td><input type="checkbox" name="prod_popular1" checked>체크시(예)</td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" name="prod_popular1">체크시(예)</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="reset" class="btn btn-primary">취소</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con()'">수정</button>
					<button type="button" class="btn btn-primary" onclick="location.href='javascript:con_delete()'">삭제</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</html>