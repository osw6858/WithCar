<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:url var="root" value="/"></c:url>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="utf-8">
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script type="text/javascript">
		//소켓 생성 (mem_num이 있고 session.getId()가 없을때)
		var sock = new SockJS("${root}echo");
		//알림 받는 영역
		sock.onmessage = function(msg){
			console.log(msg.data);
			$('#target').append(msg.data+"<br/>");
			
			// toast생성 및 추가
			    var data = msg.data;
			    // toast
			    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
			    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
			    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
			    toast += "<span aria-hidden='true'>&times;</span></button>";
			    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
			    $("#target").append(toast);   // msgStack div에 생성한 toast 추가
			    $(".toast").toast({"animation": true, "autohide": false});
			    $('.toast').toast('show');
		};
		//각 등록&결제 버튼
		$(function(){
			
			$('button').click(function(){
				sock.send($('input').val());
			});
		});
		
	</script>
</head>
<body>
<h1>
	에코 서버: <b>${root}</b>
</h1>

<input/><button>전송</button>
<div id="target"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
