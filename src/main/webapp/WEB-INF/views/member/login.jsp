<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<section id="content_login">
		<article class="login_box">
			<div class="container">
				<div class="row">
					<div class="log">
						<div class="log-box">
							<div class="logImg">
								<ul>
									<li>
										<img src="<%=request.getContextPath()%>/resources/img/log_img0.jpg" alt="img" />
									</li>
									<li>
										<img src="<%=request.getContextPath()%>/resources/img/log_img1.jpg" alt="img" />
									</li>
									<li>
										<img src="<%=request.getContextPath()%>/resources/img/log_img2.jpg" alt="img" />
									</li>
									<li>
										<img src="<%=request.getContextPath()%>/resources/img/log_img3.jpg" alt="img" />
									</li>
								</ul>
							</div>
						</div>
						<form class="log-formBox">
							<h2>로그인</h2>

							<div class="log-form">
								<label class="form-text">아이디</label> <input type="text"
									class="inputText" name="userID" placeholder="">
							</div>

							<div class="log-form">
								<label class="form-text">비밀번호</label> <input type="password"
									class="inputText" name="userPWD" placeholder="">
							</div>

							<div class="findUser">
								<ul>
									<li class="find_text"><a
										href="<%=request.getContextPath()%>/member/memberFind.do">아이디찾기</a>&nbsp;|&nbsp;</li>
									<li class="find_text"><a
										href="<%=request.getContextPath()%>/member/memberFind.do">비밀번호찾기</a>&nbsp;|&nbsp;</li>
									<li class="find_text"><a
										href="<%=request.getContextPath()%>/member/join.do">회원가입</a></li>
								</ul>
							</div>
							<button id="logBut" type="button" onclick="login">로그인</button>
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

	<!-- Javascript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {

			//img 불러줄 div를 가져와!
			var $img = $(".logImg").find("ul");
			
			//이미지 폭
			var $width = $img.children().outerWidth();
			//이미지 높이
			var $height = $img.children().outerHeight();
			//이미지 갯수
			var $length = $img.children().length;
			var rollingId;

			//정해진 초마다 함수 실행
			rollingId = setInterval(function() { rollingStart(); }, 3000);

			function rollingStart() {
				$img.css("width", $width * $length + "px");
				$img.css("height", $height + "px");
				
				$img.animate({left:-$width + "px"}, 1500, function(){
					$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
					$(this).find("li:first").remove();
					$(this).css("left", 0);
				});
			}
		});
	</script>

</body>
</html>