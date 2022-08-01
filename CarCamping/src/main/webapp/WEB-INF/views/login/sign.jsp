<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<script type="text/javascript">
var right = 0;
function regChk(){
   var signCheck = document.signCheck;
   
   if(signCheck.agree.checked==""){
         alert("약관에 동의해주시기 바랍니다.");
         return false;
      }
   if(signCheck.idDuplication.value != "idCheck"){
	      alert("아이디 중복체크를 해주세요.");
	      return false;
	           }
   if(signCheck.emailDuplication.value != "emailCheck"){
	         alert("이메일 중복체크를 해주세요.");
	         return false;
	            }
   if($("#emailDoubleChk").val() == false){
	   alert("인증번호가 일치하지 않습니다!");
	   return false;
   }
   var mem_password = document.signCheck.mem_password.value;
   var num = mem_password.search(/[0-9]/g);
   var eng = mem_password.search(/[a-z]/ig);
   var spe = mem_password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
   if(mem_password.length < 6 || mem_password.length > 20){
      alert("비밀번호를 6자리 ~ 20자리 이내로 입력해주세요.");
       return false;
    }else if(mem_password.search(/\s/) != -1){
      alert("비밀번호는 공백 없이 입력해 주세요.");
      signCheck.mem_password.focus();
      return false;   
    }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
     alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해 주세요.");
     signCheck.mem_password.focus();
     return false;
    }
   if(right==0){
       alert("비밀번호가 동일하지 않습니다.");
       signCheck.mem_password.focus();
       return false;
    }
   var nameRegExp = /^[가-힣|a-zA-Z]+$/;
   var mem_userName = signCheck.mem_userName.value;
   if (!nameRegExp.test(mem_userName)){
        alert("이름이 올바르지 않습니다.");
        signCheck.mem_userName.focus();
        return false;
  }

    if(signCheck.nickDuplication.value != "nickCheck"){
      alert("닉네임 중복체크를 해주세요.");
      return false;
    }
      var fileName = $("#mem_image").val();           
      var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
      if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
         alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");   
         signCheck.mem_image.focus();
         return false;
      }
 
   var telRegExp = /^01+[016789]+[0-9]{7,8}$/;
   var mem_phone = signCheck.mem_phone.value;
   if(!telRegExp.test(mem_phone)){
          alert("전화번호 형식이 올바르지 않습니다.");
          signCheck.mem_phone.value ="";
          signCheck.mem_phone.focus();
          return false;
    } 
   var birthRegExp = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
   var mem_birthday = signCheck.mem_birthday.value;
   if(!birthRegExp.test(mem_birthday)){
      alert("생일 형식에 맞게 입력해 주세요.");
         signCheck.mem_birthday.value ="";
         signCheck.mem_birthday.focus();
         return false; 
      }
   
   if (signCheck.mem_summary.value==""){
		alert("자기소개 요약을 입력하셔야 합니다.")
		signCheck.mem_summary.focus() 
		return false;
	}
  if (signCheck.mem_introduce.value==""){
		alert("자기소개를 입력하셔야 합니다.")
		signCheck.mem_introduce.focus() 
		return false;
	}
          document.signCheck.submit()
}       
           </script>
           
