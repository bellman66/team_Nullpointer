<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>myPage</title>
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
	<section id="content_pg">
		<article class="mypage_Basic">
			<div class="container">
				<div class="row">
					<div class="mypage-box">
						<!-- 회원정보 수정 부분 -->
						<form name="mypageForm" method="post"
							enctype="multipart/form-data"
							action="<%=request.getContextPath()%>/member/infoModify.do"
							onsubmit="return modify()">
							<div class="pageform">
								<h3>${loginInfo.member.m_id}님의마이페이지</h3>

								<!-- ID, 프로필 사진 부분 시작 -->
								<div class="mypage_id">
									<img class="profile"
										src="/springmvc/resources/upload/${loginInfo.member.rename_filepath}" />
									<div class="profile_modify">
										<label for="userPicture" class="pm_file"> <input
											type="file" name="profile" id="userPicture"
											accept="image/jpg,image/jpeg,image/png,image/gif,image/bmp" />
										</label>
									</div>
								</div>
								<!-- ID, 프로필 사진 부분 끝 -->
								<!-- 회원 정보 부분 시작 -->
								<div class="mypage_info">
									<h4>회원 정보</h4>
									<hr>
									<div class="info_modify">
										<table>
											<tr>
												<td class="mypage_text">이름</td>
												<td>${loginInfo.member.m_name}</td>
											</tr>
											<tr>
												<td class="mypage_text">아이디</td>
												<td>${loginInfo.member.m_id}</td>
											</tr>
											<tr>
												<td class="mypage_text">닉네임</td>
												<td><input type="text" name="NICKNAME" id="NICKNAME"
													placeholder="${loginInfo.member.m_nickname}"
													class="inputText" maxlength="15" />
													<button class="overlap" type="button" onclick="nickCheck()">닉네임
														중복체크</button> <br> <span id="nickCheckMsg"></span></td>
											</tr>
											<tr>
												<td class="mypage_text">비밀번호</td>
												<td><input type="password" name="USER_PWD"
													id="USER_PWD_MODIFY" class="inputText" class="pw"
													maxlength="30" />
													<span id="pwd-text">영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.</span>
												</td>
											</tr>
											<tr>
												<td class="mypage_text">비밀번호 확인</td>
												<td><input type="password" name="PWD_CHECK"
													id="PWD_MODIFY_CHECK" class="inputText" maxlength="30" />
													<span id="same" style="display: none;">비밀번호가 일치합니다.</span>
													<span id="different"
													style="display: none; color: #d92742; font-weight: bold;">비밀번호가
														일치하지 않습니다.</span></td>
											</tr>
											<tr>
												<td class="mypage_text">한 줄 소개</td>
												<td><input type="text" name="WORD" id="WORD"
													placeholder="${word}" class="inputText" maxlength="50" /></td>
											</tr>
											<tr>
												<td class="mypage_text">휴대전화</td>
												<td>
													<select name="USER_TELL1" id="USER_TELL1" class="inputText">
														<option value="${loginInfo.member.m_tell1}" selected
															disabled hidden>${loginInfo.member.m_tell1}</option>
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="019">019</option>
												</select> &nbsp;-&nbsp; 
												<input type="text" name="USER_TELL2"
													value="${loginInfo.member.m_tell2}"
													placeholder="${loginInfo.member.m_tell2}" size="5"
													maxlength="4" class="inputText" /> &nbsp;-&nbsp; 
												<input
													type="text" name="USER_TELL3"
													value="${loginInfo.member.m_tell3}"
													placeholder="${loginInfo.member.m_tell3}" size="5"
													maxlength="4" class="inputText" /></td>
											</tr>
											<tr>
												<td class="mypage_text">이메일</td>
												<td>
													<input type="text" name="USER_MAIL"
														value="${loginInfo.member.m_email1}"
														placeholder="${loginInfo.member.m_email1}" maxlength="50"
														class="inputText" />&nbsp;@&nbsp; 
													<select
													name="USER_MAIL2" class="inputText" style="width: 200px">
														<option value="${loginInfo.member.m_email2}" selected
															disabled hidden>${loginInfo.member.m_email2}</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="gmail.com">gmail.com</option>
														<option value="nate.com">nate.com</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
									<hr>
									<button class="info_modifybut">수정</button>
									<button type="button" class="user_withdrawal"
										onclick="withdrawal()">탈퇴</button>
									<div class="dim-layer">
										<div class="dimBg"></div>
										<div id="layer2" class="pop-layer">
											<div class="pop-container">
												<div class="pop-conts">
													<!--content //-->
													<p class="ctxt mb20">
														정말로 회원 탈퇴하시겠습니까?<br>탈퇴를 원하시는 경우, 확인을 눌러주세요.
													</p>

													<div class="btn-r">
														<a href="#" class="btn-withdrawal">확인</a>
														<a href="#" class="btn-layerClose">취소</a>
													</div>
													<!--// content-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 회원 정보 부분 끝 -->
						</form>
						<!-- 회원정보 수정 끝 -->
						<!-- 업로드 목록 부분 시작 -->
						<div class="mypage_upload">
							<h6>나의 업로드 목록</h6>
							<ul>
								<c:forEach items="${uploadList}" var="upload"
									varStatus="uploadnum">
									<c:if test="${uploadnum.index < 5}">
										<li><a href="#">${upload.au_content}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							<c:if test="${fn:length(uploadList) > 5}">
								<a href="<%=request.getContextPath()%>/artist/artistvideo.do?artist_nick=${loginInfo.member.m_nickname}" class="more" title="더 보기">More</a>
							</c:if>
						</div>
						<!-- 업로드 목록 부분 끝 -->
						<!-- 스케줄 부분 시작 -->
						<div class="mypage_schedule">
							<h6>나의 스케줄</h6>
							<ul>
								<c:forEach items="${scheduleList}" var="schedule"
									varStatus="schedulenum">
									<li>
										<a href="<%=request.getContextPath()%>/schedule/schedule.do">${schedule.as_content}</a>
										<span>${fn:substring(schedule.as_start_date,0,10)}</span>
									</li>
								</c:forEach>
							</ul>
							<c:if test="${fn:length(uploadList) == 5}">
								<a href="<%=request.getContextPath()%>/schedule/schedule.do" 
									class="more" title="더 보기">More</a>
							</c:if>
						</div>
						<!-- 스케줄 부분 끝 -->
						<!-- 지원 내역 부분 시작 -->
						<hr>
						<div class="mypage_money"></div>
						<!-- 지원 내역 부분 끝 -->
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
	<!-- mypage 기본 정보 수정, 탈퇴 -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/mypage.js"></script>
</body>
</html>