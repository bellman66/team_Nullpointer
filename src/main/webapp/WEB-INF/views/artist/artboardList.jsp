<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>ArtistMove_list</title>
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
	<section id="content_artboard">
		<article class="artboard_box">
			<div class="container">
				<div class="row">
					<div class="artboard_form">
						<div class="artboard-table">
							<form name="artboard"
								action="<%=request.getContextPath()%>/artist/artboardlist.do">
								<h3>소통 게시판</h3>
								<table>
									<colgroup>
										<!-- 넓이 지정  -->
										<col width="6%">
										<col width="45%">
										<col width="15%">
										<col width="10%">
									</colgroup>

									<thead>
										<tr>
											<th id="artNo">번호</th>
											<th id="artTitle">제목</th>
											<th id="artWriter">작성자</th>
											<th id="artDate">등록일</th>
										</tr>
									</thead>

									<!-- forEach로 돌릴꺼에욤 소통게시판 B_CATEGORY = 3 / 후기게시판 B_CATEGORY = 4 -->
									<tbody>
										<!-- <tr>
											<td class="artNo"></td>
											<td class="artTitle"><a href="#"></a></td>
											<td class="artWriter"></td>
											<td class="artDate"></td>
										</tr> -->
										<c:forEach items="${artboardlist.blist}" var="artboardlist">
											<input type="hidden" value="${artboardlist.b_num}" name="bnoList"/>
										     	<tr>
											        <td class="artNo">${artboardlist.rnum}</td>
											        <td class="artTitle"><a href="<%= request.getContextPath() %>/artist/aboardRead.do?b_num=${artboardlist.b_num}">${artboardlist.b_title}</a></td>
											        <td class="artWriter">${artboardlist.m_id}</td>
											        <td class="artDate">${artboardlist.b_date}</td>
										    	</tr>
					        			</c:forEach>
										
									</tbody>
									<!-- forEach로 돌릴꺼에욤 소통게시판 B_CATEGORY = 3 / 후기게시판 B_CATEGORY = 4 -->
								</table>
								<c:if test="${sessionScope.loginInfo != null }">
									<button class="atwrite" type="button"  onclick="location.href='<%= request.getContextPath() %>/artist/aboardWrite.do'">글쓰기</button>
								</c:if>
							</form>
						</div>

						<!-- 페이징 처리 기능부분  -->
						<div class="artPaging" style="text-align: center;">
							<c:if test="${aboard  eq 'aboard'}"> 
								<a href="<%= request.getContextPath() %>/artist/artboardlist.do" style="background-color:white">&lt;&lt;</a>
								<c:choose>
									<c:when test="${paging.currentPage > 1 }">
										<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${paging.currentPage-1}" style="background-color:white">  &lt;</a>
									</c:when>
									<c:otherwise>
										<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${paging.blockStart}" style="background-color:white">  &lt;</a>
									</c:otherwise>
								</c:choose>
											   
								<c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
									<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${page}" ><span>${page}</span></a>
								</c:forEach> 
											   
								<c:choose>
									<c:when test="${paging.currentPage+1 > paging.lastPage }">
										<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${paging.blockEnd}" style="background-color:white">  &gt;</a>
									</c:when>
											       
									<c:otherwise>
										<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${paging.currentPage+1}" style="background-color:white">  &gt;</a>
									</c:otherwise>
								</c:choose>
								<a href="<%= request.getContextPath() %>/artist/artboardlist.do?cPage=${paging.lastPage}" style="background-color:white">&gt;&gt;</a>
							</c:if>
							
							<c:if test="${aboard  eq 'search'}"> 
								<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">&lt;&lt;</a>
								<c:choose>
									<c:when test="${paging.currentPage > 1 }">
										<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${paging.currentPage-1}&searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">  &lt;</a>
									</c:when>
									<c:otherwise>
										<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${paging.blockStart}&searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">  &lt;</a>
									</c:otherwise>
								</c:choose>
											   
								<c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
									<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${page}&searchType=${searchType}&searchWord=${searchWord}" ><span>${page}</span></a>
								</c:forEach> 
											   
								<c:choose>
									<c:when test="${paging.currentPage+1 > paging.lastPage }">
										<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${paging.blockEnd}&searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">  &gt;</a>
									</c:when>
											       
									<c:otherwise>
										<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${paging.currentPage+1}&searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">  &gt;</a>
									</c:otherwise>
								</c:choose>
								<a href="<%= request.getContextPath() %>/artist/aboardSearch.do?cPage=${paging.lastPage}&searchType=${searchType}&searchWord=${searchWord}" style="background-color:white">&gt;&gt;</a>
							</c:if>
						</div>
						<!-- 페이징 처리 기능부분  -->

						<!-- 검색 창 -->
						<div class="artSearch">
							<form name="atsearch" action="<%= request.getContextPath() %>/artist/aboardSearch.do">
								<select name="searchType">
									<option value="write">작성자</option>
									<option value="title">제목</option>
									<option value="wrti">작성자 + 제목</option>
								</select> <input class="art_searchText" type="text" name="searchWord" />
								<button class="art_searchbar">검색</button>
							</form>
						</div>
						<!-- 검색 창 -->

					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->

	<!-- JavaScript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>

	

</body>
</html>