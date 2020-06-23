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
							<div class="tab_container" style="height:420px;">
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
												<input type="hidden" value="${board.b_num}" name="bnoList"/>
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
												 <a href="<%= request.getContextPath() %>/board/boardPR.do" class="nav first" style="background-color:white">&lt;&lt;</a>
										 		<c:choose>
											       <c:when test="${paging.currentPage > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.currentPage-1}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:when>
											       <c:otherwise>
											           <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockStart}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${page}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.currentPage+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.blockEnd}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:when>
											       
											       <c:otherwise>
											             <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.currentPage+1}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardPR.do?cPage=${paging.lastPage}" class="nav last" style="background-color:white">&gt;&gt;</a>
										   </c:if>
										   
										   <!-- 검색했을시 페이징 처리 -->
										   <c:if test="${board  eq 'searchPR'}">
										   <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?board=${board}&searchType=${searchType}&searchWord=${searchWord}" class="nav first" style="background-color:white">&lt;&lt;</a>
										 		<c:choose>
											       <c:when test="${paging.currentPage > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?cPage=${paging.currentPage-1}&searchType=${searchType}&searchWord=${searchWord}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:when>
											       <c:otherwise>
											           <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?cPage=${page}&board=${board}&searchType=${searchType}&searchWord=${searchWord}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.currentPage+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?cPage=${paging.blockEnd}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:when>
											       
											       <c:otherwise>
											             <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?cPage=${paging.currentPage+1}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardSearchPR.do?cPage=${paging.lastPage}" class="nav last" style="background-color:white">&gt;&gt;</a>
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
												<input type="hidden" value="${board.b_num}" name="bnoList"/>
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
									   <ul class="bdpaging">
										<c:if test="${board  eq 'sh'}"> 
											<a href="<%= request.getContextPath() %>/board/boardSH.do" class="nav first" style="background-color:white">&lt;&lt;</a>
										 		<c:choose>
											       <c:when test="${paging.currentPage > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.currentPage-1}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:when>
											       <c:otherwise>
											            <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockStart}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${page}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.currentPage+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.blockEnd}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:when>
											       
											       <c:otherwise>
											         <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.currentPage+1}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardSH.do?cPage=${paging.lastPage}" class="nav last" style="background-color:white">&gt;&gt;</a>
										   </c:if>
										   
										   <!-- 검색했을시 페이징 처리 -->
										   <c:if test="${board  eq 'searchSH'}">
										   <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?board=${board}&searchType=${searchType}&searchWord=${searchWord}" class="nav first" style="background-color:white">&lt;&lt;</a>
										 		<c:choose>
											       <c:when test="${paging.currentPage > 1 }">
											             <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?cPage=${paging.currentPage-1}&searchType=${searchType}&searchWord=${searchWord}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:when>
											       <c:otherwise>
											           <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?&searchType=${searchType}&searchWord=${searchWord}" class="nav prev" style="background-color:white">  &lt;</a>
											       </c:otherwise>
											   </c:choose>
											   
											   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
											   		 <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?cPage=${page}&board=${board}&searchType=${searchType}&searchWord=${searchWord}" class="num active"><span>${page}</span></a>
											   </c:forEach> 
											   
											   <c:choose>
											       <c:when test="${paging.currentPage+1 > paging.lastPage }">
											             <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?cPage=${paging.blockEnd}&searchType=${searchType}&searchWord=${searchWord}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:when>
											       
											       <c:otherwise>
											             <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?cPage=${paging.currentPage+1}&searchType=${searchType}&searchWord=${searchWord}" class="nav next" style="background-color:white">  &gt;</a>
											       </c:otherwise>
											   </c:choose>
											         <a href="<%= request.getContextPath() %>/board/boardSearchSH.do?cPage=${paging.lastPage}&searchType=${searchType}&searchWord=${searchWord}" class="nav last" style="background-color:white">&gt;&gt;</a>
										   </c:if>
										   </ul> 
										 
										  </div>
									</form>
								</div>
								<!-- 홍보게시판 부분 끝  -->
								<!-- 검색 창 -->
								<div class="bdsearch">
									<c:if test="${board  eq 'sh' || board eq 'searchSH'}">	
										<form action="<%=request.getContextPath()%>/board/boardSearchSH.do?board=${board}" method="post">
									</c:if>	
									<c:if test="${board  eq 'pr'|| board eq 'searchPR'}">	
										<form action="<%=request.getContextPath()%>/board/boardSearchPR.do?board=${board}" method="post">
									</c:if>		
										
										<select name="searchType" class="searchType">
													<option value="selected disabled hidden">분류</option>
													<option value="write">작성자</option>
													<option value="title">제목</option>
													<option value="wrti">작성자 + 제목</option>
												</select> 
												<input class="searchWord" type="text" name="searchWord" />
												<!-- <input class="dbSearch" type="button" value="검색하기" /> -->
												
												<%-- <c:if test="${board  eq 'sh'}">	
													<button  class="dbSearch" onclick="searchSh()">검색</button>
												</c:if>	
												
												<c:if test="${board  eq 'pr'}">	
													<button  class="dbSearch" onclick="searchPr()">검색</button>
												</c:if> --%>	
												<button  class="dbSearch">검색</button> 
										</form>
											
								</div>

										<!-- 버튼  -->
								<c:if test="${board  eq 'sh'}" >	
									<c:if test="${sessionScope.loginInfo != null }">
										<%-- <div id="bdWrite">
									        <a href="<%= request.getContextPath() %>/board/boardwrite.do?board=${board}" style="color:#fff;">글쓰기</a>
									  	</div> --%>
									  	<button id="bdWrite" onclick="location.href='<%= request.getContextPath() %>/board/boardwrite.do?board=${board}'">글쓰기</button> 
								  	</c:if>
						  		</c:if>	
						  		
						  		<c:if test="${board  eq 'pr'}">	
						  			<c:if test="${sessionScope.loginInfo != null }">
										<c:if test="${sessionScope.loginInfo.member.m_class != '1'}">
											<%-- <div id="bdWrite">
							        			<a href="<%= request.getContextPath() %>/board/boardwrite.do?board=${board}" style="color:#fff;">글쓰기</a>
							  				</div> --%>
							  				<button id="bdWrite" onclick="location.href='<%= request.getContextPath() %>/board/boardwrite.do?board=${board}'">글쓰기</button> 
										</c:if>
									</c:if>
								 
						  		</c:if>			
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

		if(flg == 'pr' || flg == 'searchPR'){
			document.querySelector('#tab1').style.display="block";
			document.querySelector('#tab2').style.display="none";
			document.querySelector("#prtab").style.backgroundColor = 'white';
		}else if(flg == 'sh' || flg == 'searchSH'){
			document.querySelector('#tab1').style.display="none";
			document.querySelector('#tab2').style.display="block";
			document.querySelector("#shtab").style.backgroundColor = 'white';
		}
		
		
		
	});
	
		
	function prSubmit(){
		 console.dir("메롱");
		 document.pr.submit();
		 return true;
	 };
	 
	 function shSubmit(){
		 console.dir("메롱");
		 document.sh.submit();
		 return true;
	 };
	 
<%-- 	 function searchSh() {
		 $.ajax({

		 url : '<%=request.getContextPath()%>/board/boardSearchSH.do?board=${board}',

		 type : 'post',

		 data : {
			 "searchType" : $('.searchType'),
			 "searchWord" : $('searchWord')
		 },
		 success : function(data) {

			 if(data != '') {
	
				 alert('검색이 완료 되었습니다.');
	
			 } 
	
			 });

		 }); --%>
		 

		 
		 
	</script>

</body>
</html>