<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Stream Live</title>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/stream/indexCustom.css" />
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
		rel="stylesheet">
		
	<script src="<%=request.getContextPath()%>/resources/js/sockjs/sockjs.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jqery-3.5.1.js"></script>
	
	  <!-- ### ### ### video js 시스템  -->
	  <!-- If you'd like to support IE8 (for Video.js versions prior to v7) -->
	  <script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/videojs-flash@2/dist/videojs-flash.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/videojs/video.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/videojs/videojs-contrib-hls.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/videojs/resolution-switcher/videojs-resolution-switcher.js"></script>
	  
	  <link href="${pageContext.request.contextPath}/resources/videojs/video-js.css" rel="stylesheet" />
	  <link href="${pageContext.request.contextPath}/resources/videojs/resolution-switcher/videojs-resolution-switcher.css" rel="stylesheet">
	  <!-- video js end -->
</head>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<!-- 1. section part -->
<section id="contentWrapper">

	<!-- 1-1 streaming service -->
	<article id="streamContent">
		<video id="streamVideo" 
	  		 class="video-js vjs-default-skin"
	  		 controls 
	  		 autoplay
	  		 preload="auto"
	  		 data-setup='{}'
	  		 muted
	  		 >
	  		 
	   	  <!-- <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.720p.webm" type="video/webm" label='720P' res='720'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.480p.webm" type="video/webm" label='480P' res='480'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.360p.webm" type="video/webm" label='360P' res='360'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.240p.webm" type="video/webm" label='240P' res='240'> -->
	 
	  	  <!-- <source src="http://rndso15.synology.me:8080/hls/test_hd720.m3u8" type='application/x-mpegURL' label='720P' res='720'>
	      <source src="http://rndso15.synology.me:8080/hls/test_mid.m3u8" type='application/x-mpegURL' label='480P' res='480'>
	      <source src="http://rndso15.synology.me:8080/hls/test_low.m3u8" type='application/x-mpegURL' label='360P' res='360'>
	      <source src="http://rndso15.synology.me:8080/hls/test.m3u8" type='application/x-mpegURL' label='240P' res='240'> -->
	      
	  	  <!-- <source src="http://localhost:8080/hls/test_hd720.m3u8" type='application/x-mpegURL' label='720P' res='720'>
	      <source src="http://localhost:8080/hls/test_mid.m3u8" type='application/x-mpegURL' label='480P' res='480'>
	      <source src="http://localhost:8080/hls/test_low.m3u8" type='application/x-mpegURL' label='360P' res='360'> -->
	      
	      <source src="http://localhost:8080/hls/test.m3u8" type='application/x-mpegURL' label='100' res='100'>

	  	</video>
  	</article>
  	
  	<!-- 1-2 채팅 -->
	<article class="chatContent">
	
		<div class="chat-title">
			<h5 id="charTitle">Live Chatting </h5>
		</div>
		
		<div class="chat-value">
			<div id="charContent">
			
			</div>
		</div>
		
		<div class="chat-input">
			<div id="chatLine">
				<textarea id="chatting" placeholder="채팅 입력" rows="4" cols="10" maxlength="500"></textarea>
				<button id="sendButton" type="button">Send</button>
			</div>
		</div>

  	</article>
  
</section>  
  <!-- chatSend() : 채팅 send  -->
  <script type="text/javascript">
  $(function () {
	   let liveChat = document.getElementById('charContent');
	   var sock = new WebSocket("ws://localhost:7070/springmvc/chatHandler.do"); 
	   /* var sock = new SockJS("http://localhost:7070/springmvc/chatHandler.do"); */
	   /* var sock = new SockJS("<c:url value="/chatHandler.do"/>");  */
		   console.dir(sock);
		   sock.onopen = function() {
			    sock.send('채팅 입장');
			    
			    sock.onmessage = function(e) {
			    	let chatdiv = document.createElement('div');
			    	let chatcontent = document.createElement('span');
			    	chatcontent.innerHTML = e.data;
			    	
			    	chatdiv.appendChild(chatcontent);
				    liveChat.appendChild(chatdiv);
			   };
		   };

  	function chatSend() {
  		/* 값 가져와서 WebSocket에 찍어줌 */
		let chat_value = document.getElementById("chatting").value;
  		sock.send(chat_value);
  		document.getElementById("chatting").value = '';
	}
  	
  	document.getElementById("chatting").addEventListener("keypress" , function(event) {
  		if(event.keyCode == 13) {
  			chatSend();
  		}
  	})
  	
  	document.getElementById("sendButton").addEventListener("click" , function(event) {
  		chatSend();
  	})
  	
   });
  </script>

  <script>
    var player = videojs('streamVideo');
    player.videoJsResolutionSwitcher();
  </script>
	
</body>

</html>