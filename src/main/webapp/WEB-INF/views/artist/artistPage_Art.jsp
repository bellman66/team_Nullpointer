<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>ArtistPage</title>
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
	<section id="content_artpg">
		<article class="art-box">
			<div class="container">
				<div class="row">
					<div class="artForm">
						<div class="art-Table">
							<div class="art-id">
								<h3>${mlist.m_nickname}</h3>
								<img class="atprofile"
									src="/springmvc/resources/upload/${mlist.rename_filepath}" />
								<div class="art-text">
									<p id="test">${aplist.a_word}</p>
								</div>
								<div class="art-subscribe">
									♥${aplist.a_subscribe}
								</div>
							</div>
							<div class="art-menu">
								<div class="art-fan1">
									<div class="art-video">
										<h6>공연 영상</h6>
										<ul>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></a></li>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></a></li>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></a></li>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></a></li>
											<li><a href="#"><img
													src="<%=request.getContextPath()%>/resources/img/artist/bus.jpg"></a></li>
										</ul>
										<a href="<%=request.getContextPath()%>/artist/artistvideo.do"
											class="more" title="더 보기">More</a>
									</div>
									<div class="art-photo">
										<h6>공연 사진</h6>
										<ul>
											<c:forEach items="${artlist}" var="artlist"
												varStatus="status" begin="0" end="4">
												<li><a href="#"><img class="atprofile"
														src="/springmvc/${artlist.au_file}" /></a></li>
											</c:forEach>
										</ul>
										<a href="<%=request.getContextPath()%>/artist/artistphoto.do?art_nickname=${artlist.m_nickname}"
											class="more" title="더 보기">More</a>
									</div>
									
									<div class="ta_cash" id="${loginInfo.member.m_id}">
										<button type="button" onclick="donate()">후원</button>
										<div class="dim-layer" id="dim-layer-do">
											<div class="dimBg"></div>
											<div id="layer2" class="pop-layer">
												<div class="pop-container">
													<div class="pop-conts">
														<!--content //-->
														<p class="ctxt mb20">${mlist.m_nickname}님을 후원하시겠습니까?<br>
															후원하시려면 아래 '확인' 버튼을 눌러주세요.</p>
														<div class="btn-r">
															<a href="#" class="btn-yes">확인</a> <a href="#"
																class="btn-layerClose">취소</a>
														</div>
														<!--// content-->
													</div>
												</div>
											</div>
										</div>
										<button type="button" onclick="subscribe()">구독</button>
										<div class="dim-layer" id="dim-layer-sub">
											<div class="dimBg"></div>
											<div id="layer3" class="pop-layer">
												<div class="pop-container">
													<div class="pop-conts">
														<!--content //-->
														<p class="ctxt mb20">${mlist.m_nickname}님을 구독하였습니다.<br>
															마이페이지에서 확인하시겠습니까?</p>
														<div class="btn-r">
															<a href="#" class="btn-yes">확인</a> <a href="#"
																class="btn-layerClose">취소</a>
														</div>
														<!--// content-->
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="art-fan2">
									<div class="art-schedule">
										<h6>공연 일정</h6>
										<ul>
											<c:forEach items="${aslist}" var="artsclist">
												<li><a
													href="<%=request.getContextPath()%>/artist/artistschedule.do">
														${artsclist.ats_content}</a><span>${fn:substring(artsclist.ats_start_date,0,10)}</span></li>
												<%-- <li><a href="<%=request.getContextPath()%>/artist/artistschedule.do">member + myartist 내역 불러와서 foreach로
															돌릴 예정</a></li>
													<li><a href="<%=request.getContextPath()%>/artist/artistschedule.do">member + myartist 내역 불러와서 foreach로
															돌릴 예정</a></li>
													<li><a href="<%=request.getContextPath()%>/artist/artistschedule.do">member + myartist 내역 불러와서 foreach로
															돌릴 예정</a></li>
													<li><a href="<%=request.getContextPath()%>/artist/artistschedule.do">member + myartist 내역 불러와서 foreach로
															돌릴 예정</a></li> --%>
											</c:forEach>
										</ul>
										<c:if test="${fn:length(aslist) > 5 || fn:length(aslist) == 0}">
											<a
												href="<%=request.getContextPath()%>/artist/artistschedule.do"
												class="more" title="더 보기" style="margin-top:100px;">More</a>
										</c:if>
									</div>

										<div class="art-board">
											<h6>소통 게시판</h6>
											<ul>
												<c:forEach items="${artboardlist.blist}" var="artboardlist">
													<li><a href="<%= request.getContextPath() %>/artist/aboardRead.do?b_num=${artboardlist.b_num}"><!-- 상세보기 페이지로 이동시킬것 -->
													${artboardlist.b_title}</a><span style="float: right;">작성자 : ${artboardlist.m_id}</span></li>
												<!-- <li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li>
												<li><a href="#">member + myartist 내역 불러와서 foreach로
														돌릴 예정</a></li> -->
												</c:forEach>
											</ul>
											<c:if test="${fn:length(artboardlist.blist) > 5 || fn:length(artboardlist.blist) == 0}">
												<a href="<%=request.getContextPath()%>/artist/artboardlist.do"
													class="more" title="더 보기" style="margin-top:100px;">More</a>
											</c:if>
									</div>
								</div>
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

	<!-- js 링크 -->
	<!-- 아티스트 회원 후원금 결제 시스템 i'mport api -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/donate.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
</body>
</html>