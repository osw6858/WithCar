<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="ko">
     <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ID찾기</title>
  
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'>
        <!-- Font Awesome -->
        <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
        <!-- Style -->
        <link href='css/contactUs.css' rel='stylesheet' type='text/css'>
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
                 <div class="col-md-9 text-center">
                    <h2 class="section-title">아이디 찾기</h2>
                    <p class="section-description">회원가입 시 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.</p>
                 </div>
                 <div class="col-md-8 col-md-offset-3">
                    <form id="contact" method="post" class="form" role="form" action="findID.login" enctype="multipart/form-data">
                     <div class="row">
                        <div class="col-md-6 form-group">
                           <input class="form-control" id="mem_userName" name="mem_userName" placeholder="이름" type="text" required />
                        </div>
                        </div>
                        <div class="row">
                        <div class="col-md-6 form-group">
                           <input class="form-control" id="mem_email" name="mem_email" placeholder="Email" type="email" required />
                        </div>
                     </div>
                     <br />
                     <div class="row">
                        <div class="col-md-12 form-group" style="padding-left: 90px; padding-right: 30px;">
                           <button class="btn btn-dark mb-3" type="submit" style="width: 150px; background:#091835; color: #fff;" >아이디 찾기</button>
                           <button class="btn btn-dark mb-3" type="submit" style="width: 150px; background:#091835; color: #fff;" >로그인</button>
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

     </body>
  </html>