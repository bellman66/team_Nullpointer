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
								<li data-tab="tab1" class="artmenu" id="art" onclick="art()"><a
									>인디뮤지션</a></li>
								<li data-tab="tab2" class="artmenu" id="tat" onclick="tat()"><a>타투이스트</a></li>
							</ul>
						</div>
						<!-- tab메뉴 부분 끝 -->

						<!-- artist부분  -->
						<div id="subContent">
							<!-- artTab 부분  -->
							<!-------- 아티스트 게시판 시작! -------->
							<div id="tab1" class="content">
								<form name="artTab"
									action="<%=request.getContextPath()%>/artist/artist.do">
									<!-- artist페이지에서 au_type에 따라 뮤지션과 타투이스트로 나눠서 뿌려줄꺼야! -->
									<ul class="grid">
										<!-- 뮤지션 시작!M_Class = 2 -->
										<c:forEach items="${alist}" var="art" varStatus="status">
											<li class="btn_link"><span class="img_box">${art.rename_filepath}</span>
												<span class="title">${art.m_nickname}</span>
												<div class="btn_ani">
													<a
														href="<%=request.getContextPath()%>/artist/artistpage.do"
														class="btn_link" target="_blank"> <span class="arrow">
															<img
															src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
													</span>
													</a>
												</div></li>
										</c:forEach>
										<!-- 뮤지션 끝! -->
									</ul>
									<!-- artTab 부분  -->
								</form>
							</div>
							<!-------- 아티스트 게시판 끝! -------->

							<!-------- 타투이스트 게시판 시작! -------->
							<div id="tab2" class="content">
								<form name="taTab"
									action="<%=request.getContextPath()%>/artist/tattooist.do">
									<ul class="grid">
										<!-- 타투이스트 시작! M_Class=3 -->
										<c:forEach items="${alist}" var="tattoo" varStatus="status">
											<li class="btn_link"><span class="img_box">${tattoo.rename_filepath}</span>
												<span class="title">${tattoo.m_nickname}</span>
												<div class="btn_ani">
													<a href="<%=request.getContextPath()%>/artist/tattopage.do"
														class="btn_link" target="_blank"> <span class="arrow">
															<img
															src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
													</span>
													</a>
												</div>
												</li>
										</c:forEach>
										<!-- 타투이스트 끝! -->
									</ul>
								</form>
							</div>
							<!-------- 타투이스트 게시판 끝! -------->

						</div>
						<!-- artist부분  -->

						<button type="button" class="tabmore">더보기</button>
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
		/* 	$(function() {
				//tab operation
				$('#tat').click(function() {
					var active = $(this).attr('data-tab');

					$('li').css('border-bottom', '#0c0c13');
					$('li').css('color', '#0c0c13');
					$(this).css('border-bottom', '#f5b041');
					$(this).css('color', '#f5b041');
					$.ajax({
						type : 'GET',
						url : "springmvc/artist/tattooist.do",
						//dataType : "html",
						error : function() {
							alert('통신실패!');
			},
							success : function() {
								$('#subContent').html().remove();
								$('#subContent').html('tttttttttttttt');
							}
						});
					});
					$('#art').click();
				}); */
				
			$(function art(){
				document.artTab.submit();
					return true;
				}
			});
				$(function tat(){
					document.taTab.submit();
						return true;
					}
				});
	</script>
</body>
</html>