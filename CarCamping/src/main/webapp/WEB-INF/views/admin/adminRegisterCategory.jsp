<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
	<div align="center">
		<form name="insertCategory" method="post" action="adminInsertCategory.admin" enctype="multipart/form-data" class="row g-3 needs-validation" novalidate>
		<table class="table table-sm">
			<tr>
				<td>
					<div class="form-floating">
					<select name="category" class="form-select" id="floatingSelect">
						<option value="brand">브랜드</option>
						<option value="product">상품</option>
					</select>
					<label for="floatingSelect">범주</label>
					</div>
				</td>
				<td>
					<div class="form-floating mb-3">
					<input type="text" name="name" class="form-control" id="validationCustom01" maxlength="15" placeholder="1" required>
					<label for="validationCustom01">카테고리명</label>
					</div>
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
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