<!-- 아이디체크 -->
           <script>
           function inputIdChk(){
              var signCheck = document.signCheck;
              var CheckId = document.signCheck.CheckId;
              document.signCheck.idDuplication.value="idUncheck";
              CheckId.disabled=false;
              CheckId.style.opaclty=1;
              CheckId.style.cursor= "pointer";        
           } 
           function fn_CheckId(){
           var signCheck = document.signCheck;
           var mem_id = signCheck.mem_id.value;
              var regx = /^[a-zA-Z0-9]*$/;
              if(!mem_id){
                alert("아이디를 입력해주세요");
              $("#mem_id").focus();
              return false;
                 }
            if (!regx.test(mem_id)){
               alert("아이디는 영어, 숫자만 입력가능합니다.");
               document.signCheck.mem_id.focus();
               return false;
                    }   
                 window.open("checkId.login?mem_id="+mem_id,"","width=500,height=300");
              }
       
           
           </script>
           
 <!-- 이메일 체크 -->        
          <script>
           function inputEmailChk(){
              var signCheck = document.signCheck;
              var CheckEmail = document.signCheck.CheckEmail;
              document.signCheck.emailDuplication.value="emailUncheck";
              CheckEmail.disabled=false;
              CheckEmail.style.opaclty=1;
              CheckEmail.style.cursor= "pointer";        
           } 
           function fn_CheckEmail(){
              var signCheck = document.signCheck;
              var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
              var mem_email = signCheck.mem_email.value;
               if(!mem_email){
                   alert("이메일을 입력해주세요");
                 $("#mem_email").focus();
                 return false;
               }
    
               if(!email_rule.test(mem_email)){
                   alert("이메일을 형식에 맞게 입력해주세요.");
                 return false;
               }
                 window.open("checkEmail.login?mem_email="+mem_email,"","width=500,height=300");
              }
           
           
           </script>             
           
 <!-- 닉네임 체크 -->  
               <script>
           function inputNickChk(){
              var signCheck = document.signCheck;
              var CheckNick = document.signCheck.CheckNick;
              document.signCheck.nickDuplication.value="nickUncheck";
              CheckNick.disabled=false;
              CheckNick.style.opaclty=1;
              CheckNick.style.cursor= "pointer";        
           } 
           function fn_CheckNick(){
              var signCheck = document.signCheck;
              var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
              var mem_nickName = signCheck.mem_nickName.value;
              if(mem_nickName.length==0||mem_nickName==""){
                 alert("닉네임을 입력해 주세요.");
                 signCheck.mem_nickName.focus();
                 return false;
              }
              if( regExp.test(mem_nickName) ){
                 alert("특수문자는 입력하실수 없습니다.");
                 return false;
              }
                 window.open("checkNick.login?mem_nickName="+mem_nickName,"","width=500,height=300");
                 
           }
         
           </script>
    
        

<!-- 비밀번호 확인 -->
    <script>
    function passchk(){
       var signCheck = document.signCheck;
        var mem_password = document.signCheck.mem_password.value;
        var mem_password2 = document.signCheck.mem_password2.value;
        if (mem_password2.length == 0 || mem_password2 == null) {
         document.signCheck.chk.value = "비밀번호를 입력하세요";
         right=0;
        } else if (mem_password != mem_password2) {
         document.signCheck.chk.value = "비밀번호가 다릅니다.";
         right=0;
        } else {   
         document.signCheck.chk.value = "비밀번호가 동일합니다.";
         right=1;
        }
        return;
       }
 
   </script>
<!-- 인증번호  -->
<script>
var code = "";
function CertifyEamil_fn(button_id){
	id = button_id;
	if(id=="CertifyEmail"){
		var mem_email = $("#mem_email").val();
		$.ajax({
		type:"GET",
		url:"CertifyEmail.login?mem_email=" + mem_email,
		cache : false,
		success:function(data){     		
			alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
			$("#CertifyEmailNum").attr("disabled",false);
			code = data;	          
		     }
		  });
	}else if(id=="CertifyEmail_OK"){
		if($("#CertifyEmailNum").val() == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#emailDoubleChk").val("true");
			$("#CertifyEmailNum").attr("disabled",true);
			//$("#sm_email").attr("disabled",true);
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#emailDoubleChk").val("false");
			$("#CertifyEmailNum").attr("autofocus",true);
		}
	}
/* 	$("#CertifyEmail").click(function(){
		alert("!");
		var mem_email = $("#mem_email").val();
		$.ajax({
		type:"GET",
		url:"CertifyEmail.login?mem_email=" + mem_email,
		cache : false,
		success:function(data){     		
			alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
			$("#CertifyEmailNum").attr("disabled",false);
			code = data;	          
		     }
		  });
	});	 */
/* 	$("#CertifyEmail_OK").click(function(){

		if($("#CertifyEmailNum").val() == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#emailDoubleChk").val("true");
			$("#CertifyEmailNum").attr("disabled",true);
			//$("#sm_email").attr("disabled",true);
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#emailDoubleChk").val("false");
			$("#CertifyEmailNum").attr("autofocus",true);
		}
	}); */
	
}




