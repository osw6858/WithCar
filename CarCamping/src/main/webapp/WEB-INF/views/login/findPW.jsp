<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="ko">
  	<head>
  		<meta charset="utf-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>비밀번호 찾기</title>
  
  		<!-- Bootstrap CSS -->
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  		<!-- Google Fonts -->
  		<link href='https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'>
  		<!-- Font Awesome -->
  		<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
  		<!-- Style -->
  		<link href='css/contactUs.css' rel='stylesheet' type='text/css'>

  	</head>
  	<body>	

  		<!-- START SECTION -->
  		<div class="section">
  			<div class="container">
  				<div class="row">
  					<div class="col-md-9 text-center">
  						<h2 class="section-title">비밀번호 찾기</h2>
  						<p class="section-description">아이디와 이메일이 맞지 않을 경우, 이메일이 발송되지 않습니다<br>아이디와 이메일을 확인해주세요</p>
  						<p>이메일에서 임시 비밀번호를 확인하고 내 정보 수정에서 비밀번호를 변경해주세요</p>
  					</div>
  					<div class="col-md-8 col-md-offset-3">
  						<form id="contact" name="f" method="post" class="form" role="form">
							<div class="row">
								<div class="col-md-6 form-group">
									<input class="form-control" id="mem_id" name="mem_id" placeholder="아이디" type="text" required />
								</div>
								</div>
								<div class="row">
								<div class="col-md-6 form-group">
									<input class="form-control" id="mem_email" name="mem_email" placeholder="Email" type="email" required />
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12 form-group">
									<button class="btn btn-dark mb-3" type="submit" style="width: 100%; background:#091835; color: #fff;">임시 비밀번호 발급</button>
								</div>
							</div>
						</form>
  					</div>
  				</div><!--/.row-->
  			</div><!--/.container-->
  		</div>
  		<!--/.section -->


  
  		<!-- jQuery -->
  		<script src="//code.jquery.com/jquery.js"></script>
  		<!-- Bootstrap JavaScript -->
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  		 <script>
  		
  		</script> 
  	</body>
  </html>