<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  	<head>
  		<meta charset="UTF-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1" />
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<title>접수한 문의사항</title>
  
  		<!-- Bootstrap CSS -->
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  		<!-- Google Fonts -->
  		<link href='https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'>
  		<!-- Font Awesome -->
  		<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
  		<!-- Style -->
  		<link href='/resources/contactUs.css' rel='stylesheet' type='text/css'>
 		<style>
 			textarea {
    			resize: none;
  			}
 		</style>
	  		
  	</head>
  	<body>	

  		<!-- START SECTION -->
  		<div class="section">
  			<div class="container">
  				<div class="row">
  					<div class="col-md-12 text-center">
  						<h2 class="section-title">Contact Us</h2>
  						<p class="section-description">접수한 문의사항 </p>
  					</div>
  					<div class="col-md-8 col-md-offset-2">
  						<form id="contact" name="contact" action="myPageContactUs.myPage" method="post" class="form" role="form" >
  							<div class="row">
								<div class="col-md-6 form-group">
							<p>제목</p> <input class="form-control" id="question_title" type="text" value="${getQuestion.question_title}" />
							</div>
							<div class="col-md-6 form-group">
								<p>문의일</p> <input class="form-control" type="text" id="question_sysdate" value="${getQuestion.question_sysdate}" />
								</div>
							</div>
							<p>문의내용</p>	
							<textarea class="form-control" id="question_content" rows="5" >${getQuestion.question_content}</textarea>
							<br />
							<div class="row">
							
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
  			document.getElementById("message").scrollTop = document.getElementById("message").scrollHeight;
  		</script>
  	</body>
  </html>