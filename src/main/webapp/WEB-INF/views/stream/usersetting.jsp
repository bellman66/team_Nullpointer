<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Stream Live</title>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/stream/userSettingCustom.css" />

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
		rel="stylesheet">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.5.1.js"></script>
	
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
	  		 preload="auto"
	  		 data-setup='{}'
	  		 muted
	  		  poster="<%=request.getContextPath()%>/resources/img/maintest.jpg">
	  		 
	   	  <!-- <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.720p.webm" type="video/webm" label='720P' res='720'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.480p.webm" type="video/webm" label='480P' res='480'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.360p.webm" type="video/webm" label='360P' res='360'>
	      <source src="https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ab/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm/Caminandes_3_-_Llamigos_-_Blender_Animated_Short.webm.240p.webm" type="video/webm" label='240P' res='240'> -->

	      <%-- <source src="http://localhost:8080/hls/${userHashCode}/index.m3u8" type='application/x-mpegURL' label='src' res='src'> --%>
	      <source src="http://rndso15.synology.me:8080/hls/${userHashCode}/index.m3u8" type='application/x-mpegURL' label='src' res='src'> 
	      <%-- <source src="http://172.31.0.57:8080/hls/${userHashCode}/index.m3u8" type='application/x-mpegURL' label='src' res='src'> --%>
	      
	  	  <!-- <source src="http://localhost:8080/hls/test_hd720.m3u8" type='application/x-mpegURL' label='720P' res='720'>
	      <source src="http://localhost:8080/hls/test_mid.m3u8" type='application/x-mpegURL' label='480P' res='480'>
	      <source src="http://localhost:8080/hls/test_low.m3u8" type='application/x-mpegURL' label='360P' res='360'> -->
	      
	      <!-- <source src="http://localhost:8080/hls/test.m3u8" type='application/x-mpegURL' label='100' res='100'> -->

	  	</video>
  	</article>
  	
  	<article id="streamSetting">
  	
		  <div class="container">
		  
		  <h1 class="page-header">Stream Setting</h1>
		  <div class="row">

		    <!-- edit form column -->
		   	  <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
		   	  
<!-- 		   	  	<div class="form-group">
		          <label class="col-lg-3 control-label" onclick="settingPopup()"> Stream 방법 (OBS Studio) Click</label>

		        </div> -->
		        <div class="form-group">
		          <label class="col-lg-3 control-label"> 
		          	<span> Stream Key </span>
		          	<b id="settingPopup" onclick="settingPopup()"> Stream 방법 (OBS Studio) Click </b>
		          </label>
		          <div class="col-lg-8">
		            <span> ${userHashCode} </span>
		          </div>
		        </div>
		        
		        <br>
		        <hr>

		        <div class="form-group">
		          <label class="col-md-3 control-label">방 제목</label>
		          <div class="col-md-8">
		            <input id="streamTitle" class="form-control" value="" type="text">
		          </div>
		        </div>
		        
		     	<div>
		     		<button id="livebutton" class="live-on"> Live On </button>
		     	</div>
		        
		      </div>
		  </div>
		
		</div>
  	</article>
  	
</section>

<script type="text/javascript">
$(function(){
	
	document.getElementById("livebutton").addEventListener('click' , function(e) {
		let element = $(this);
		
		if(element.hasClass("live-on")){
			element.text("Live Off")
			element.removeClass("live-on").addClass('live-off');
			
			$.ajax({
				method : "GET" ,
				url : "${pageContext.request.contextPath}/stream/liveon.do" ,
				data : {
					'userHashCode' : '${userHashCode}' ,
					'id' : '${userid}',
					"streamTitle" : $('#streamTitle').val()
				} ,
				success : function(data) {
					if(data == 1) {
						alert('생방송이 시작되었습니다.')
					}
					else {
						alert('방송 설정이 변경되었습니다.')
					}
				}
			})
		}
		else {
			element.text("Live On")
			element.removeClass("live-off").addClass('live-on');
			
			$.ajax({
				method : "GET" ,
				url : "${pageContext.request.contextPath}/stream/liveoff.do" ,
				data : {
					'userHashCode' : '${userHashCode}' ,
					'id' : '${userid}',
					"streamTitle" : $('#streamTitle').val()
				} ,
				success : function(data) {
					if(data == 1) {
						alert('생방송이 종료되었습니다.')
					}
				}
			})
		}
	})
});
</script>

<script type="text/javascript">
	function settingPopup() {
		var url = "${pageContext.request.contextPath}/stream/settingPopup.do";
        var name = "setting popup";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
       
        window.open(url, name, option);
	}
</script>
</body>

</html>