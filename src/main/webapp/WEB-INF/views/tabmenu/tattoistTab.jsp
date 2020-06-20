<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-------- 타투이스트 게시판 시작! -------->
<form name="taTab" action="<%=request.getContextPath()%>/artist/tattooist.do">
			<div id="tab2" class="content">
				<ul class="grid">
					<!-- 타투이스트 시작! M_Class=3 -->
					<c:forEach items="${alist}" var="tattoo" varStatus="status">
					<li class="btn_link">
						<span class="img_box">${tattoo.rename_filepath}</span> 
						<span class="title">${tattoo.m_nickname}</span>
						<div class="btn_ani">
							<a href="<%=request.getContextPath()%>/artist/tattopage.do" class="btn_link" target="_blank"> 
							<span class="arrow">
								<img src="<%=request.getContextPath()%>/resources/img/icon/arrow.png" />
							</span>
							</a>
							</div>
							</li>
						</c:forEach>
					<!-- 타투이스트 끝! -->
				</ul>
			</div>
</form>
<!-------- 타투이스트 게시판 끝! -------->