<link rel="stylesheet" href="assets/css/map_region.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script> -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>

 <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>


<script>
	function popup() {
		var url = "regionReviewView.region";
		var name = "popup test";
		var option = "width = 700, height = 1000, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	
	function changeHotRegion(region_num, mem_id){
		console.log(region_num);
		console.log(mem_id);
		var send_region_num = region_num;
		var send_mem_id = mem_id;
		var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:40%;left:45%; text-align:center;"> ';
		loadingHtml += '<div class="loading_box"><img src="<c:url value="/resources/images/carLoading.gif"/>"  /></div></div>';
		$('body').fadeTo("fast", 1).append(loadingHtml);
		$.ajax({
			url: "changeHotRegion.region", //컨트롤러 맵핑
            type: "GET",
            data: { //사용자가 데이터를 정의한다	
            	"regionNum" : region_num,
            	"memId" : mem_id
            },
            contentType: "application/json",
            success: function (result) {
            	$('body').fadeTo("slow", 1).find('#loading').remove();
		   			const ultag = document.getElementById('hotRegion_list');//ul - id : hotRegion_list 비우기
		   		 	const items = ultag.getElementsByTagName('li');   		
		   			 while (ultag.firstChild) {                   
		   				ultag.removeChild(ultag.firstChild);                
		   			}
		   		 $("#hotRegion_list").append(result);
		   		
		   		
           	},
            error: function() {
            	$('body').fadeTo("slow", 1).find('#loading').remove();
                alert("에러 발생");
            }

            });
		
		
		
	}
</script>

<div id="ccm-doc-hs" class="ccm-t7-hs">
	<div id="ccm-bd-hs">
		<div id="ccm-main-hs">
			<div class="ccm-b-hs">
				<div class="ccm-gc-hs">
					<div class="ccm-u-hs first">
						<div class="map_content-hs">
							<div id="map" class="border rounded-4 border-4"
								style="width: 100%; height: 600px;">
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a12f9fc709978bc3b122b007b64e2afd"></script>
								<script>
									//맵생성
									var container = document
											.getElementById('map');
									var options = {
										center : new kakao.maps.LatLng(36, 128),
										level : 13,
										draggable : false,
										disableDoubleClick : true,
										disableDoubleClickZoom : true
									};
									var map = new kakao.maps.Map(container,
											options);

									//좌표
									function Position(x, y, regionName) {
										this.x = x;
										this.y = y;
										this.regionName= regionName;

									}
									var PositionArr = [
											new Position(37.540705, 126.956764,"서울&경기도"),//서울=1
											new Position( 37.58682247087561, 128.26747425295994    ,"강원도"),//강원도 2 
											new Position(36.628503, 127.929344,"충청북도"),//경상북도 5 
											new Position(36.557229, 126.779757,"충청남도"),//경상남도 6 
											new Position(36.248647, 128.664734,"경상북도"),//충청북도 3
											new Position(35.259787, 128.664734,"경상남도"),//충청남도 4 
											new Position(35.716705, 127.144185,"전라북도"),//전라북도 7 
											new Position(34.819400, 126.893113,"전라남도"),//전라남도 8
											new Position(33.364805, 126.542671,"제주도") //제주도=9
									];

									//이미지
									//var imageSrc = 'mapMarkerImage/', //이미지 
									imageSize = new kakao.maps.Size(64, 69),
											imageOption = {
												offset : new kakao.maps.Point(
														27, 69)
											};

									//var markerImage = new kakao.maps.MarkerImage(
									//		imageSrc, imageSize, imageOption);

									//마커
									for (var i = 0; i < PositionArr.length; i++) {
										var markerPosition = new kakao.maps.LatLng(
												PositionArr[i].x,
												PositionArr[i].y);
										var imageSrc = "resources/images/mapMarkerImage/"
												+ (i + 1) + ".png"
										var markerImage = new kakao.maps.MarkerImage(
												imageSrc, imageSize,
												imageOption);
										addMarker(i);
									}
									//마커-클릭 이벤트 추가
									function addMarker(i) {
										var marker = new kakao.maps.Marker({
											map : map,
											position : markerPosition,
											image : markerImage,
											clickable : true
										});
										var content = '<div id="ifw" class="btn btn-primary" style="padding:5px;"><span>'+PositionArr[i].regionName+'</span></div>';
										//PositionArr[i].regionName
								
										var customOverlay = new kakao.maps.CustomOverlay(
												{	map : map,
													clickable : true,
													content : content,
													position :markerPosition,
												    xAnchor: 0.3,
												    yAnchor: 3
												});
										customOverlay.setMap(map);
										customOverlay.setVisible(false);
													kakao.maps.event.addListener(marker,'click',function() {//해당지역 인기글 변경
														document.hotRegionLocation.region_num.value = i + 1
														document.hotRegionLocation.mem_id = '${sessionScope.id}'
														//document.hotRegionLocation.submit()
														var region_num = i+1;
														var mem_id = '${sessionScope.id}';
														changeHotRegion(region_num,mem_id);
														
														});
											kakao.maps.event.addListener(marker,'mouseover', function() {
												customOverlay.setVisible(true);
											});
											
											  kakao.maps.event.addListener(marker, 'mouseout', function() { 
											 customOverlay.setVisible(false);
										});
									}
								</script> 
							</div>
						</div>
					</div>
					<form name="hotRegionLocation" action="regionHotLocList.region" method="post">
						<input type="hidden" name="region_num"/>
						<input type="hidden" name="mem_id"/>
					</form>
								
					<!--지역별 HOT리뷰글  -->
					<div class="ccm-u-hs border rounded-4 border-4"
						style="height: 600px;">