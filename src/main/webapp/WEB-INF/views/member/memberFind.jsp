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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.5.1.js"></script>
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
					<form name="findM" action="<%=request.getContextPath()%>/member/findId.do" >
						<div class="idfind_box">
							<h2>아이디 찾기</h2>
							&nbsp;&nbsp;
							<label class="findInput" for="id_email">이메일주소 입력 : </label>
							&nbsp;&nbsp;
							<input id="id_email" name="id_email" type="text"maxlength="30" />
							<button id="idFind" class="idFind" type="submit">검색</button>
						</div>
					</form>
					
					<form name="findM" action="<%=request.getContextPath()%>/member/findPwd.do" >
						<div class="pwdfind_box">
							<h2>비밀번호 찾기</h2>
							<label class="findInput" for="pwd">찾으시려는 비밀번호의 아이디를 입력해주세요</label>
							&nbsp;&nbsp;
							<input id="pwd_id" name="pwd_id" type="text"maxlength="30" /> <br>
							<label class="findInput" for="pwd_email">이메일주소 입력 : </label>
							<input id="pwd_email" name="pwd_email" type="text"maxlength="30" /> <br>
							<button id="pwfind" class="pwfind" type="submit" onclick="">검색</button>
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
	
	<!-- <script type="text/javascript">
		$('#idFind').on('click' , function () {
			let m_email = $('#id_email').val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/findId.do" ,
				method : "GET" ,
				data : {
					"m_email" : m_email
				} ,
				success : function (data) {
					if(data == true){
						alert("이메일로 전송되었습니다.")
					}
					else {
						alert("일치하는 이메일이 존재하지 않습니다.")
					}
				}
			});
		})
		
		$('#pwfind').on('click' , function () {
			let pwd_id = $('#pwd_id').val();
			let pwd_email = $('#pwd_email').val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/findPwd.do" ,
				method : "GET" ,
				data : {
					"pwd_id" : pwd_id ,
					"pwd_email" : pwd_email
				} ,
				success : function (data) {
					if(data == true){
						alert("이메일로 전송되었습니다.")
					}
					else {
						alert("일치하는 이메일이 존재하지 않습니다.")
					}
				}
			});
		})
	
	</script> -->

</body>
</html>