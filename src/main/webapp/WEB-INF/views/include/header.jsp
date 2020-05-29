<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="header_menu">
					<c:if test="${sessionScope.loginInfo == null }">
						<a href="#">로그인</a>
						<a href="#">회원가입</a>
					</c:if>	
					<c:if test="${sessionScope.loginInfo != null }">
						<a href="#">${sessionScope.loginInfo.user_name}님환영합니다.</a>
						<a href="#">마이페이지</a>
						<a href="#">로그아웃</a>
					</c:if>
				</div>
				<div class="header_tit">
					<h1>Insert The Title</h1>
				</div>
			</div>
		</div>
	</div>
</header>