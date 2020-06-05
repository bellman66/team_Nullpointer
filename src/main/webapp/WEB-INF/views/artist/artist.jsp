<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<div class="artist_list">
						<div class="at-box">
							<!-- tab메뉴 부분 시작 -->
							<div id="atTitle">
								<a href="#" class="atTab" title="atTab1">인디뮤지션</a>
								<a href="#" class="atTab" title="atTab2">타투이스트</a>
							</div>
							
							<div id="artTab">
								<div id="atTab1">
									<div class="art_list">
										<ul id="grid">
											<!-- 1번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션1</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 1번째 뮤지션 끝 -->
											<!-- 2번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션2</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 2번째 뮤지션 끝 -->
											<!-- 3번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션3</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 3번째 뮤지션 끝 -->
											<!-- 4번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션4</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 4번째 뮤지션 끝 -->
											<!-- 5번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션5</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 5번째 뮤지션 끝 -->
											<!-- 6번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션6</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 6번째 뮤지션 끝 -->
											<!-- 7번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션7</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 7번째 뮤지션 끝 -->
											<!-- 8번째 뮤지션 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url(<%=request.getContextPath()%>/resources/img/test1.jpg)"></span>
											<span class="title">인디뮤지션8</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 8번째 뮤지션 끝 -->
										</ul>
									</div>
								</div>
								<div id="atTab2">
									<div class="art_list">
										<ul id="grid">
											<!-- 1번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style="background:url()"></span>
											<span class="title">타투이스트1</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 1번째 타투이스트 끝 -->
											<!-- 2번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트2</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 2번째 타투이스트 끝 -->
											<!-- 3번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트3</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 3번째 타투이스트 끝 -->
											<!-- 4번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트4</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 4번째 타투이스트 끝 -->
											<!-- 5번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트5</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 5번째 타투이스트 끝 -->
											<!-- 6번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트6</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 6번째 타투이스트 끝 -->
											<!-- 7번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트7</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 7번째 타투이스트 끝 -->
											<!-- 8번째 타투이스트 시작 -->
											<li class="btn_link">
											<span class="img_box" style=""></span>
											<span class="title">타투이스트8</span>
											<div class="btn_ani">
												<a href="#" class="btn_link" target="_blank">
													<span class="home"></span>
												</a>
											</div>
											</li>
											<!-- 8번째 타투이스트 끝 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- tab메뉴 부분 끝 -->
							
							<div class="page_btn">
								<a href="#" id="btnMore" class="btn_more">More</a>
							</div>
							
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
	
	<%-- <!-- javascript -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/artist.js"></script> --%>

</body>
</html>