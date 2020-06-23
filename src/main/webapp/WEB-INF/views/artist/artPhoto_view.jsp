<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>ArtistBoard_View</title>
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
	<section id="content_artphView">
		<article class="artphView_box">
			<div class="container">
				<div class="row">
					<div class="artView">
						<div class="artpath">
							<h3>공연사진</h3>
							<p>공연사진게시판입니다.</p>
						</div>
						<div class="artTable">
							<form name="aPhotoView" action="<%=request.getContextPath()%>/artist/artphotoview.do">
								<div class="aphotoForm">
									<div id="aview_board">게시판종류</div>
									<div class="aview_board">b_Category</div>
									<!-- 공연사진값을 안의 div에 던져주자!!! 스크립트랑 css로 잡아줄것! -->
									<div class="av_view">
										<div>slick1</div>
										<div>slick2</div>
										<div>slick3</div>
										<div>slick4</div>
										<div>slick5</div>
										<div>slick6</div>
										<div>slick7</div>
										<div>slick8</div>
									</div>
									<!-- 공연사진값을 안의 div에 던져주자!!! -->
								</div>
							</form>
							

							<!-- 목록, 수정(작성한 아이디만), 취소 -->
							<div class="aboard_btn">
								<button class="btn_list" type="button">목록</button>
								<button class="btn_modify" type="button">수정</button>
								<button class="btn_pass" type="button">취소</button>
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

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>
	
</body>
</html>