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
							action="<%=request.getContextPath()%>/artist/artContentUpload.do">
							<h3>영상 콘텐츠</h3>
							<div class="amovie_board">
							<!-- artist게시판들 클래스 다들 동일 클래스 사용  -->
							<c:if test="${loginInfo.member != null && loginInfo.member.m_id == param.artist_nick}">
								<button class="atwrite" type="submit">글쓰기</button>
							</c:if>
								<!-- 영상 콘텐츠 시작 -->
								<ul>
									<c:forEach items="${artlistvideo}" var="artlist"
										varStatus="artStatus">
										<c:choose>
											<c:when test="${artStatus.index < 8}">
												<li class="amovie_box">
													<span class="movie_box">
														<iframe src="https://www.youtube.com/embed/${artlist.au_file}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
													</span><br />
													<a href="${pageContext.request.contextPath}/artist/artistvideoview.do?select_file=${artlist.au_file}">
														<span class="aphTitle">content | ${artlist.au_content}</span>
													</a><br />
													<span class="aphNicname">artist | ${artlist.m_nickname}</span>
													<div class="btn_phoani">
														<a href="#">
															<span class="aboard_rd"></span>
														</a>
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li class="amovie_box" style="display: none">
													<span class="movie_box">
														<iframe src="https://www.youtube.com/embed/${artlist.au_file}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
													</span><br />
													<a href="${pageContext.request.contextPath}/artist/artistvideoview.do?select_file=${artlist.au_file}">
														<span class="aphTitle">content | ${artlist.au_content}</span>
													</a><br />
													<span class="aphNicname">artist | ${artlist.m_nickname}</span>
													<div class="btn_phoani">
														<a href="#">
															<span class="aboard_rd"></span>
														</a>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
								<!-- 영상 콘텐츠 끝 -->
							</div>
						</form>
						<!-- 더보기 버튼 시작 -->
						<div class="tabmore">
							<button type="button" class="btn_more" onclick="more()">
								<span aria-hidden="true">더보기(More)</span>
							</button>
						</div>
						<!-- 더보기 버튼 끝 -->
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->
	
	<script type="text/javascript">
	
	function more() {
		$('.amovie_box').css('display', 'block');
	}
	
	</script>

</body>
</html>
