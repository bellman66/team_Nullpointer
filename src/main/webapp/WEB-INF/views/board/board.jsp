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
								<li id="prtab"><a href="#tab1" onclick="prSubmit()">홍보 게시판</a></li>
								<li id="shtab"><a href="#tab2" onclick="shSubmit()">공유 게시판</a></li>
							</ul>

							<!--탭 콘텐츠 영역 -->
							<div class="tab_container">
								<!-- 공유게시판 부분 시작  -->
								<div id="tab1" class="tab_content">
									<form name="pr" action="<%=request.getContextPath()%>/board/boardPR.do" onsubmit="submit()">
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
												<c:forEach items="${boardList.nlist}" var="board">
										            <tr>
										                <td class="prNo" style="text-align:center;">${board.rnum}</td>
										                <td class="prTitle"><a href="<%= request.getContextPath() %>/board/boardRead.do?b_num=${board.b_num}">${board.b_title}</a></td>
										                <td class="prWriter" style="text-align:center;">${board.m_id}</td>
										                <td class="prDate" style="text-align:center;">${board.b_date}</td>
										            </tr>
					        					</c:forEach>
											</tbody>
										</table>

										<!-- 페이지부분 -->
										<div class="bdpage" id="bdpage">
										<!-- 홍보게시판 페이징 처리기능 -->
										   <ul class="bdpaging">
										   <c:if test="${board  eq 'pr'}"> 
										   <input class="prpr" value="pr" style="display:none;"></input>
												 <a href="<%= request.getContextPath() %>/board/boardPR.do" class="nav first"><i class="fas fa-angle-double-left"></i></a>
										 		<c:choose>
											       <c:when test="${paging.blockStart > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockStart-1}" class="nav prev"><i class="fas fa-angle-left"></i></a>
											       </c:when>
											       <c:otherwise>
											           <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockStart}" class="nav prev"><i class="fas fa-angle-left"></i></a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${page}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.blockEnd+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockEnd}" class="nav next"><i class="fas fa-angle-right"></i></a>
											       </c:when>
											       
											       <c:otherwise>
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockEnd+1}" class="nav next"><i class="fas fa-angle-right"></i></a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.lastPage}" class="nav last"><i class="fas fa-angle-double-right"></i></a>
										   </c:if>
										   </ul> 
										   </div>

										
									</form>
								</div>

								<!-- 홍보게시판 부분 시작  -->
								<div id="tab2" class="tab_content">
									<form name="sh" action="<%=request.getContextPath()%>/board/boardSH.do"  onsubmit="submit()">
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
												<c:forEach items="${boardList.nlist}" var="board">
										            <tr>
										                <td class="prNo" style="text-align:center;">${board.rnum}</td>
										                <td class="prTitle"><a href="<%= request.getContextPath() %>/board/boardRead.do?b_num=${board.b_num}">${board.b_title}</a></td>
										                <td class="prWriter" style="text-align:center;">${board.m_id}</td>
										                <td class="prDate" style="text-align:center;">${board.b_date}</td>
										            </tr>
					        					</c:forEach>
											</tbody>
										</table>

										<!-- 페이지부분 -->
										<div class="bdpage" id="bdpage">
										<!-- 공유게시판 페이징 처리기능 -->
									   <ul class="bdpaging2222222">
										<c:if test="${board  eq 'sh'}"> 
											<a href="<%= request.getContextPath() %>/board/boardSH.do" class="nav first"><i class="fas fa-angle-double-left"></i></a>
										 		<c:choose>
											       <c:when test="${paging.blockStart > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockStart-1}" class="nav prev"><i class="fas fa-angle-left"></i></a>
											       </c:when>
											       <c:otherwise>
											            <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockStart}" class="nav prev"><i class="fas fa-angle-left"></i></a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${page}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.blockEnd+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockEnd}" class="nav next"><i class="fas fa-angle-right"></i></a>
											       </c:when>
											       
											       <c:otherwise>
											         <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockEnd+1}" class="nav next"><i class="fas fa-angle-right"></i></a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.lastPage}" class="nav last"><i class="fas fa-angle-double-right"></i></a>
										   </c:if>
										   </ul> 
										 
										  </div>
									</form>
								</div>
								<!-- 홍보게시판 부분 끝  -->
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
										<div id="bdWrite">
						        			<a href="<%= request.getContextPath() %>/board/boardwrite.do?board=${board}" style="color:#fff;">글쓰기</a>
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
	var pr = document.querySelector('.prpr');
	var sh = document.querySelector('.shsh');
	$(document).ready(function() {
		
		var flg = '${board}';

		if(flg == 'pr'){
			document.querySelector('#tab1').style.display="block";
			document.querySelector('#tab2').style.display="none";
			document.querySelector("#prtab").style.backgroundColor = 'white';
		}else{
			document.querySelector('#tab1').style.display="none";
			document.querySelector('#tab2').style.display="block";
			document.querySelector("#shtab").style.backgroundColor = 'white';
		}	
		
		
	});
	
	
	
	
	
		
	function prSubmit(){
		 console.dir("메롱");
		 document.pr.submit();
		 return true;
	 }
	 
	 function shSubmit(){
		 console.dir("메롱");
		 document.sh.submit();
		 return true;
	 }
		 

		 
		 
	</script>

</body>
</html>