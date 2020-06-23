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
												<th id="bdNo">삭제</th>
												<th id="bdTitle">시청 콘텐츠</th>
												<th id="bdWriter">아티스트</th>
												<th id="bdDate">시청일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${MyRecordList.mrlist}" var="recordlist"
												varStatus="rlStatus">
												<tr>
													<td id="${recordlist.mr_num}"class="prNo" style="text-align: center;">
														<button class="listdelete" id="del${recordlist.mr_num}"
															onclick="myRecordDelete('#del${recordlist.mr_num}')">삭제</button>
													</td>
													<td class="prTitle"><a
														href="<%=request.getContextPath()%>/artist/artistvideoview.do?select_file=${recordlist.au_file}">${recordlist.m_nickname}</a></td>
													<td class="prWriter" style="text-align: center;">${recordlist.m_nickname}</td>
													<td class="prDate" style="text-align: center;">${recordlist.mr_date}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- 페이지부분 -->
									<div class="bdpage" id="bdpage">
										<!-- 홍보게시판 페이징 처리기능 -->
										<div class="bdpaging">
											<a
												href="<%=request.getContextPath()%>/member/myRecordList.do"
												class="nav first" style="background-color: white">&lt;&lt;</a>
											<c:choose>
												<c:when test="${paging.currentPage > 1 }">
													<a
														href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${paging.currentPage-1}"
														class="nav prev" style="background-color: white"> &lt;</a>
												</c:when>
												<c:otherwise>
													<a
														href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${paging.blockStart}"
														class="nav prev" style="background-color: white"> &lt;</a>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="${paging.blockStart}"
												end="${paging.blockEnd}" var="page">
												<a
													href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${page}"
													class="num active"><span>${page}</span></a>
											</c:forEach>
											<c:choose>
												<c:when test="${paging.currentPage+1 > paging.lastPage }">
													<a
														href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${paging.blockEnd}"
														class="nav next" style="background-color: white"> &gt;</a>
												</c:when>

												<c:otherwise>
													<a
														href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${paging.currentPage+1}"
														class="nav next" style="background-color: white"> &gt;</a>
												</c:otherwise>
											</c:choose>
											<a
												href="<%= request.getContextPath() %>/member/myRecordList.do?cPage=${paging.lastPage}"
												class="nav last" style="background-color: white">&gt;&gt;</a>
										</div>
									</div>
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
		function myRecordDelete(button) {

			// 클릭한 삭제 버튼이 해당되는 아티스트 닉네임 get
			var mrNum = $(button).parent().attr('id');
			
			console.log(mrNum);

			$.ajax({
				url : '/springmvc/member/myRecordDelete.do',
				type : 'GET',
				data : {
					"mrNum" : mrNum
				},
				success : function(res) {
					if (res != null) {
						location.href = '/springmvc/member/myPage.do';
					} else {
						alert('기록 삭제에 실패하였습니다. 새로고침 후 다시 시도해주세요.');
					}
				}

			});

		}
	</script>

</body>
</html>