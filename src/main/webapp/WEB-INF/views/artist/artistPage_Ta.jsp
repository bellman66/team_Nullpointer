<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>TattooistPage</title>
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
	<section id="content_tat">
		<article class="tat-box">
			<div class="container">
				<div class="row">
					<div class="tattoform">
						<form name="tattoForm" action="<%=request.getContextPath()%>/artist/tattoopage.do">
							<div class="tatto-Table">
								<div class="tatto-id">
									<h3>타투이스트</h3>
									<img class="atprofile"
										src="/springmvc/resources/upload/${loginInfo.member.rename_filepath}" />
									<div class="tatto-modify">
										<label for="artPicture" class="tatto_file"> <input
											type="file" name="profile" id="userPicture"
											accept="image/jpg,image/jpeg,image/png,image/gif,image/bmp" /></label>
									</div>
									<div class="tatto-text">
										<p>안녕하세요 홍대에 있는 <br>
										타투이스트입니다.</p>
									</div>
								</div>
								<div class="tatto-menu">
									<div class="tatto-fan1">
										<div class="tatto-video">
											<h6>타투 진행영상</h6>
											<ul>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
											</ul>
											<a href="<%=request.getContextPath()%>/artist/artist-video"
												class="more" title="더 보기">More</a>
										</div>
										<div class="tatto-photo">
											<h6>타투 사진</h6>
											<ul>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
												<li><a href="#"><img
														src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg)"></a></li>
											</ul>
											<a href="<%=request.getContextPath()%>/artist/artist-photo"
												class="more" title="더 보기">More</a>
										</div>
									</div>
									<div class="tatto-fan2">
										<div class="tatto-schedule">
											<h6>예약 일정</h6>
											<ul>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
											</ul>
											<a
												href="<%=request.getContextPath()%>/artist/artist-schedule"
												class="more" title="더 보기">More</a>
										</div>
										<div class="tatto-board">
											<h6>후기 게시판</h6>
											<ul>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
											</ul>
											<a href="<%=request.getContextPath()%>/artist/artist-board"
												class="more" title="더 보기">More</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
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