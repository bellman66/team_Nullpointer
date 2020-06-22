<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>My Record List</title>
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
	<section id="content_board">
		<article class="board_box">
			<div class="container">
				<div class="row">
					<div class="board">
						<div id="boardTab">
							<h3>나의 시청 기록</h3>
							<!--탭 콘텐츠 영역 -->
							<div class="tab_container" style="height: 420px;">
								<!-- 공유게시판 부분 시작  -->
								<div id="tab1" class="tab_content">
									<form
										action="<%=request.getContextPath()%>/member/myRecordList.do"
										onsubmit="submit()">
										<table class="bd-Table">
											<colgroup>
												<!-- 넓이 지정  -->
												<col width="6%">
												<col width="45%">
												<col width="15%">
												<col width="10%">
											</colgroup>
											<thead>
												<tr>
													<th id="bdNo">번호</th>
													<th id="bdTitle">시청 콘텐츠</th>
													<th id="bdWriter">아티스트</th>
													<th id="bdDate">시청일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${MyRecordList}" var="mrlist">
													<input type="hidden" value="${mrlist.mr_num}" name="mrList" />
													<tr>
														<td class="prNo" style="text-align: center;">${mrlist.rnum}</td>
														<td class="prTitle"><a
															href="<%= request.getContextPath() %>/board/boardRead.do?b_num=${mrlist.au_num}">${mrlist.m_nickname}</a></td>
														<td class="prWriter" style="text-align: center;">${mrlist.m_nickname}</td>
														<td class="prDate" style="text-align: center;">${mrlist.mr_date}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

										<!-- 페이지부분 -->
										<div class="bdpage" id="bdpage">
											<!-- 홍보게시판 페이징 처리기능 -->
											<ul class="bdpaging">
												<input class="prpr" style="display: none;"></input>
												<a
													href="<%=request.getContextPath()%>/member/myRecordList.do"
													class="nav first" style="background-color: white">&lt;&lt;</a>
												<c:choose>
													<c:when test="${paging.currentPage > 1 }">
														<a
															href="<%= request.getContextPath() %>/member/myRecordList?cPage=${paging.currentPage-1}"
															class="nav prev" style="background-color: white">
															&lt;</a>
													</c:when>
													<c:otherwise>
														<a
															href="<%= request.getContextPath() %>/member/myRecordList?cPage=${paging.blockStart}"
															class="nav prev" style="background-color: white">
															&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="${paging.blockStart}"
													end="${paging.blockEnd}" var="page">
													<a
														href="<%= request.getContextPath() %>/member/myRecordList?cPage=${page}"
														class="num active"><span>${page}</span></a>
												</c:forEach>
												<c:choose>
													<c:when test="${paging.currentPage+1 > paging.lastPage }">
														<a
															href="<%= request.getContextPath() %>/member/myRecordList?cPage=${paging.blockEnd}"
															class="nav next" style="background-color: white">
															&gt;</a>
													</c:when>

													<c:otherwise>
														<a
															href="<%= request.getContextPath() %>/member/myRecordList?cPage=${paging.currentPage+1}"
															class="nav next" style="background-color: white">
															&gt;</a>
													</c:otherwise>
												</c:choose>
												<a href="<%= request.getContextPath() %>/member/myRecordList?cPage=${paging.lastPage}"
													class="nav last" style="background-color: white">&gt;&gt;</a>
											</ul>
										</div>
									</form>
								</div>

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

	<!-- Javascript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/board.js"></script>

	<script type="text/javascript">

		function prSubmit() {
			console.dir("메롱");
			document.pr.submit();
			return true;
		};
	</script>

</body>
</html>