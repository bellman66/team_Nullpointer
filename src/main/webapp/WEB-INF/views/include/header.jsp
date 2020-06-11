<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<header id="header">
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="header_menu">
					<c:if test="${sessionScope.loginInfo == null }">
						<a href="<%=request.getContextPath()%>/member/login.do">로그인</a>
						<a href="<%=request.getContextPath()%>/member/join.do">회원가입</a>
					</c:if>	
					<c:if test="${sessionScope.loginInfo != null }">
						<a href="#">${sessionScope.loginInfo.user_name}님환영합니다.</a>
						<a href="<%=request.getContextPath()%>/member/myPage.do">마이페이지</a>
						<a href="#">로그아웃</a>
					</c:if>
				</div>
				<div class="header_tit" id="header_tit" onclick="reload()">
					<h1>Insert The Title</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- js 링크 -->
	<!-- title 부분 클릭 시 메인화면 리로드 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/title.js"></script>
</header>