</script>

 <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#efefef), to(#efefef));
      background: -webkit-linear-gradient(bottom left, ##efefef 0%, ##efefef 100%);
      background: -moz-linear-gradient(bottom left, ##efefef 0%, ##efefef 100%);
      background: -o-linear-gradient(bottom left, ##efefef 0%, ##efefef 100%);
      background: linear-gradient(to top right, ##efefef 0%, ##efefef 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
  
  
<title>회원가입</title>

 <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

</head>
<body>

 

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      <!-- ***** Logo Start ***** -->
							<a href="index.do" class="logo"> <img src="resources/images/withcar.png" style="width: 170px;height: 70px;"/></a>
        <h3 class="mb-3" align="center"><B>회원가입</B></h3>
	<form name="signCheck" action="sign.login" method="post" enctype="multipart/form-data">
          
          <div class="mb-3">
              <label for="code">회원가입 약관 </label><br>
            <textarea class="outer" style="width: 100%; height:200px; resize: none;"cols="100" readonly>
  제 1 조 (목적)
1. 본 약관은 해당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 해당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관의 효력과 변경)
1. 해당 사이트는 귀하가 본 약관 내용에 동의하는 경우 해당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 해당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 해당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.
제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 해당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 해당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 해당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 해당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
제 2 장 서비스 제공 및 이용
제 5 조 (이용계약의 성립)
1. 이용계약은 신청자가 온라인으로 해당 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
2. 해당 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
① 다른 사람의 명의를 사용하여 신청하였을 때
② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
③ 다른 사람의 해당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
④ 해당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
⑤ 기타 해당 사이트가 정한 이용신청요건이 미비 되었을 때
제 6 조 (회원정보 사용에 대한 동의)
1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.
2. 해당 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
① 개인정보의 사용 : 해당 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.
단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 해당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.
③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다.
따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.
3. 회원이 본 약관에 따라 이용신청을 하는 것은, 해당 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
제 7 조 (사용자의 정보 보안)
1. 가입 신청자가 해당 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.
2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 해당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 해당 사이트는 책임을 부담하지 아니합니다.
제 8 조 (서비스의 중지)
1. 해당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.
제 9 조 (서비스의 변경 및 해지)
1. 해당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.
제 10 조 (게시물의 저작권)
1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.
2. 해당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.
3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.
제 3 장 의무 및 책임
제 11 조 (해당 사이트의 의무)
1. 해당 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
제 12 조 (회원의 의무)
1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
2. 회원은 해당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
제 4 장 기타
제 13 조 (양도금지)
1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.
제 14 조 (손해배상)
1. 해당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 해당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
제 15 조 (면책조항)
1. 해당 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 해당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
제 16 조 (재판관할)
1. 해당 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</textarea><br>
<input type="radio" name ="agree"> 약관에 동의합니다.
            </div>
          <div class="row">
           	<div class="col-md-7 mb-4">
              <label for="id">아이디 </label>
              <div class="input-group">

               <input type="text" class="form-control onlyAlphabetAndNumber" id="mem_id" name="mem_id" data-rule-required="true" placeholder="12자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="12" onkeydown="inputIdChk()" required>
    			               &ensp; 
    			 <button type = "button" class="btn btn-dark btn-xs" style="background:#091835" onclick = "fn_CheckId()" name="CheckId" class="CheckId" >중복 체크</button>
                        <input type = "hidden" id = "idDuplication" name="idDuplication" value="idUncheck"/>
                        	</div>
                        </div>
           </div>
            <div class="row">
             <div class="col-md-7 mb-4">
              <label for="email">이메일</label>
             <div class="input-group">
             
              <input type="text" class="form-control" name="mem_email" id="mem_email" title="이메일" placeholder="이메일" onkeydown="inputEmailChk()" required /> 
   &ensp; 
   <button type = "button" onclick = "fn_CheckEmail()" name="CheckEmail" style="background:#091835" class="btn btn-dark btn-xs">중복 체크</button>
   <button type = "button" class="btn btn-dark btn-xs" style="background:#091835" name="CertifyEmail" id="CertifyEmail" onclick="CertifyEamil_fn(this.id);"disabled>인증번호 전송</button>
   <input type = "hidden" id = "emailDuplication" name="emailDuplication" value="emailUncheck"/>
   </div>
            </div>   
             
           
		<div class="col-md-4 mb-2" >
              <label for="number">인증번호</label>
           <div class="input-group">         
           <input class="form-control" type="text" id="CertifyEmailNum" title="인증번호" placeholder="인증번호" size="10" disabled />
		&ensp; 
		<button type = "button" class="btn btn-dark btn-xs" style="background:#091835" name="CertifyEmail_OK" id="CertifyEmail_OK" onclick="CertifyEamil_fn(this.id);" disabled>인증번호 확인</button>
		</div>
		<span class="point successEmailChk" style="display: block;font-size: 13px;">이메일 입력후 인증번호 전송을 눌러주세요.</span>
		<input type="hidden" id="emailDoubleChk"/>
		 </div>
            </div>
         
            
            
    <div class="row">
             <div class="col-md-7 mb-4">
              <label for="password">비밀번호</label>         
            <input class="form-control" type="password" name="mem_password" required>
            </div>
            </div>
            <div class="row">
             <div class="col-md-7 mb-4">
              <label for="password">비밀번호 확인</label>         
           <input class="form-control" type="password" name="mem_password2" onblur="passchk()" required>
            <input type="text" style="border-width: 0px; font-size: 13px;" size="20" name="chk" value="비밀번호를 입력하세요" readonly="readonly" >
            </div>
             </div>
            <div class="row">
          <div class="col-md-7 mb-4">
            <label for="userName">이름</label>
            <input class="form-control" type="text" name="mem_userName" required>
          </div>
           </div>
		<div class="row">
          <div class="col-md-7 mb-4">
            <label for="nickName">닉네임</label>
            <div class="input-group">
            <input type="text" class="form-control" id="mem_nickName" name="mem_nickName" data-rule-required="true" placeholder="닉네임" maxlength="30" onkeydown="inputNickChk()" required>
                        &ensp; 
                       <button type = "button" class="btn btn-dark btn-xs" style="background:#091835" onclick = "fn_CheckNick()" name="CheckNick" class="CheckNick">중복 체크</button>
                        <input type = "hidden" id = "nickDuplication" name="nickDuplication" value="nickUncheck"/>
         	</div>
         	 </div>
          </div>
		<div class="row">
		<div class="col-md-7 mb-4">
            <label for="image">프로필 사진</label>
            <input class="form-control" type="file" id="mem_image" name="mem_image"  required>
          </div>
           </div>
          <div class="row">
          <div class="col-md-7 mb-4">
            <label for="phone">전화번호</label>
            <input class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  id="mem_phone" name="mem_phone" placeholder="전화번호는 -를 빼고 입력해 주세요" maxlength="11" required /> 
          </div>
           </div>
          <div class="row">
          <div class="col-md-7 mb-4">
            <label for="phone">생년월일</label>
             <input class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="mem_birthday" name="mem_birthday"  placeholder="생년월일을 6자리로 입력해 주세요 ex:990101" maxlength="6" required /> 
          </div>
           </div>
         <div class="row"> 
          <div class="col-md-7 mb-4">
            <label for="gender">성별</label>
             <input type="radio" name="mem_gender" value="0" checked/>남자
  			 <input type="radio" name="mem_gender" value="1"/> 여자 
          </div>
           </div>
         <div class="row">
             <div class="col-md-7 mb-4">
              <label for="region_num">관심지역</label>
              <select class="custom-select d-block w-100" name="region_num">
                 <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
			 </select>
            </div>
            </div>
            <div class="mb-3">
              <label for="code">자기소개 요약</label>
             <input class="form-control" type="text" name="mem_summary" required>
            </div>
          <div class="mb-3">
              <label for="code">자기소개 </label>
            <textarea style="resize:none;" class="form-control" id="mem_introduce" name="mem_introduce" data-rule-required="true" placeholder="자기소개를 적어주세요" rows="5" required></textarea>
            </div>
            
             <div class="mb-3">
            <label for="mem_accept_email">이메일 수신여부</label><br>
             <input type="radio" name="mem_accept_email" value="0" checked/>동의합니다
   			 <input type="radio" name="mem_accept_email" value="1"/>동의하지 않습니다
          </div>
          
           <div class="mb-3">
            <label for="mem_accept_phone">SMS 수신여부</label><br>
             <input type="radio" name="mem_accept_phone" value="0" checked/>동의합니다
   			 <input type="radio" name="mem_accept_phone" value="1"/> 동의하지 않습니다
          </div>
          
           <div class="mb-3">
            <label for="mem_accept_privacy">개인정보 제공 동의 여부</label><br>
             <input type="radio" name="mem_accept_privacy" value="0" checked/>동의합니다
  			 <input type="radio" name="mem_accept_privacy" value="1"/> 동의하지 않습니다
          </div>
          
         
          <hr class="mb-4">
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" style="background:#091835" onclick="regChk();">회원가입</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
    </footer>
  </div>
</body>
</html>