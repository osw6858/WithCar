<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../top.jsp" %>
<c:set var="mem_num" value="${mem_num}" />
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용품 리뷰 쓰기</title>
<link rel="stylesheet" href="resources/css/rating2.css">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" defer></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


</head>

<!-- 유효성 검사 js -->
<script type="text/javascript">
document.getElementById("rp_content").scrollTop = document.getElementById("rp_content").scrollHeight;


</script>
<!-- 기타 js -->
<script type="text/javascript">

var isRun = false; // ajax 동시 호출 막기(ajax가 호출되는 동안 버튼이 클릭돼도 중복으로 실행되는것을 막기위함)

function SelectCateEvent(){
	var selectedProdCateNum = $("#review_prodCate option:selected").val(); // pc_num 저장
	var selectedBrandCateNum = $("#review_brandCate option:selected").val(); // brand_num 저장
	
	if((selectedProdCateNum!=0)&&(selectedBrandCateNum!=0)){
		 if(isRun == true) {
		        return;
		    }
		 var loadingHtml = '<div id="loading" style="z-index: 1005;position: absolute; top:40%;left:45%; text-align:center;"> ';
		    loadingHtml += '<div class="loading_box"><img src="<c:url value="/resources/images/carLoading.gif"/>"  /></div></div>'; 
		   $('body').fadeTo( "fast", 1 ).append(loadingHtml);
		   
		   $.ajax({
				url : "prod_list.review",//컨트롤러 맵핑  
				type : "post",
				data :  {
					pc_num : selectedProdCateNum,
					brand_num : selectedBrandCateNum
				},
				success : function(list){
					 $('body').fadeTo( "slow", 1 ).find('#loading').remove();
					$('#review_product').empty();
					//alert(listsize);
					$('#review_product').append(list);
					//$('#review_ccr').select2();
					alert("상품이 변경됐습니다 ! 리뷰하실 용품을 다시 골라주세요 !");
					$('#review_product').select2();
					isRun  = false;
				},
				error :   function(request, status, error){
					$('body').fadeTo("slow", 1).find('#loading').remove();
		            console.log("상품 리스트를 불러오는 중 오류 발생 !");
		        }
			});
	}
}
</script>

<script>
$(document).ready(function()// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#input_file").on("change", fileCheck);
		});

// 첨부파일로직
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

var fileCount = 0;// 파일 현재 필드 숫자 totalCount랑 비교값
var totalCount = 5;// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var fileNum = 0;// 파일 고유넘버
var content_files = new Array();// 첨부파일 배열

function fileCheck(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);  // 파일 배열 담기
    if (fileCount + filesArr.length > totalCount) {   // 파일 개수 확인 및 제한
      $.alert('이미지 파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#reviewImageBox').append(
           		'<div id="file' + fileNum + '" class="imagefile" onclick="fileDelete(\'file' + fileNum + '\')">'
           		+ '<p style="font-size:12px">' + f.name + '💣</p>' 
           		+ '<img src="'+e.target.result+'"style="width: 25%; display: inline;"/>'
           		+ '</div>'
            );
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }
// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}

