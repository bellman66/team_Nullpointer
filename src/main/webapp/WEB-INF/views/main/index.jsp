<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="author" content="Team_Nullpointer">
<title>Main</title>
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

	<!-- content1부분 시작 -->
	<section id="content1">
		<!-- main 화면 대여부분 시작 -->
		<article class="main_box">
			<div class="container">
				<div class="row">
					<div class="main_rent">
						<c:if test="${topStream ne null}">
							<h1>Top Stream Live On</h1>
							<div class="rentVideo">
								<img alt="test"
									src="http://rndso15.synology.me:8080/hls/${topStream.userHashCode}/${topStream.userHashCode}_thumbnail.png" 
									onerror="this.src='<%=request.getContextPath()%>/resources/img/maintest.jpg'" />
							</div>
						</c:if>
						
						<c:if test="${topStream eq null}">
							<h1>Top Stream Live</h1>
							<div class="rentVideo">
								<img alt="test"
									src="<%=request.getContextPath()%>/resources/img/maintest.jpg" />
							</div>
						</c:if>
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
						<h2>Today Content</h2>
						<div class="todayVideo">
							<c:forEach items="${todayList}" var="list" varStatus="listnum">
								<c:if test="${list.au_thumbnail != null}">
									<div id="tv${listnum.index}">
										<a href="${pageContext.request.contextPath}/artist/artistvideoview.do?select_file=${list.au_file}">
										<img src="https://img.youtube.com/vi/${list.au_thumbnail}/0.jpg" width="100%" height="100%">
										</a> 
									</div>
								</c:if>
								<c:if test="${list.au_thumbnail == null}">
									<div id="tv${listnum.index}">
										<a href="${pageContext.request.contextPath}/artist/artphotoview.do?select_file=${list.au_file}">
										<img src="<%=request.getContextPath()%>/resources/upload/${list.au_file}" width="100%" height="100%">
										</a> 
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="best_box">
			<div class="container">
				<div class="row">
					<div class="bestlist">
						<h2>Best Content</h2>
						<div class="bestVideo">
							<c:forEach items="${bestContent}" var="bcon" varStatus="listnum">
								<c:if test="${bcon.au_thumbnail != null}">
									<div id="bv${listnum.index+1}">
										<a href="${pageContext.request.contextPath}/artist/artistvideoview.do?select_file=${bcon.au_file}">
										<img src="https://img.youtube.com/vi/${bcon.au_thumbnail}/0.jpg" width="100%" height="100%"></a> 
									</div>
								</c:if>
								<c:if test="${bcon.au_thumbnail == null}">
									<div id="bv${listnum.index+1}">
										<a href="${pageContext.request.contextPath}/artist/artphotoview.do?select_file=${bcon.au_file}">
										<img src="<%=request.getContextPath()%>/resources/upload/${bcon.au_file}" width="100%" height="100%">
										</a> 
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content2부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->

</body>
</html>