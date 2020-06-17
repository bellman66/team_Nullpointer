<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Artist</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css" />
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

	<!-- content부분 시작 -->
	<section id="content_art">
		<article class="artist_box">
			<div class="container">
				<div class="row">
					<div class="artist_tab">
						<!-- tab메뉴 부분 시작-->
						<div id="artmenu">
							<ul id="art_sub">
								<li><a href="#" title="tab1">인디뮤지션</a></li>
								<li><a href="#" title="tab2">타투이스트</a></li>
							</ul>
						</div>
						<!-- tab메뉴 부분 끝 -->

						<!-- artist부분  -->
						<div id="subContent">
							<!-------- 아티스트 게시판 시작! -------->
							<div id="tab1" class="content">
								<!-- artTab 부분  -->
								<!-- artist페이지에서 au_type에 따라 뮤지션과 타투이스트로 나눠서 뿌려줄꺼야! -->
								<form name="artTab"
									action="<%=request.getContextPath()%>/artist/artistpage.do">
									<ul class="grid">
										<!-- 뮤지션 시작!M_Class = 2 -->
										<li class="btn_link">
										<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></span>
											<span class="title"> <!-- artist -> alist -> List<Map> -> M_Id 순서 -->
											</span>
											<div class="btn_ani">
												<a href="<%=request.getContextPath()%>/artist/artistpage.do"
													class="btn_link" target="_blank"> 
													<span class="arrow">
														<img src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
												</span>
												</a>
											</div>
											</li>
										<!-- 뮤지션 끝! -->
									</ul>
								</form>
								<!-- artTab 부분  -->
							</div>
							<!-------- 아티스트 게시판 끝! -------->

							<!-------- 타투이스트 게시판 시작! -------->
							<div id="tab2" class="content">
								<form name="taTab" action="<%=request.getContextPath()%>/artist/tattoopage.do">
									<ul class="grid">
										<!-- 타투이스트 시작! M_Class=3 -->
										<li class="btn_link"><span class="img_box"
											style="background: url(<%=request.getContextPath()%>/resources/img/tattoo/dan.jpg)"></span>
											<span class="title">
											</span>
											<div class="btn_ani">
												<a href="<%=request.getContextPath()%>/artist/tattopage.do"
													class="btn_link" target="_blank"> 
													<span class="arrow">
														<img src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
												</span>
												</a>
											</div>
											</li>
										<!-- 타투이스트 끝! -->
									</ul>
								</form>
								<!-- taTab부분 -->
							</div>
							<!-------- 타투이스트 게시판 끝! -------->
						</div>
						<!-- artist부분  -->

						<!-- 검색과 페이징 처리  -->
						<!-- 페이징  -->
						<div class="page_btn">
							<a href="#">페이지번호</a>
						</div>

						<!-- 검색 -->
						<div class="tabSeach">
							<input type="text" class="titSeach">
							<button type="button" class="titSeachVar">검색</button>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->

	<!-- javascript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/lightgallery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/artist_tap.js">
		
	</script>

</body>
</html>