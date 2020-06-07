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
    
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
		rel="stylesheet">
		
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.5.1.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/sockjs/sockjs.js"></script>
	
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
  	
    <article class="chatContent">
        <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" >
            <div class="col-xs-12 col-md-12">
                <div class="panel panel-default">

                    <div class="panel-heading top-bar">
                        <div class="col-md-8 col-xs-8">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Live Chat </h3>
                        </div>
                        <div class="col-md-4 col-xs-4" style="text-align: right;">
                        	<!-- 채팅창을 줄이는 아이콘 - 사용 안함 -->
                            <!-- <a href="#"><span id="minim_chat_window"
                                    class="glyphicon glyphicon-minus icon_minim"></span></a>
                            <a href="#">
                                <span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span>
                            </a> -->
                        </div>
                    </div>

                    <div id="charContent" class="panel-body msg_container_base">
                    
                    	<div id="alertMsg" class="unvisable_class">
                    		<span> 눌러서 최신메세지 확인 </span>
                    	</div>

                        <!-- 채팅창 예시 === === ===  -->
						<%-- 왼쪽에 붙음 --%>
                        <div class="row msg_container base_receive">
                            <div class="col-xs-10 col-md-10">
                                <div class="messages msg_receive">
                                    <p>that mongodb thing looks good, huh?
                                        tiny master db, and huge document store</p>
                                    <!-- <time datetime="2009-11-13T20:00">Timothy • 51 min</time> -->
                                </div>
                            </div>
                        </div>
                        <!-- === === === === == ===  -->

						<%-- 오른쪽에 붙음 --%>
                        <div class="row msg_container base_sent">
                            <div class="col-md-10 col-xs-10 ">
                                <div class="messages msg_sent">
                                    <p>that mongodb thing looks good, huh?
                                        tiny master db, and huge document store</p>
                                    <!-- <time datetime="2009-11-13T20:00">Timothy • 51 min</time> -->
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="panel-footer">
                        <div class="input-group">
                        	<textarea id="chatting" type="text" 
							 	   class="form-control input-sm chat_input"
                                   placeholder="Message Line"></textarea>
                            <!-- <input id="chatting" type="text" 
							 	   class="form-control input-sm chat_input"
                                   placeholder="Message Line" /> -->
                            <span class="input-group-btn">
                                <button id="sendButton" class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                            </span>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%-- <div class="btn-group dropup">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-cog"></span>
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li>
                <li class="divider"></li>
                <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li>
            </ul>
        </div> --%>

    </article>
  
</section>  
  <!-- chatSend() : 채팅 send  -->
  <script type="text/javascript">
  $(function () {
	   let liveChat = document.getElementById('charContent');
	   let alertmsg = $("#alertMsg");

	   let mode = 1;
	   let currentLoc = 0;
	   let scrollLoc = 0;	// 현재의 스크롤 위치 ;

	   liveChat.onscroll = function(e) {
			scrollLoc = ((typeof e.target.scrollTop) === undefined) ? 0 :  e.target.scrollTop ;

			if(currentLoc <= scrollLoc) {
				currentLoc = scrollLoc;
				mode=1;
			}
			else {
				mode=2;	
				alertmsg.removeClass('unvisable_class').addClass('visable_class');
			}
	   }
	   
	   var sock = new WebSocket("ws://localhost:7070/springmvc/chatHandler.do"); 
	   /* var sock = new SockJS("http://localhost:7070/springmvc/chatHandler.do"); */
	   /* var sock = new SockJS("<c:url value="/chatHandler.do"/>");  */
		   console.dir(sock);
		   sock.onopen = function() {
			    sock.send('채팅 입장');
			    
			    sock.onmessage = function(e) {
					// 본인 확인을 위한 아이디 : splitData[0] 사용자 아이디
					let splitData = e.data.split(":"); 
					
					let chatDiv1 = document.createElement('div');
					chatDiv1.className = "row msg_container base_receive";
				    if(splitData[0].trim() == 'user'){
						// 본인이 보낸것만 걸러내서 다시 className 재정의
						chatDiv1.className = "row msg_container base_sent";
					}

					let chatDiv2 = document.createElement('div');
					chatDiv2.className = "col-xs-10 col-md-10";

					let chatDiv3 = document.createElement('div');
					chatDiv3.className = "messages msg_receive";

					let content = document.createElement('p');
					/* for(let v=0 ; v < e.data.length ; v++){
						console.log(v);
					} */

					content.innerHTML = e.data;

					chatDiv3.appendChild(content);
					chatDiv2.appendChild(chatDiv3);
					chatDiv1.appendChild(chatDiv2);

				    liveChat.appendChild(chatDiv1);

				    if(mode == 1){
						alertmsg.removeClass('visable_class').addClass('unvisable_class');
						$('#charContent').stop().animate({ scrollTop: $('#charContent')[0].scrollHeight }, 1000);
				    }

			   };
		   };

  	function chatSend() {
  		/* 값 가져와서 WebSocket에 찍어줌 */
		let chat_value = document.getElementById("chatting").value;
		if(chat_value.trim() != '') {
  			sock.send(chat_value);
		}
  		document.getElementById("chatting").value = '';
	}

	document.getElementById("alertMsg").addEventListener("click" , function(event) {
		$(this).removeClass('visable_class').addClass('unvisable_class');
		$('#charContent').stop().animate({ scrollTop: $('#charContent')[0].scrollHeight }, 1000);
	})
  	
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