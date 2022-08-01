<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<html>
<head>
 <meta charset="UTF-8">  
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<title>문의목록</title>
	<script>
		function popup(){
			var url = "myPageContactUs.myPage?mem_num=${mem_num}"
			var name = "문의글 작성"
			var option = "width=800,height=400,top=100,left=300,location=no"
			window.open(url,name,option);
		}
		

		function popupReply(a){
			var url = "myPageQuestionReply.myPage?question_num="+a
			var name = "답변 보기"
			var option = "width=800,height=400,top=100,left=300,location=no"
			window.open(url,name,option);
		}

	</script>
</head>
<body>

	<div class="container" align="center" class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
		<h2>문 의 목 록</h2>

		
		
		<table class="table table-striped table-hover">
		<tr>
			<th scope="col" width="60%" class="text-center">제목</th>
			<th scope="col" width="10%" class="text-center">작성자</th>
			<th scope="col" width="10%" class="text-center">문의일</th>
			<th scope="col" width="20%" class="text-center">답변</th>

		</tr>
				<c:if test="${empty listBoard}">
			<tr>
				<td colspan="4">등록된 문의사항이 없습니다.</td>
			</tr>
		</c:if>			
		<c:forEach var="dto" items="${listBoard}">
			<tr>
				<td align="center" onclick="location.href='myPageContactUsView.myPage?question_num=${dto.question_num}'">
						${dto.question_title}
					</td>
				<td align="center">${dto.memberDTO.mem_nickName}</td>
				<td align="center">${dto.question_sysdate}</td>
				<c:if test="${empty dto.question_reply}">
				<td></td>
				</c:if>			
				<c:if test="${not empty dto.question_reply}">
				<td align="center">
				<button type="button" class="btn btn-dark" onclick="location.href='javascript:popupReply(${dto.question_num})'">답변보기</button>
					</c:if>		
			</tr>	
		</c:forEach>
	</table>
		 <div class="col-md-offset-9"> 
		<button id="writehBtn" type="button" class="btn btn-dark" onclick="location.href='javascript:popup()'" >문의글 작성</button>
                
		</div>
		
		 <div class="col-xs-6 col-xs-offset-3"> 
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page-3>1}">
            <li class="page-item"><a class="page-link" href="myPageQuestion.myPage?page=${page-1}&mem_num=${sessionScope.mem_num}">Previous</a></li>
         </c:if>
      <c:forEach var="i" begin="${page-3<1?1:page-3}" end="${page+3>pageCount?pageCount:page+3}">
         <c:if test="${i==page}">
            <li class="page-item"><a class="page-link" href="myPageQuestion.myPage?page=${i}&mem_num=${sessionScope.mem_num}" style="color:blue;">${i}</a></li>
         </c:if>
         <c:if test="${i!=page}">
            <li class="page-item"><a class="page-link" href="myPageQuestion.myPage?page=${i}&mem_num=${sessionScope.mem_num}">${i}</a></li>
         </c:if>
      </c:forEach>
         <c:if test="${page+3<pageCount}">
            <li class="page-item"><a class="page-link" href="myPageQuestion.myPage?page=${page+1}&mem_num=${sessionScope.mem_num}">Next</a></li>
         </c:if>
		</ul>
	</nav>
</div>
</div>

</body>
<%@ include file="../bottom.jsp"%>
</html>