//폼 submit 로직
	function registerAction(){
	var form = $("form")[0];        
 	var formData = new FormData(form);
	for (var x = 0; x < content_files.length; x++) { 
		if(!content_files[x].is_delete){ // 삭제 안한것만 담아 준다
			 formData.append("review_Image", content_files[x]);/*//article_file  */
		}
	}

	 var goodsReview = document.dataForm;
	 var fileList = document.getElementById("reviewImageBox");
	 
		if (goodsReview.rp_title.value.length >= 20) {
            alert("리뷰 제목은 20자 까지 입력 가능합니다 😅");
            goodsReview.rp_summaryContent.focus();
            return false;
         }
      if (goodsReview.rp_title.value.length < 10) {
            alert("리뷰 제목을 10자 이상 입력해주세요");
            goodsReview.rp_summaryContent.focus();
            return false;
         }
      if (goodsReview.rp_summaryContent.value.length >= 20) {
            alert("리뷰 한줄 리뷰는 20자 까지 입력 가능합니다 😅");
            goodsReview.rp_summaryContent.focus();
            return false;
         }
      if (goodsReview.rp_summaryContent.value.length < 10) {
            alert("리뷰 한줄 리뷰를 10자 이상 입력해주세요");
            goodsReview.rp_summaryContent.focus();
            return false;
         }
      if (goodsReview.rp_content.value.length < 30) {
         alert("리뷰 내용을 30자 이상 입력해주세요 😅");
         goodsReview.rp_content.focus();
         return false;
      }
      if (goodsReview.rp_content.value.length > 1000) {
         alert("리뷰 내용은 1000자 까지 입력 가능합니다😅");
         goodsReview.rp_content.focus();
         return false;
      }
      if(document.getElementsByClassName('imagefile').length==0){
         alert("이미지 파일을 한 개 이상 첨부해주세요 😅");
         return false;
      } 
      if (!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
          // 취소(아니오) 버튼 클릭 시 이벤트
          	isRun=false;
             return false;
              } else {
          // 확인(예) 버튼 클릭 시 이벤트
            $("#submitButton").attr("disabled",true);
          	var uploadingHtml = '<div id="uploading" style="z-index: 1005;position: absolute; top:20%;left:30%; text-align:center;"> ';
               uploadingHtml += '<div class="uoloading_box"><img src="<c:url value="/resources/images/uploadLoading.gif"/>"  /></div></div>';
               $('body').fadeTo("fast", 1).append(uploadingHtml);

               $.ajax({
                  type : "POST",
                  enctype : "multipart/form-data",
                  url : "goodsReview_upload.review",
                  data : formData,
                  processData : false,
                  contentType : false,
                  success : function(data) {
                     if (data == "good") {
                        $('body').fadeTo("slow", 1).find('#uploading').remove();
                        alert("리뷰 업로드 성공");
                        location.href = "goProduct.product";
                   		 $("#submitButton").attr("disabled",false);
                        isRun=false;
                       
                     } else{
                    	 $("#submitButton").attr("disabled",false);
                    	 $('body').fadeTo("slow", 1).find('#uploading').remove();
                        alert("서버내 오류 또는 게시글의 내용이 너무 깁니다. 잠시후 시도 하시거나 내용을 변경해주세요");
                     }
                  },
                  error : function(xhr, status, error) {
                	  
                 	 $("#submitButton").attr("disabled",false);
                     $('body').fadeTo("slow", 1).find('#uploading').remove();
                     alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
                     return false;
                  }
               });
            }
		return false;
	}
</script>

<style>
.select2-container .select2-selection--single .select2-selection__rendered {
	padding-top: 2.5px;
}
.select2-container .select2-selection--single {
    height: 35px;
}
#d1>div{
	text-align : center;
}
#d1>label{
margin-right : 0px;
}
</style>

