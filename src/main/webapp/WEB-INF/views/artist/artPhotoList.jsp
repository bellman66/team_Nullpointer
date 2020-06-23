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
							action="<%=request.getContextPath()%>/artist/artContentUpload.do">
							<div>
								<h3>사진 콘텐츠</h3>
								<c:if test="${loginInfo.member != null && loginInfo.member.m_id == param.artist_nick}">
									<button class="atwrite" type="button">글쓰기</button>
								</c:if>
							</div>
							<div class="aphoto_board">
								<!-- 영상 콘텐츠 시작 -->
								<ul>
									<c:forEach items="${artlistphoto}" var="artlist"
										varStatus="status">
										<c:choose>
											<c:when test="${status.index < 8}">
												<li class="amovie_box">
													<span class="photo_box">
														<img src="<%=request.getContextPath()%>/resources/upload/${artlist.au_file}">
													</span>
													<br /> 
													<span class="aphTitle">content | ${artlist.au_content}</span> <br />
													<span class="aphNicname">artist | ${artlist.m_nickname}</span> <br />
													<span class="auLike">like | ${artlist.au_like}</span>
													<div class="btn_phoani">
														<a href="#">
															<span class="aboard_rd"></span>
														</a>
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li class="amovie_box" style="display:none">
													<span class="photo_box">
														<img src="<%=request.getContextPath()%>/resources/upload/${artlist.au_file}">
													</span>
													<br /> 
													<span class="aphTitle">content | ${artlist.au_content}</span> <br />
													<span class="aphNicname">artist | ${artlist.m_nickname}</span> <br />
													<span class="auLike">like | ${artlist.au_like}</span>
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
						<div class="tabmore">
							<button type="button" class="btn_more" onclick="more()">
								<span aria-hidden="true">더보기(More)</span>
							</button>
						</div>
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

	<!-- javascript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/photoList.js"></script>
		
	<script type="text/javascript">
	
	function more() {
		$('.amovie_box').css('display', 'block');
	}
	
	</script>

</body>
</html>