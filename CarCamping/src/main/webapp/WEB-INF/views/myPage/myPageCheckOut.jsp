<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
	
	
	<body>	
  		<!-- START SECTION -->
  		<div class="section" >
  			<div class="container">
  				<div class="row">
  					<div class="col-md-12 text-center">
  						<h2 class="section-title">주문 완료</h2><!-- 프론트 수정 예정 -->
  						<p class="section-description">주문번호를 확인해 주세요!</p>
  						<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 1234567) %></c:set>
								<h2>주문번호 :	${ran}</h2>
								<button class="btn btn-dark mb-3" onClick="location.href='checkOut.myPage'" style="width: 756px; background:#091835;">다른상품 구매하러 가기</button>
								<button class="btn btn-dark mb-3" onClick="location.href='index.do'" style="width: 756px; background:#091835;">홈으로 가기</button>
							</div>
						</div>
  					</div>
  				</div><!--/.row-->
  			
  		<!-- jQuery -->
  		<script src="//code.jquery.com/jquery.js"></script>
  		<!-- Bootstrap JavaScript -->
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  		<script>
  			document.getElementById("message").scrollTop = document.getElementById("message").scrollHeight;
  		</script>
  	</body>

<%@include file="../bottom.jsp"%>
