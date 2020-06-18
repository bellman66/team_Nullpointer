<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>회원 탈퇴</title>
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
		<article class="withdrawal">
			<div class="container">
				<div class="row">
					<form class="pwdCheck" method="post"
						action="<%=request.getContextPath()%>/member/leave.do">
						<div class="chk_sentence">
							<p class="title">회원 탈퇴</p>
							<hr>
							<p>회원 탈퇴를 위해 비밀번호를 확인해주세요.<br>비밀번호를 입력하시고 아래 동의란에
								체크하신 뒤, 확인 버튼을 누르시면 탈퇴가 완료됩니다.
							</p>
							<label class="passInput" for="pwd">비밀 번호 입력</label>
							&nbsp;&nbsp;
							<input id="pwd" name="pwd" type="password" maxlength="30" />
						</div>
						<div class="chk_input">
							<div class="withdrawal_checkbox">
								<input type="checkbox" id="customCheck">
								<label class="check_sentence" for="customCheck"> 정말로 회원
									탈퇴하시겠습니까? 동의 후에는 취소할 수 없습니다. </label>
							</div>
							<button type="submit" onclick="return validata()">확인</button>
						</div>
					</form>
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