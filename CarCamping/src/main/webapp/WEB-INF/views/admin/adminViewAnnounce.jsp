<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<script>
	function con(){
		var con1 = window.confirm('정말 수정하시겠습니까?')
		if (con1){
			document.viewAnnounce.submit()
		}
	}
	function con_delete(){
		var con2 = window.confirm('정말 삭제하시겠습니까?')
		if (con2){
			location.href="adminDeleteAnnounce.admin?aa_num="+${adto.aa_num}
		}
	}
</script>

<body>
	<div align="center">
		<form name="viewAnnounce" method="post" action="adminViewAnnounce.admin" enctype="multipart/form-data"
		class="row g-3 needs-validation" novalidate>
		<input type = "hidden" name="aa_num" value="${adto.aa_num}">
		<table class="table table-sm">
			<tr>
				<td>
					<div class="form-floating mb-3">
						<input type="text" name="aa_title" value="${adto.aa_title}" class="form-control" id="validationCustom01" maxlength="20" placeholder="1" required>
						<label for="validationCustom01">제목</label>
					</div>
				</td>	
			</tr>
			<tr>
				<td>
					<div class="form-floating mb-3">
						<textarea name="aa_content" style="resize: none;" class="form-control" id="validationCustom02" maxlength="1000" placeholder="1" required>${adto.aa_content}</textarea>
						<label for="validationCustom02">내용</label>
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
								<c:if test="${not empty adto.aa_image1}">
									<div class="carousel-item active">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image1}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty adto.aa_image2}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image2}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty adto.aa_image3}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image3}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty adto.aa_image4}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image4}" class="d-block w-100" alt="...">
									</div>
								</c:if>
								<c:if test="${not empty adto.aa_image5}">
									<div class="carousel-item">
										<img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${adto.aa_image5}" class="d-block w-100" alt="...">
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
										<!-- 기존 이미지 Hidden -->
										<c:if test="${not empty adto.aa_image1}">
											<input type="hidden" name="aa_imageHidden1"
												value="${adto.aa_image1}">
										</c:if>
										<c:if test="${not empty adto.aa_image2}">
											<input type="hidden" name="aa_imageHidden2"
												value="${adto.aa_image2}">
										</c:if>
										<c:if test="${not empty adto.aa_image3}">
											<input type="hidden" name="aa_imageHidden3"
												value="${adto.aa_image3}">
										</c:if>
										<c:if test="${not empty adto.aa_image4}">
											<input type="hidden" name="aa_imageHidden4"
												value="${adto.aa_image4}">
										</c:if>
										<c:if test="${not empty adto.aa_image5}">
											<input type="hidden" name="aa_imageHidden5"
												value="${adto.aa_image5}">
										</c:if>
										
										<!-- 수정 이미지 업로드 -->
										<input class="form-control" id="formFileMultiple-1"
											type="file" multiple accept="image/*" name="aa_image">
										<div id="passwordHelpBlock" class="form-text">
											수정시, 기존 이미지는 삭제되고 선택된 이미지들로 대체됩니다
										</div>
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
									li = document.createElement("li");
									file = files[i];
									fileInfo = "<div><strong>파일명:</strong> "
											+ file.name + "</div>";

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