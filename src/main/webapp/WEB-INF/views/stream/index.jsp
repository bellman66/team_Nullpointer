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
		
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jqery-3.5.1.js"></script>
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
	  		 
	   	  <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.720p.webm" type="video/webm" label='720P' res='720'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.480p.webm" type="video/webm" label='480P' res='480'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.360p.webm" type="video/webm" label='360P' res='360'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.240p.webm" type="video/webm" label='240P' res='240'>
	 
	  	  <!-- <source src="http://rndso15.synology.me:8080/hls/test.m3u8?_hd720" type='application/x-mpegURL' label='720P' res='720'>
	      <source src="http://rndso15.synology.me:8080/hls/test.m3u8?_mid" type='application/x-mpegURL' label='480P' res='480'>
	      <source src="http://rndso15.synology.me:8080/hls/test.m3u8?_low" type='application/x-mpegURL' label='360P' res='360'>
	      <source src="http://rndso15.synology.me:8080/hls/test.m3u8" type='application/x-mpegURL' label='240P' res='240'> -->
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
				<button id="sendButton" type="button" onclick="chatSend()">Send</button>
			</div>
		</div>

  	</article>
  
</section>  

  <!-- ### ### ### video js 시스템  -->
  <script src="${pageContext.request.contextPath}/resources/videojs/video.js"></script>
  <script src="${pageContext.request.contextPath}/resources/videojs/resolution-switcher/videojs-resolution-switcher.js"></script>
  
  <!-- chatSend() : 채팅 send  -->
  <script type="text/javascript">
  $(function () {
	  
	   var sock = new SockJS('/chatHandler');
		   console.dir(sock);
		   sock.onopen = function() {
			    console.log('=== open char handler');
			    sock.send('test');
		   };
		   sock.onmessage = function(e) {
			    console.log('message', e.data);
			    sock.close();
		   };
		   sock.onclose = function() {
			    console.log('close');
		};
	  
  	function chatSend() {
  		/* 값 가져와서 WebSocket에 찍어줌 */
		let chat_value = document.getElementById("chatting").value;
		
  		sock.send(chat_value);
  		document.getElementById("chatting").value = "채팅 입력";
	}
  	
  	document.getElementById("chatting").addEventListener("keypress" , function(event) {
  		if(event.keyCode == 13) {
  			chatSend();
  		}
  	})
  	
   });
  </script>
 
  <script>
    // fire up the plugin
    //var player = videojs('streamVideo');
    //player.videoJsResolutionSwitcher();
  </script>
	
</body>

</html>