<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
/* selfclose го╠Б*/
if("${mode}" == "selfClose"){
	alert("${msg}");
	window.close();
}
else {	
	alert("${msg}")
	location.href="${url}"
}
	
	
</script>

