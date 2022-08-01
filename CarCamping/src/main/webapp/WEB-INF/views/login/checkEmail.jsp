<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "mem_email" value="${param.mem_email}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<script type = "text/javascript">
function sendCheckValue(){
	var openSignCheck = opener.document.signCheck;
	
	if(document.checkEmail.chResult.value =="N"){
		alert("이미 사용중인 이메일입니다. 다른 이메일을 입력해 주세요");
		openSignCheck.mem_email.focus();
		
		window.close();
	}else{
		openSignCheck.emailDuplication.value="emailCheck";
		openSignCheck.CheckEmail.disabled=true;

		openSignCheck.CertifyEmail.disabled=false;
		openSignCheck.CertifyEmail_OK.disabled=false;
		//openSignCheck.CertifyEmailNum.disabled=false;
	
		openSignCheck.CertifyEmail.disabled=false;
		openSignCheck.CertifyEmail_OK.disabled=false;
		//openSignCheck.CertifyEmailNum.disabled=false;

		openSignCheck.CheckEmail.style.opacity=0.6;
		openSignCheck.CheckEmail.style.cursor="default";
		window.close();
	}
}
	
	</script>

</head>
<body>

	<b><font size="4" color = "green">이메일 중복확인</font></b>
	<br>
	
	<form name="checkEmail">
		<input type="text" name="mem_email" value="${mem_email}" id="mem_email" disabled>
		<c:choose>
		<c:when test = "${result==0}">
			<p style = "color :red"> 이미 사용중인 이메일입니다. </p>
			<input type="hidden" name="chResult" value="N">
		</c:when>
		<c:when test = "${result==1}">
			<p style = "color :blue;"> 사용 가능한 이메일입니다. </p>
			<p style = "color :red;">
			아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.</p>
			<input type="hidden" name="chResult" value="Y">
		</c:when>
		<c:otherwise>
			<p>오류 발생</p>
			<input type="hidden" name="chResult" value="N">
		</c:otherwise>
		</c:choose>
		
		<input type = "button" onclick = "window.close()" value="취소"><br>
		<input type = "button" onclick = "sendCheckValue()" value="사용하기">
		
	</form>

</body>
</html>