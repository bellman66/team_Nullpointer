<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>MemberFind</title>
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
	<section id="content_mfind">
		<article class="memberfind_box">
			<div class="container">
				<div class="row">
					<div class="memberfind">
					<form name="findM" action="<%=request.getContextPath()%>/member/memberfind.do" >
						<div class="idfind_box">
							<h2>아이디 찾기</h2>
							<label id="findId" class="findInput" for="id">아이디</label>
							&nbsp;&nbsp;
							<input id="id" name="id" type="text"maxlength="30" /><br/>
							<label class="findInput" for="id">이메일주소</label>
							&nbsp;&nbsp;
							<input id="id" name="id" type="text"maxlength="30" /><br/>
							<button id="idfind" class="find" type="submit" onclick="">검색</button>
						</div>
						
						<div class="pwdfind_box">
							<h2>비밀번호 찾기</h2>
							<label class="findInput" for="pwd">찾으시려는 비밀번호의 아이디를 입력해주세요</label>
							&nbsp;&nbsp;
							<input id="id" name="id" type="text"maxlength="30" />
							<button id="pwfind" class="find" type="submit" onclick="">검색</button>
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