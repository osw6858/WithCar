<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<body>
<div class="container" >
    <div class="row"  >
      <div class=" col-lg-5 mx-auto" style="float: none; margin:100 auto;">
      
        <div class="card card-signin my-5">
          <div class="card-body">
<a href="index.do" class="logo" style="height: 90px;"><img src="resources/images/withcar.png" style="width: 170px;height: 70px;"/></a>
            <form class="form-signin" method="post" action="login.login">
              <div class="form-label-group">
            <nobr>
         <c:if test="${empty cookie.saveId}">         
               <input  type="checkbox" name="saveId">
         </c:if>
         <c:if test="${not empty cookie.saveId}">
               <input type="checkbox" name="saveId" checked>
         </c:if>               
               <font face="굴림" size="2">아이디 기억하기</font>
            </nobr>
              <nobr>
         <c:if test="${empty cookie.loginCookie}">         
               <input  type="checkbox" name="loginCookie">
         </c:if>
         <c:if test="${not empty cookie.loginCookie}">
               <input  type="checkbox" name="loginCookie" checked>
         </c:if>               
               <font face="굴림" size="2">자동로그인하기</font>
            </nobr>
            
              <c:if test="${empty cookie.saveId}">
                <input type="text" id="id" name="mem_id" class="form-control" placeholder="ID" required autofocus>
                 </c:if></div>
            <c:if test="${not empty cookie.saveId}">
            <input type="text" id="id" name="mem_id" class="form-control" tabindex="1" value="${cookie.saveId.value}">
         </c:if>            
         <div class="row">
         <p>
         <p>
         </div>
         
         
              <div class="form-label-group">
                <input type="password" id="pwd" name="mem_password" class="form-control" placeholder="Password" required>
              </div>
              
              <hr>
              
              <div class="form-label-group">
              <c:if test="${check == 1 }">
                <label>${message}</label>
              </c:if>
              </div>
			  <a href="javascript:void(0)" onclick="findID()">아이디 찾기</a>/ 
              <a href="javascript:void(0)" onclick="findPW()">비밀번호 찾기</a>
              <button class="btn btn-lg btn-default btn-block text-uppercase" style="background:#091835;" type="submit"><font color="white">로그인</font></button>
              <hr class="my-4">
            
              <button class="btn btn-lg btn-default btn-block text-uppercase" style="background:#97abbd;" onclick="location='sign.login'"><font color="white">회원가입</font></button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
  
  </script>
  <script type="text/javascript">
  function findID(){
      var url="findID.login";
      
      window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
   }
  
  function findPW(){
     var url="findPW.login";
     
     window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
  }
  </script>