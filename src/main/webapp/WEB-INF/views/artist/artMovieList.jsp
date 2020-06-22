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
	<section id="content_artmovie">
		<article class="artmovie_box">
			<div class="container">
				<div class="row">
					<div class="artmovie_list">
						<form name="artmovie"
							action="<%=request.getContextPath()%>/artist/artistartmovie.do">
							<h3>공연 영상</h3>
							<div class="amovie_board">
								<!-- 영상 콘텐츠 시작 -->
								<ul>
									<c:forEach items="${artlistvideo}" var="artlist"
										varStatus="artStatus">
										<li class="amovie_box">
											<span class="movie_box">
												<iframe src="https://www.youtube.com/embed/${artlist.au_file}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
											</span><br />
											<span class="aphTitle">글내용 | ${artlist.au_content}</span><br />
											<span class="aphNicname">닉네임 | ${artlist.au_date}</span>
											<div class="btn_phoani">
												<a href="#">
													<span class="aboard_rd"></span>
												</a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- 영상 콘텐츠 끝 -->
							<!-- artist게시판들 클래스 다들 동일 클래스 사용  -->
							<c:if test="${loginInfo.member.m_id eq artist_nick}">
								<button class="atwrite" type="button">글쓰기</button>
							</c:if>
							<!-- 페이징 처리 기능부분  -->
							<div class="artPaging">
								<a href="#">페이지처리할꺼임</a>
							</div>
							<!-- 페이징 처리 기능부분  -->

							<!-- 검색 창 -->
							<div class="artSearch">
								<select name="searchType">
									<option value="write">작성자</option>
									<option value="title">제목</option>
									<option value="wrti">작성자 + 제목</option>
								</select> <input class="art_searchText" type="text" name="searchWord" />
								<button class="art_searchbar">검색</button>
							</div>
						</form>
					</div>
					<!-- 검색 창 -->
				</div>
			</div>

		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->

</body>
</html>
