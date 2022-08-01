<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerProduct" method="post" action="adminRegisterProduct.admin" enctype="multipart/form-data" class="row g-3 needs-validation" novalidate>
		<table class="table table-sm">
			<tr>
				<td>
					<div class="form-floating">
						<select name="brand_num" class="form-select" id="floatingSelect1">
							<c:forEach items="${adminListBrand}" var="dto">
								<option value="${dto.brand_num}">${dto.brand_name}</option>
							</c:forEach>
						</select>
						<label for="floatingSelect1">브랜드</label>
					</div>
				</td>
				<td>
					<div class="form-floating">
						<select name="pc_num" class="form-select" id="floatingSelect2">
							<c:forEach items="${adminListProductCategory}" var="dto">
								<option value="${dto.pc_num}">${dto.pc_name}</option>
							</c:forEach>
						</select>
						<label for="floatingSelect2">분류</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="prod_name" class="form-control" id="validationCustom01" maxlength="20" placeholder="1" required>
						<label for="validationCustom01">용품명</label>
						<div id="validationCustom01" class="form-text">예) 벤딕트 차박 텐트 쉘터 도킹 </div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="number" name="prod_price" class="form-control" id="validationCustom02" min="0" placeholder="1" required>
						<label for="validationCustom02">일일 대여 요금(원)</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="prod_summary" class="form-control" id="validationCustom03" maxlength="20" placeholder="1" required>
						<label for="validationCustom03">용품 요약 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<textarea name="prod_viewContent" style="resize: none;" class="form-control" id="validationCustom04" maxlength="1000" placeholder="1" required></textarea>
						<label for="validationCustom04">용품 상세 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
						<input class="form-control" id="formFileMultiple" type="file"
							name="prod_viewImage" multiple accept="image/*" class="form-control" id="validationCustom05" required>
						<div id="validationCustom05" class="form-text">최대  5개 이미지 업로드 가능합니다</div>
						<ul id="file-list">
							<li class="no-items"></li>
						</ul>

						<script>
							var filesUpload = document
									.getElementById("formFileMultiple"), fileList = document
									.getElementById("file-list");

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
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button class="btn btn-primary" type="reset">취소</button>
					<button class="btn btn-primary" type="submit">등록</button>
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