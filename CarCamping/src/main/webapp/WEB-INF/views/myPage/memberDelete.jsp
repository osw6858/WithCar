<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage에서 회원탈퇴 페이지 -->
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script> 
	
<form name="memberDelete" method="Post" action="memberDelete.myPage">

	<table align="center" align="top">
		<caption style="line-height:60px;font-size:25px;"><b>회원탈퇴</b></caption>
		<tr>
			<td colspan="2">회원 탈퇴를 위해 비밀번호를 입력해 주세요.</td>
		</tr>
		<tr>
			<td style="width: 120px;">비밀번호</td>
			<td><input type="password" name="raw_password" placeholder="비밀번호를 입력해주세요." required></td>
		</tr>
		<tr>
			<td style="width: 120px;">비밀번호 확인</td>
			<td><input type="password" name="raw_password2" placeholder="비밀번호를 입력해주세요." required></td><br><br>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="button" class="btn btn-dark" name="memberDelete" onclick="check()">회원 탈퇴</button>
			</td>
		</tr>
	</table>
</form> 

<script>
//비밀번호 일치 확인 script
function check(){
	console.log('회원탈퇴') 
	if (memberDelete.raw_password.value!=memberDelete.raw_password2.value){
			alert("비밀번호를 동일하게 입력해 주세요.")
			memberDelete.raw_password2.focus()
			return
		}
	  
	document.memberDelete.submit()
} 
</script>


