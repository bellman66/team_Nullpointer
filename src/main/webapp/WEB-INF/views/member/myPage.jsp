<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<section id="content">
		<article class="mypage_box">
			<div class="container">
				<div class="row">
					<div class="mypage_table">
						<!-- ID, 프로필 사진, 충전금 내역 부분 시작 -->
						<div class="mypage_id">
							<h3>${sessionScope.loginInfo.m_id}</h3>
							<img class="profile"
								src="/springmvc/resources/upload/${sessionScope.loginInfo.rename_filepath}" />
							<div class="profile_modify">
								<label for="userPicture" class="pm_file"> <input
									type="file" name="profile" id="userPicture"
									accept="image/jpg,image/jpeg,image/png,image/gif,image/bmp" />
								</label>
							</div>
							<div class="mymoney">
								10,000원
								<button id="mypageInput" type="button">충전하기</button>
							</div>
						</div>
						<!-- ID, 프로필 사진, 충전금 내역 부분 끝 -->
						<!-- 회원 정보 부분 시작 -->
						<div class="mypage_info">
							<h4>회원 정보</h4>
							<hr>
							<div class="info_modify">
								<table>
									<tr>
										<td>이름</td>
										<td>${sessionScope.loginInfo.m_name}</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td>${sessionScope.loginInfo.m_id}</td>
									</tr>
									<tr>
										<td>닉네임</td>
										<td></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td></td>
									</tr>
									<tr>
										<td>비밀번호 확인</td>
										<td></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td></td>
									</tr>
								</table>
							</div>
							<hr>
							<button type="button" class=""></button>
							<button type="button" class=""></button>
						</div>
						<!-- 회원 정보 부분 끝 -->
						<!-- 팔로우한 아티스트 부분 시작 -->
						<div class="mypage_follow"></div>
						<!-- 팔로우한 아티스트 부분 끝 -->
						<!-- 시청 기록 부분 시작 -->
						<div class="mypage_history"></div>
						<!-- 시청 기록 부분 끝 -->
						<!-- 지원 내역 부분 시작 -->
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
</body>
</html>