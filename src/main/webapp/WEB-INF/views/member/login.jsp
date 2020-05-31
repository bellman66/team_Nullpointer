<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Login</title>
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
		<article class="login_box">
			<div class="container">
				<div class="row">
					<div class="log_table">
						<h1>로그인</h1>
						<div class="logform">
							<table>
								<tr>
									<th id="userId">아이디</th>
									<td><input type="text" name="USER_ID" maxlength="20" /></td>
								</tr>
								<tr>
									<th id="userPw">비밀번호</th>
									<td><input type="password" name="USER_PWD" maxlength="30" /></td>
								</tr>
							</table>
							<div class="findUser">
								<ul>
									<li><a href="#">아이디찾기</a></li>
									<li><a href="#">비밀번호찾기</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>
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
</body>
</html>