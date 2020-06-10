<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Notice</title>
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
							<!--탭 메뉴 영역 -->
							<ul class="tabs">
								<li><a href="#tab1">홍보 게시판</a></li>
								<li><a href="#tab2">공유 게시판</a></li>
							</ul>

							<!--탭 콘텐츠 영역 -->
							<div class="tab_container">
								<!-- 공유게시판 부분 시작  -->
								<div id="tab1" class="tab_content">
									<form action="<%=request.getContextPath()%>/board/boardPR.do">
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
													<th id="bdTitle">홍보내용</th>
													<th id="bdWriter">아티스트</th>
													<th id="bdDate">등록일</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td class="shNo">1</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">2</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">3</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">4</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">5</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">6</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">7</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">8</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">9</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
												<tr>
													<td class="shNo">10</td>
													<td class="shTitle">홍보내용</td>
													<td class="shWriter">아티스트</td>
													<td class="shDate">20.06.10</td>
												</tr>
											</tbody>
										</table>

										<!-- 페이지부분 -->
										<div class="bdpage">
											<ul class="bdpaging">
												<li><a href="#"><</a></li>
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">></a></li>
											</ul>
										</div>

										<!-- 검색 창 -->
										<div class="bdsearch">
											<form action="">
												<select class="searchType">
													<option value="" selected disabled hidden>분류</option>
													<option value="write">작성자</option>
													<option value="title">제목</option>
													<option value="wrti">작성자 + 제목</option>
												</select> <input class="searchText" type="text" name="searchWord" />
												<input class="dbSearch" type="button" value="검색하기" />
											</form>
										</div>

										<!-- 버튼 -->
										<button id="bdWrite" type="button" onclick="write">글쓰기</button>
									</form>
								</div>

								<!-- 홍보게시판 부분 시작  -->
								<div id="tab2" class="tab_content">
									<form action="<%=request.getContextPath()%>/board/boardSH.do">
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
													<th id="bdTitle">제목</th>
													<th id="bdWriter">작성자</th>
													<th id="bdDate">등록일</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td class="prNo">1</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">2</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">3</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">4</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">5</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">6</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">7</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">8</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">9</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
												<tr>
													<td class="prNo">10</td>
													<td class="prTitle">공유게시판입니다</td>
													<td class="prWriter">작성자</td>
													<td class="prDate">20.06.10</td>
												</tr>
											</tbody>
										</table>

										<!-- 페이지부분 -->
										<div class="bdpage">
											<ul class="bdpaging">
												<li><a href="#"><</a></li>
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">></a></li>
											</ul>
										</div>

										<!-- 검색 창 -->
										<div class="bdsearch">
											<form action="">
												<select name="searchType">
													<option value="selected disabled hidden">분류</option>
													<option value="write">작성자</option>
													<option value="title">제목</option>
													<option value="wrti">작성자 + 제목</option>
												</select> 
												<input class="searchText" type="text" name="searchWord" />
												<input class="dbSearch" type="button" value="검색하기" />
											</form>
										</div>

										<!-- 버튼  -->
										<button id="bdWrite" type="button" onclick="write">글쓰기</button>
									</form>
								</div>
								<!-- 홍보게시판 부분 끝  -->
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
		$(document).ready(function() {

			$(".tab_content").hide();
			$("ul.tabs li:first").addClass("active").show();
			$(".tab_content:first").show();

			$("ul.tabs li").click(function() {

				$("ul.tabs li").removeClass("active");
				$(this).addClass("active");
				$(".tab_content").hide();

				var activeTab = $(this).find("a").attr("href");
				$(activeTab).fadeIn();
				return false;
			});
		});
	</script>

</body>
</html>