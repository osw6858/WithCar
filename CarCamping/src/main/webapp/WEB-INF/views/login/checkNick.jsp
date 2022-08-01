<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "mem_nickName" value="${param.mem_nickName}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<script type = "text/javascript">
function sendCheckValue(){
	var openSignCheck = opener.document.signCheck;
	
	if(document.checkNick.chResult.value =="N"){
		alert("이미 사용중인 닉네임입니다. 다른 닉네임을 입력해 주세요");
		openSignCheck.mem_nickName.focus();
		
		window.close();
	}else{
		openSignCheck.nickDuplication.value="nickCheck";
		openSignCheck.CheckNick.disabled=true;
		openSignCheck.CheckNick.style.opacity=0.6;
		openSignCheck.CheckNick.style.cursor="default";
		window.close();
	}
}
	
	</script>

</head>
<body>

	<b><font size="4" color = "green">닉네임 중복확인</font></b>
	<br>
	
	<form name="checkNick">
		<input type="text" name="mem_nickName" value="${mem_nickName}" id="mem_nickName" disabled>
		<c:choose>
		<c:when test = "${result==0}">
			<p style = "color :red"> 이미 사용중인 닉네임입니다. </p>
			<input type="hidden" name="chResult" value="N">
		</c:when>
		<c:when test = "${result==1}">
			<p style = "color :blue"> 사용 가능한 닉네임입니다. </p>
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