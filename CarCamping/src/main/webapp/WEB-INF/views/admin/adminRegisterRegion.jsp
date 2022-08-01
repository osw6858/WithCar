<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div align="center">
		<form name="registerRegion" method="post" action="adminRegisterRegion.admin" enctype="multipart/form-data"
		class="row g-3 needs-validation" novalidate>
		<table class="table table-sm">
			<tr>
				<td>
					<div class="form-floating">
					<select name="region_num" class="form-select" id="floatingSelect">
						<c:forEach items="${adminListRegion}" var="dto">
							<option value="${dto.region_num}">${dto.region_name}</option>
						</c:forEach>
					</select>
					<label for="floatingSelect">지역</label>
					</div>
				</td>
				<td>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="validationCustom01" name="ccr_name" maxlength="15" placeholder="1" required>
						<label for="validationCustom01">장소명</label>
						<div id="validationCustom01" class="form-text">예) 양양 송전 해수욕장</div>
					</div>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="number" class="form-control" name="ccr_pricePerDay" id="validationCustom02" min="0" placeholder="1" required>
						<label for="validationCustom02">일일사용요금(원)</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="ccr_car1" class="btn-check" id="btn-check1" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check1">승용차</label>
					<input type="checkbox" name="ccr_car2" class="btn-check" id="btn-check2" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check2">소형 트레일러</label>
					<input type="checkbox" name="ccr_car3" class="btn-check" id="btn-check3" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check3">카라반</label>
					<input type="checkbox" name="ccr_car4" class="btn-check" id="btn-check4" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check4">루프탑</label>
					<input type="checkbox" name="ccr_car5" class="btn-check" id="btn-check5" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check5">캠핑카</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="ccr_ground1" class="btn-check" id="btn-check6" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check6">맨흙</label>
					<input type="checkbox" name="ccr_ground2" class="btn-check" id="btn-check7" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check7">자갈</label>
					<input type="checkbox" name="ccr_ground3" class="btn-check" id="btn-check8" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check8">모래</label>
					<input type="checkbox" name="ccr_ground4" class="btn-check" id="btn-check9" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check9">데크</label>
					<input type="checkbox" name="ccr_ground5" class="btn-check" id="btn-check10" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check10">잔디</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="ccr_amenity1" class="btn-check" id="btn-check11" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check11">화장실</label>
					<input type="checkbox" name="ccr_amenity2" class="btn-check" id="btn-check12" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check12">샤워실</label>
					<input type="checkbox" name="ccr_amenity3" class="btn-check" id="btn-check13" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check13">수도시설</label>
					<input type="checkbox" name="ccr_amenity4" class="btn-check" id="btn-check14" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check14">주변상가</label>
					<input type="checkbox" name="ccr_amenity5" class="btn-check" id="btn-check15" autocomplete="off">
					<label class="btn btn-outline-primary" for="btn-check15">하천</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<input type="text" name="ccr_summary" class="form-control" id="validationCustom03" maxlength="20" placeholder="1" required>
						<label for="validationCustom03">장소 요약 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="form-floating mb-3">
						<textarea name="ccr_content" style="resize: none;" class="form-control" id="validationCustom04" maxlength="1000" placeholder="1" required></textarea>
						<label for="validationCustom04">장소 상세 설명</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					
					<input class="form-control" id="formFileMultiple" type="file" multiple accept="image/*" name="ccr_viewImage" class="form-control" id="validationCustom05" required>
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
								fileInfo = "<div><strong>파일명:</strong> "+ file.name + "</div>";
						
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