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
							<ul class="tab">
								<li data-tab="tab1" class="artmenu" id="art" onclick="art()"><a>인디뮤지션</a></li>
								<li data-tab="tab2" class="artmenu" id="tat" onclick="tat()"><a>타투이스트</a></li>
							</ul>
						</div>
						<!-- tab메뉴 부분 끝 -->

						<!-- artist부분  -->
						<div id="subContent">
							<form name="artTab"
								action="<%=request.getContextPath()%>/artist/artist.do">
								<!-- artTab 부분  -->
								<!-------- 아티스트 게시판 시작! -------->
								<div id="tab1" class="content">
									<!-- artist페이지에서 au_type에 따라 뮤지션과 타투이스트로 나눠서 뿌려줄꺼야! -->
									<ul class="grid">
										<!-- 뮤지션 시작!M_Class = 2 -->
										<c:forEach items="${music}" var="music" varStatus="status">
											<li class="btn_link">
												<span class="img_box">${music.rename_filepath}</span> 
												<span class="title">${music.m_nickname}</span>
												<div class="btn_ani">
													<a href="<%=request.getContextPath()%>/artist/artistpage.do?artist_nick=${music.m_nickname}"
													class="btn_link">
														<span class="arrow"> 
															<img src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
														</span>
													</a>
												</div>
											</li>
										</c:forEach>
										<!-- 뮤지션 끝! -->
									</ul>
									<!-- music_더보기 버튼입니다  -->
									<div class="tabmore">
										<button type="submit" class="btn_more" onclick="mtn">
											<span aria-hidden="true">더보기(More)</span>
										</button>
									</div>
									<!-- artTab 부분  -->
								</div>
								<!-------- 아티스트 게시판 끝! -------->
								<!-------- 타투이스트 게시판 시작! -------->
								<div id="tab2" class="content" style="display: none">
									<ul class="grid">
										<!-- 타투이스트 시작! M_Class=3 -->
										<c:forEach items="${tattoo}" var="tattoo" varStatus="status">
											<li class="btn_link">
												<div class="file_group">
													<span class="img_box">${tattoo.rename_filepath}</span> <input
														type="hidden" name="renameFile">
												</div>
												<div class="tit_group">
													<span class="title">${tattoo.m_nickname}</span> <input
														type="hidden" name="title">
												</div>
												<div class="btn_ani">
													<a href="<%=request.getContextPath()%>/artist/tattoopage.do?artist_nick=${tattoo.m_nickname}"
														class="btn_link"> <span class="arrow"> <img
															src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
													</span>
													</a>
												</div>
											</li>
										</c:forEach>
										<!-- 타투이스트 끝! -->
									</ul>
									<!-- tattoo_더보기 버튼입니다.  -->
									<div class="tabmore">
										<button type="submit" class="btn_more" onclick="ttn">
											<span aria-hidden="true">더보기(More)</span>
										</button>
									</div>
								</div>
								<!-------- 타투이스트 게시판 끝! -------->
							</form>
						</div>
						<!-- artist부분  -->
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
	<script type="text/javascript">
		//tab메뉴  
		function art() {
			console.log('art함수');
			$('#tab1').css('display', 'block');
			$('#tab2').css('display', 'none');
		}

		function tat() {
			console.log('tat함수');
			$('#tab1').css('display', 'none');
			$('#tab2').css('display', 'block');
		}

		//onclick으로 더보기 해보자!
		//뮤지션
		function mtn() {
			console.log('mtn');

		}

		//타투이스트
		function ttn() {
			console.log('ttn');
		}
		
	</script>
</body>
</html>