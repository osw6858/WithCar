<%@include file="../top.jsp"%>
<c:forEach var="test" items="${list }">
	<h1>
	<c:out value="${test.region_num }"/>
	${test.region_num}
	${test.ccr_num}
	${test.ccr_name}
	${test.reviewCount}
	${test.ccr_likeCount}
	${test.ccr_popular}
	${test.ccr_score}
	</h1>
</c:forEach>
<%@include file="../bottom.jsp"%>
