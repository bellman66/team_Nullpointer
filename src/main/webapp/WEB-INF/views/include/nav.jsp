<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<nav class="nav">
	<div class="container">
		<div class="row">
			<div class="menu">
				<ul>
					<li><a href="<%=request.getContextPath()%>/stream/allstream.do">Live On</a></li>
					<li><a href="<%=request.getContextPath()%>/artist/artist.do">Artist</a></li>
					<li><a href="<%=request.getContextPath()%>/board/schedule.do">스케줄</a></li>
					<li><a href="<%=request.getContextPath()%>/board/boardSH.do">게시판</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>