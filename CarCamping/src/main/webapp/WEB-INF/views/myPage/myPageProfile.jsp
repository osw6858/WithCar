<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<%@ include file="../top.jsp" %>
<head>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
   crossorigin="anonymous"></script> 
   
<script language="javascript">
  function showPopup() { window.open("memberDelete.myPage", "a", "width=700, height=350, left=100, top=50"); }
  
  </script>
  
<script type="text/javascript">
var right = 0;
function regChk(){
  var signCheck = document.signCheck;
  var fileName = $("#mem_image").val();           
  var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
  if (!(ext == "" || ext == "gif" || ext == "jpg" || ext == "png")) {
     alert("이미지파일 ( ,.jpg, .png, .gif ) 만 업로드 가능합니다.");   
     signCheck.mem_image.focus();
     return false;
  }
      if (signCheck.mem_phone.value==""){
         alert("전화번호를 입력하셔야 합니다.")
         signCheck.mem_phone.focus() 
         return false;
         }
     if (signCheck.mem_birthday.value==""){
         alert("생년월일을 입력하셔야 합니다.")
         signCheck.mem_birthday.focus() 
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
     alert("비밀번호는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해 주세요.");
     signCheck.mem_password.focus();
     return false;
    }
   if(right==0){
       alert("비밀번호가 동일하지 않습니다.");
       signCheck.mem_password.focus();
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
   var nickregExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
   var mem_nickName = signCheck.mem_nickName.value;
   if(mem_nickName.length==0||mem_nickName==""){
      alert("닉네임을 입력해 주세요.");
      signCheck.mem_nickName.focus();
      return false;
   }
   if( nickregExp.test(mem_nickName) ){
      alert("특수문자는 입력하실수 없습니다.");
      return false;
   }
 
          document.signCheck.submit()
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
    
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
                <div class="col-sm-9">
                    <h2 class="text-center">정보 수정</h2>
                     
                    <form name="signCheck" action="myPageProfile.myPage" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="mem_num" value="${getMember.mem_num}"/>
                     
                    <table class="table table-striped">
                      <tr>
                        <td>이름</td>
                        <td><input type="text" name="mem_userName" class="box" 
                                          value="${getMember.mem_userName}" class="form-control" disabled></td>
                      </tr>
                      
                       <tr>
                        <td>아이디</td>
                        <td><input type="text" name="mem_id" class="box" value="${getMember.mem_id}" class="form-control" disabled></td>
                      </tr>
                          
                      <tr>
                        <td>이메일</td>
                        <td>
                        <input type="text" value="${getMember.mem_email}" id="mem_email" name="mem_email" class="form-control" disabled>
                        </td>
                      </tr>
                      <tr><td>닉네임  </td>
                      <td>
                       <input type="text" value="${getMember.mem_nickName}" id="mem_nickName" name="mem_nickName" class="form-control"  required> 
                       <button type = "button" class="btn btn-dark btn-s" style="background:#091835" onclick = "fn_CheckNick()" name="CheckNick" class="CheckNick">중복 체크</button>
                        <input type = "hidden" id = "nickDuplication" name="nickDuplication" value="nickUncheck"/>
                       <tr>
                        <td>프로필 사진</td>
                        <td>
                        <img src="https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/${getMember.mem_image}" width="150" height="150">
                     <input type="file" id="mem_image" name="mem_image">
                     <input type="hidden" id="mem_image2" name="mem_image2" value="${getMember.mem_image}">
                        </td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td>
                        <input type="text" value="${getMember.mem_phone}" id="mem_phone" name="mem_phone" class="form-control" required>
                        </td>
                      </tr>
                      <tr>
                        <td>생년월일</td>
                        <td>
                        <input type="text" value="${getMember.mem_birthday}" id="mem_birthday" name="mem_birthday" class="form-control" required>
                        </td>
                      </tr>
                     
                      <tr>
                        <td>성별</td>
                        <td>
                        <div class="col-lg-10">
                        <c:if test="${getMember.mem_gender==0}"> 남
       
                        </c:if>
                        
                        <c:if test="${getMember.mem_gender==1}"> 여
                       
                        </c:if>
                    </div>
                      
                     
                        </td>
                      </tr>
                      
                       <tr>
                        <td>관심지역</td>
                        <td>
                       <!--   <input type="text" value="${getMember.regionDTO.region_num}" name="region_num" class="form-control" required> -->
                         <select name="region_num">
                        <c:if test="${getMember.regionDTO.region_num == 1}">
                         <option value="1" selected>서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                            <c:if test="${getMember.regionDTO.region_num == 2}">
                         <option value="1">서울/경기도</option>
                            <option value="2" selected>강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 3}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3" selected>충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 4}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4" selected>충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 5}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5" selected>전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 6}">
                        <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6" selected>전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 7}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7" selected>경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 8}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8" selected>경상남도</option>
                            <option value="9">제주도</option>
                            </c:if>
                             <c:if test="${getMember.regionDTO.region_num == 9}">
                         <option value="1">서울/경기도</option>
                            <option value="2">강원도</option>
                            <option value="3">충청북도</option>
                            <option value="4">충청남도</option>
                            <option value="5">전라북도</option>
                            <option value="6">전라남도</option>
                            <option value="7">경상북도</option>
                            <option value="8">경상남도</option>
                            <option value="9" selected>제주도</option>
                            </c:if>
                         </select>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>회원 포인트</td>
                        <td>
                        <input type="text" value="${getMember.mem_point}" name="mem_point" class="form-control" disabled>
                        </td>
                      </tr>
                      <tr>
                        <td>자기소개 요약</td>
                        <td>
                        <input type="text" value="${getMember.mem_summary}" id="mem_summary" name="mem_summary" class="form-control" required>
                        </td>
                      </tr>
                      <tr>
                        <td>자기소개</td>
                        <td>
                       
                        <textarea style="resize:none;" class="form-control" id="mem_introduce" name="mem_introduce" data-rule-required="true" rows="5" required>${getMember.mem_introduce}</textarea>
                        </td>
                      </tr>
                       <tr>
                        <td>이메일 수신 여부</td>
                        <td>
                             <div class="col-lg-10">
                        <c:if test="${getMember.mem_accept_email==0}">
                             <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="1"> 동의하지 않습니다.
                        </label></c:if>
                        
                        <c:if test="${getMember.mem_accept_email==1}">
                       <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="0"> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_email" name="mem_accept_email" value="1" checked> 동의하지 않습니다.
                        </label></c:if>
                    </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>문자 수신 여부</td>
                        <td>
                             <div class="col-lg-10">
                        <c:if test="${getMember.mem_accept_phone==0}">
                             <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="1"> 동의하지 않습니다.
                        </label></c:if>
                        
                        <c:if test="${getMember.mem_accept_phone==1}">
                       <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="0"> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_phone" name="mem_accept_phone" value="1" checked> 동의하지 않습니다.
                        </label></c:if>
                    </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td>정보 공개 여부</td>
                        <td>
                        <div class="col-lg-10">
                        <c:if test="${getMember.mem_accept_privacy==0}">
                             <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="0" checked> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="1"> 동의하지 않습니다.
                        </label></c:if>
                        
                        <c:if test="${getMember.mem_accept_privacy==1}">
                       <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="0"> 동의합니다.
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="mem_accept_privacy" name="mem_accept_privacy" value="1" checked> 동의하지 않습니다.
                        </label></c:if>
                    </div>
                        </td>
                      </tr>
                       
                      <tr>
                        <td>비밀번호(변경)</td>
                        <td>
                        <input type="password"  id="mem_password" name="mem_password" class="form-control" placeholder="비밀번호를 변경하지 않을 시, 기존의 비밀번호를 입력하세요." required>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>비밀번호 확인</td>
                        <td>
                        <input type="password" id="mem_password2" name="mem_password2" class="form-control" onblur="passchk()" required>
                        <input type="text" style="border-width: 0px; background-color:#ddd" size="16" name="chk" value="비밀번호를 입력하세요" readonly="readonly">
                         <br><br>
                        </td>
                      </tr>

                    <tr>
                        <td colspan="2" class="text-center">
                         <button type="button" class="btn btn-dark" onclick="location.href='javascript:regChk();'">수정</button>
                         <input type="button" value="회원탈퇴" class="btn btn-dark" onclick="showPopup();">
                       </td>    
                    </tr>
                           
                    </table>
                </form>   
                </div>
        </div>
    </div>
</div>
</body>
 <%@ include file="../bottom.jsp" %>
</html>   