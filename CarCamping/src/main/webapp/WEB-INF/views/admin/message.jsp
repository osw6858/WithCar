<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}"
	opener.parent.location.reload();
	window.close();
</script>

