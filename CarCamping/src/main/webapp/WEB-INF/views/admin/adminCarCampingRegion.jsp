<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminTop.jsp"%>
<%@ include file="left.jsp"%>   
<!-- Content Column Grid -->
<div class="col-md-8 themed-grid-col" style="padding-left: 20px;padding-right: 20px;">
	<div class="row">
		<figure class="text-center">
			<blockquote class="blockquote">
				<p>A well-known quote, contained in a blockquote element.</p>
			</blockquote>
			<figcaption class="blockquote-footer">
				Someone famous in <cite title="Source Title">Source Title</cite>
			</figcaption>
		</figure>
	</div>
	<div class="row" align="center">
		<p class="fw-bolder">차박 장소 목록</p>
	</div>
	<div class="row">
		<!-- 정렬&지역 드랍 버튼 -->
		<div class="col">
			<div class="dropdown">
				<button class="btn btn-outline-success dropdown-toggle" type="button"
					id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
					지역</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
					<li><button class="dropdown-item" type="button">서울|경기도</button></li>
					<li><button class="dropdown-item" type="button">강원도</button></li>
				</ul>
			</div>
			
		</div>

		<div class="col" align="right">
		<!-- 장소 등록 모달 버튼 -->
			<button type="button" 
					class="btn btn-outline-success"
					data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
						장소 등록
			</button>
		<!-- 장소 등록 모달 버튼 끝 -->
		</div>
	</div>
	<div class="row">
		&nbsp;
	</div>
	

	<!-- 장소 등록 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h5 class="modal-title" id="staticBackdropLabel">장소 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- 지역번호&장소 -->
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>서울/경기도</option>
									<option value="1">강원도</option>
									<option value="2">충청북도</option>
									<option value="3">충청남도</option>
								</select> <label for="floatingSelect">지역</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">장소명</label>
							</div>
						</div>
					</div>
					
				<!-- 일일대여요금 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">일일대여요금 (원단위로 숫자만)</label>
							</div>
						</div>
						
						
				<!-- 차량접근 -->
					<div class="row">
						<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck1">승용차</label>

  							<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck2">소형 트레일러</label>

  							<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck3">카라반</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck4">루프탑</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck5">캠핑카</label>
						</div>
						<div id="passwordHelpBlock" class="form-text">
  							접근 가능한 차량을 선택해 주세요
						</div>
					</div>
						
				<!-- 바닥종류 -->
						<div class="row">
							<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck11">맨흙</label>

  							<input type="checkbox" class="btn-check" id="btncheck12" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck12">자갈</label>

  							<input type="checkbox" class="btn-check" id="btncheck13" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck13">모래</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck14" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck14">데크</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck15" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck15">잔디</label>
							</div>
							<div id="passwordHelpBlock" class="form-text">
  								바닥 종류를 선택해 주세요
							</div>
						</div>

				<!-- 유무 체크 -->
						<div class="row">
							<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck6">화장실</label>

  							<input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck7">샤워실</label>

  							<input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck8">수도시설</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck9">주변상가</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck10" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck10">하천</label>
						</div>
							<div id="passwordHelpBlock" class="form-text">
  								해당 장소에 있는 것을 선택해 주세요
							</div>
						</div>
						
					</div>
				<!-- 장소 요약 설명 -->

					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput"
							placeholder="name@example.com"> <label
							for="floatingInput">장소 요약 설명 (30자 이내) </label>
					</div>
					
				<!-- 장소 세부설명 -->
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px"></textarea>
						<label for="floatingTextarea2">장소세부설명 (1000자 이내)</label>
					</div>
					
				<!-- 이미지 삽입 -->
					&nbsp;
					<div class="mb-3"> 
						 <input class="form-control" type="file" id="formFile">
						 <div id="passwordHelpBlock" class="form-text">
  								메인 이미지를 선택해주세요
						 </div>
					</div>

					<input class="form-control" id="formFileMultiple" type="file" multiple accept="image/*">
					<div id="passwordHelpBlock" class="form-text">
  								최소 2개 이미지를 선택해주세요 (최대 5개)
					</div>
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

				<!-- 버튼 영역 -->

					<div class="modal-footer">
						<button type="button" class="btn btn-outline-success"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-outline-success">등록</button>
					</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 장소 등록 모달 끝 -->

	<!-- 본문 -->
	<table class="table table-borderless">
  		<tr>
  			<td>
				<div class="card" style="width: 18rem;">
					<img src="Region1.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">장소명</h5>
						<p class="card-text">
					<div class="starpoint_wrap">
  						<div class="starpoint_box">
						   <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						   <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						   <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						   <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						   <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						   <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						   <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						   <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						   <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						   <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						   <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
						   <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
    						<span class="starpoint_bg">
    						</span>
  						</div>
					</div>
						(73개의 리뷰)
						<br>
							요약설명|조회수|좋아요수
						</p>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop-1">
							수정
						</button>
					</div>
				</div>
			</td>
		</tr>
	</table>
	
	<!-- 장소 수정 모달 -->
	<form class="row gy-2 gx-3 align-items-center">
	<div class="modal fade" id="staticBackdrop-1" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h5 class="modal-title" id="staticBackdropLabel">장소 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- 지역번호&장소 -->
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>서울/경기도</option>
									<option value="1">강원도</option>
									<option value="2">충청북도</option>
									<option value="3">충청남도</option>
								</select> <label for="floatingSelect">지역</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">장소명</label>
							</div>
						</div>
					</div>
					
				<!-- 일일대여요금 -->
						<div class="row">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com"> <label
									for="floatingInput">일일대여요금 (원단위로 숫자만)</label>
							</div>
						</div>
						
						
				<!-- 차량접근 -->
					<div class="row">
						<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck1">승용차</label>

  							<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck2">소형 트레일러</label>

  							<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck3">카라반</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck4">루프탑</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck5">캠핑카</label>
						</div>
						<div id="passwordHelpBlock" class="form-text">
  							접근 가능한 차량을 선택해 주세요
						</div>
					</div>
						
				<!-- 바닥종류 -->
						<div class="row">
							<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck11">맨흙</label>

  							<input type="checkbox" class="btn-check" id="btncheck12" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck12">자갈</label>

  							<input type="checkbox" class="btn-check" id="btncheck13" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck13">모래</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck14" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck14">데크</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck15" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck15">잔디</label>
							</div>
							<div id="passwordHelpBlock" class="form-text">
  								바닥 종류를 선택해 주세요
							</div>
						</div>

				<!-- 유무 체크 -->
						<div class="row">
							<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" align="center">
							<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck6">화장실</label>

  							<input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck7">샤워실</label>

  							<input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck8">수도시설</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck9">주변상가</label>
  							
  							<input type="checkbox" class="btn-check" id="btncheck10" autocomplete="off">
  							<label class="btn btn-outline-success" for="btncheck105">하천</label>
						</div>
							<div id="passwordHelpBlock" class="form-text">
  								해당 장소에 있는 것을 선택해 주세요
							</div>
						</div>
						
					</div>
				<!-- 장소 요약 설명 -->

					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput"
							placeholder="name@example.com"> <label
							for="floatingInput">장소 요약 설명 (30자 이내) </label>
					</div>
					
				<!-- 장소 세부설명 -->
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px"></textarea>
						<label for="floatingTextarea2">장소세부설명 (1000자 이내)</label>
					</div>
					
				<!-- 현재 이미지 캐러셀 -->
					&nbsp;
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="Region1.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="Region1.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="Region1.jpg" class="d-block w-100" alt="...">
							</div>
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

					<!-- 이미지 삽입 -->
					&nbsp;
					<input class="form-control" type="file" id="formFile">
					<div id="passwordHelpBlock" class="form-text">메인 이미지를 선택해주세요</div>

					<input class="form-control" id="formFileMultiple-1" type="file"
						multiple accept="image/*">
					<div id="passwordHelpBlock" class="form-text">최소 2개 이미지를
						선택해주세요 (최대 5개)</div>
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


					<!-- 인기장소 여부 -->
							<div class="row">&nbsp;</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="flexSwitchCheckDefault"> <label
									class="form-check-label" for="flexSwitchCheckDefault">
									인기장소 </label>
							</div>
							<!-- 버튼 영역 -->

							<div class="modal-footer">
								<button type="button" class="btn btn-outline-success"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-outline-success">수정</button>
							</div>
						</div>
					</div>
				</div>
	</form>
	<!-- 장소 수정 모달 끝 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>

<!-- End Content Coulmn Grid -->
<%@ include file="../bottom.jsp"%>