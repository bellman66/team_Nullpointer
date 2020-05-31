<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Main</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" />
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">

<!-- HTLM5shiv ie6~8 -->
<!--[if lt IE 9]> 
        <script src="js/html5shiv.min.js"></script>
        <script type="text/javascript">
            alert("현재 당신이 보는 브라우저는 지원하지 않습니다. 최신 브라우저로 업데이트해주세요!");
        </script>
    <![endif]-->
</head>
<body>
	<!-- header부분 시작  -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- header부분 끝 -->

	<!-- nav부분 시작 -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<!-- nav부분 끝 -->

	<!-- content1부분 시작 -->
	<section id="content1">
		<!-- main 화면 대여부분 시작 -->
		<article class="main_box">
			<div class="container">
				<div class="row">
					<div class="main_rent">
						<h1>Artist 홍보 영상</h1>
						<div class="rentVideo">
							<img alt="test" src="<%=request.getContextPath()%>/resources/img/maintest.jpg" />
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content1부분 끝 -->

	<!-- content2부분 시작  -->
	<section id="content2">
		<article class="today_box">
			<div class="container">
				<div class="row">
					<div class="todaylist">
						<h2>Today Video</h2>
						<div class="todayVideo">
							<div id="tv1"></div>
							<div id="tv2"></div>
							<div id="tv3"></div>
							<div id="tv4"></div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="best_box">
			<div class="container">
				<div class="row">
					<div class="bestlist">
						<h2>Best Video</h2>
						<div class="bestVideo">
							<div id="bv1"></div>
							<div id="bv2"></div>
							<div id="bv3"></div>
							<div id="bv4"></div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content2부분 끝 -->

	<!-- content3부분 시작  -->
	<section id="content3">
		<article class="category">
			<div class="container">
				<div class="row">
					<div class="categorylist">
					<h2>Artist 카테고리</h2>
					<div class="categoryArtist">
						<div id="ca1"></div>
						<div id="ca2"></div>
						<div id="ca3"></div>
						<div id="ca4"></div>
						<div id="ca5"></div>
						<div id="ca6"></div>
					</div>	
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content3부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->
	
</body>
</html>