<form name="dataForm" id="dataForm" onsubmit="return registerAction()">
  <input type="hidden" name="memberDTO.mem_num" value="${mem_num}"/>
  <div class="container">
  		<div class="row">
  			<div class="col-md-12 text-center">
  				<h2 class="section-title">용품 리뷰 쓰기</h2>
  				<div id= "myform" >
             	<fieldset name= "review_regionScore">
      		 		<input type="radio" name="rp_score" value="5" id="rate1"><label for="rate1">⭐</label>
       		 		<input type="radio" name="rp_score" value="4" id="rate2"><label for="rate2">⭐</label>
       		 		<input type="radio" name="rp_score" value="3" id="rate3"><label for="rate3">⭐</label>
       		 		<input type="radio" name="rp_score" value="2" id="rate4"><label for="rate4">⭐</label>
      		 		<input type="radio" name="rp_score" value="1" id="rate5"><label for="rate5">⭐</label>
   			 		</fieldset>
   			 </div> 
  			</div>
        <div class="col-md-8 col-md-offset-2">
        	<div id="d1" style="display: flex; margin-top:10px">
        	<div>
        	<label for="review_prodCate" style="padding-top: 9px;">[카테고리]</label>
           		<select class="form-control" id="review_prodCate" name="review_prodCate" onchange="SelectCateEvent();" required style="width:187px;">
           		<option value="" selected disabled style="text-align:center;">카테고리 선택</option>
				<c:forEach var="prodCate" items="${prodCateList }">
					<option value="${prodCate.pc_num }">${prodCate.pc_name }</option>
				</c:forEach>
           		</select>	
           	</div>
           	<div>
           	<label for="review_brandCate" style="padding-top: 9px;">[브랜드]</label>
           		<!-- <select class="form-control" name="carCampingRegionDTO.ccr_num"  id="review_ccr" required  style="width:187px;">-->
           		 <select class="form-control" name="review_brandCate"  id="review_brandCate" onchange="SelectCateEvent();" required  style="width:187px;">
           			<option value="" selected disabled style="text-align:center;">브랜드 선택</option>
           			<c:forEach var="brandCate" items="${brandCateList }">
					<option value="${brandCate.brand_num }">${brandCate.brand_name }</option>
				</c:forEach>
           		</select>
        	</div>
        	<div>
        		 	<label for="review_product" style="padding-top: 9px;">[용품]</label>
           		<select class="form-control" name="productDTO.prod_num"  id="review_product" required  style="width:376px;">
           			<option value="" selected disabled style="text-align:center;">[ 카테고리와 브랜드 모두 선택해주세요 ! ]</option>
           		</select>
        	</div>
        	</div>
        	<br>
        	<label for="rp_title">제목</label>
           		<input class="form-control" id="rp_title" name="rp_title" type="text" required />
         		<br>
         	<label for="rp_summaryContent">용품 한줄리뷰</label>
            	<input class="form-control" id="rp_summaryContent" name="rp_summaryContent" placeholder="ex)이거 좀 예쁜데...?" type="text" required />
         		<br>
		 	<label for="rp_content">리뷰 상세</label>
            	<textarea class="form-control" id="rp_content" name="rp_content" placeholder="리뷰 상세" rows="18" required  style="resize:none;"></textarea>
       	 		<br>
       	 	<div style="text-align: center;">
	  		<button class="btn btn-warning mb-3" type="submit" style="margin-right: 60px;" id="submitButton">리뷰 작성</button>
 			<button class="btn btn-danger mb-3" type="reset">취소</button>
			</div>	
			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">이미지 파일 추가</button>
  			<input id="input_file" multiple="multiple" type="file" style="display:none;" accept="image/*">
  			<span style="font-size:10px; color: gray;">※이미지 파일은 최대 5개까지 등록이 가능합니다.</span>
  			<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
			<span>이미지 파일</span>
			<br/>
			<div id="reviewImageBox"  style="overflow-x:hidden; width:100%; height:200px;"><!-- //articlefileChange -->
			</div>
	</div>
      	</div>
   </div>
</div>

</form>
<script>
$(document).ready(function() {
    $('#review_prodCate').select2();
    $('#review_brandCate').select2();
    $('#review_product').select2();
});
</script>

<script type="text/javascript">
	var pc_num = '${pc_num}';
	var brand_num = '${brand_num}';
	var prod_num = ${requestScope.prod_num};
	var prod_name ='${prod_name}';
	if(prod_num != null){
		var prodCateSelect = document.getElementById("review_prodCate")
		var brandCateSelect = document.getElementById("review_brandCate")
		var prodSelect = document.getElementById("review_product")
		//카테고리
		for(var i=0; i<prodCateSelect.children.length; i++) {
			prodCateSelect.children[i].setAttribute('disabled', 'true')
			if(prodCateSelect.children[i].value === pc_num) {
				prodCateSelect.children[i].setAttribute('disabled', 'false')
				prodCateSelect.children[i].setAttribute('selected', 'true')
			}	
		}
		for(var i=0; i<brandCateSelect.children.length; i++) {
			brandCateSelect.children[i].setAttribute('disabled', 'true')
			if(brandCateSelect.children[i].value === brand_num) {	
				brandCateSelect.children[i].setAttribute('disabled', 'false')
				brandCateSelect.children[i].setAttribute('selected', 'true')
			}
		}
		var prod_option = new Option(prod_name,prod_num)
		prodSelect.append(prod_option)
		prod_option.selected=true
	}
	
	
</script>
<%@ include file="../bottom.jsp"%>			