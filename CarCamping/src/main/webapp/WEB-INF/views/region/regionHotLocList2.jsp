
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="region_content-hs rounded-4 ">
	<ul class="list-group list-group-flush rounded-4 ">

		<li class="list-group-item fs-2 text-center"><button
				class="btn btn-outline-warning btn-lg" type="button" 
				style="-bs-btn-padding-x: 70px; - -bs-btn-padding-y: 15px;">
				<i class="bi bi-trophy-fill" width="40" height="40"
					fill="currentColor"></i> ${regionDTO.region_name} 차박지 더 많이 보기 <i
					class="bi bi-trophy-fill" width="40" height="40"
					fill="currentColor"></i>
			</button> <c:if test="${empty hotList_Region}">
				<li class="list-group-item position-relative"><img
					src="resources/images/sik.jpg"
					class="img-responsive rounded-circle"
					style="width: 107px; height: 107px;">
					<div class="position-absolute top-50 start-50 translate-middle">
						<a href="regionView.region">지도에서 마커를 클릭해주세요 ! </a>
					</div></li>
			</c:if> <c:forEach var="hl_region" items="${hotList_Region}">
				<li class="list-group-item position-relative"><img
					src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${hl_region.ccr_viewImage1}"
					class="img-responsive rounded-circle"
					style="width: 107px; height: 107px;">
					<div class="position-absolute top-50 start-50 translate-middle">
						<i class="bi bi-trophy-fill" width="40" height="40"></i>
						<a href="regionView.region?ccr_num=${hl_region.ccr_num}">${hl_region.ccr_name}</a>
					</div></li>

			</c:forEach>
	</ul>

</div>

