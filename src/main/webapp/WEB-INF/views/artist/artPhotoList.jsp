<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>ArtistPhoto_list</title>
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
	<section id="content_artphoto">
		<article class="artphoto_box">
			<div class="container">
				<div class="row">
					<div class="artphoto_list">
							<form name="artphoto"
								action="<%=request.getContextPath()%>/artist/artistphoto.do">
								<h3>공연 사진</h3>
								<div class="aphoto_board">
									<ul>
										<!-- forEach야 힘내거라!!! -->
										<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/today.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
																					<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/today.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
										<!-- forEach야 힘내거라!!! -->
										
										<!-- forEach야 힘내거라!!! -->
										<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/today.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
											<li class="amovie_box">
										<span class="photo_box"><img src="<%=request.getContextPath()%>/resources/img/artist/today.jpg"></span><br/> 
										<span class="aphTitle">글내용 | </span><br/> 
										<span class="aphNicname">닉네임 | </span>
										<span class="a_date">20.06.22</span>
											<div class="btn_phoani">
												<a href="#"> <span class="aboard_rd"></span>
												</a>
											</div>
											</li>
										<!-- forEach야 힘내거라!!! -->
									</ul>
								</div>

								<!-- artist게시판들 클래스 다들 동일 클래스 사용  -->
								<button class="atwrite" type="button">글쓰기</button>
							</form>
						</div>
					</div>
					<!-- 검색 창 -->
				</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- footer부분 끝 -->

</body>
</html>