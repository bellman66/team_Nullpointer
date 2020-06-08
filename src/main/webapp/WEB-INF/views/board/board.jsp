<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	<section id="content_board_list">
		<article class="board_box">
			<div class="container">
				<div class="row">
				<!-- 게시판 헤더 기능 -->
					<div class="boardTitle">
					<form action="<%=request.getContextPath()%>/board/boardPR.do"> 
				        <button class="promotionBt"></button>
				        <div class="promotion">홍보 게시판</div>
				     </form>   
				     <form action="<%=request.getContextPath()%>/board/boardSH.do">   
				        <button class="sharingBt"></button>
				        <div class="sharing">공유 게시판</div>
				     </form>
				     </div>
	  				</div>
	  				
	  				<!-- 게시판 리스트 기능 -->
					<div class="board_list">
						 <table class="boardListTable">
					        <thead>
					            <tr>
					            <c:if test="${board  eq 'sh'}"> 
					                <th class="listNum"><span>번호</span></th>
					                <th class="listTitle"><span>제목</span></th>
					                <th class="listWriter"><span>작성자</span></th>
					                <th class="listDay"><span>등록일</span></th>
					            </c:if>    
					            
					            <c:if test="${board  eq 'pr'}"> 
					                <th class="listNum"><span>번호</span></th>
					                <th class="listTitle"><span>홍보내용</span></th>
					                <th class="listWriter"><span>아티스트</span></th>
					                <th class="listDay"><span>등록일</span></th>
					            </c:if>
					            </tr>
					        </thead>
					        
					        <tbody>
					          	<c:forEach items="${boardList.nlist}" var="board">
						            <tr>
						                <td class="num" style="text-align:center;">${board.rnum}</td>
						                <td class="subject"><a href="<%= request.getContextPath() %>/board/boardRead.do?b_num=${board.b_num}">${board.b_title}</a></td>
						                <td class="writer" style="text-align:center;">${board.m_id}</td>
						                <td class="date" style="text-align:center;">${board.b_date}</td>
						            </tr>
					        	</c:forEach>
					         
					        </tbody>
        				</table> 

  
						<!-- 페이징 처리기능 -->
						 <div class="paging">
						 <!-- 홍보게시판 페이징 처리기능 -->
							<c:if test="${board  eq 'pr'}"> 
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
						   
						   <!-- 공유게시판 페이징 처리기능 -->
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
						  </div>
						  
						  <!-- 게시판 검색기능 -->
						<div class="search">
							<form action="<%=request.getContextPath()%>/board/search.do">
								<select class="searchCategori">
										<option value="" selected disabled hidden>분류</option>
										<option value="write">작성자</option>
										<option value="title">제목</option>
										<option value="wrti">작성자 + 제목</option>
										
								</select>			
								<input Type ="text" name="search" placeholder="검색어를 입력하세요">
								<div class="searchButton">
						        	<a href="<%= request.getContextPath() %>/board/boardwrite.do">검색</a>
						  		</div>
							</form>
						</div>
						
						  <!-- 게시판 쓰기 기능 -->
						  <div class="write">
						        <a href="<%= request.getContextPath() %>/board/boardwrite.do?board=${board}">글쓰기</a>
						  </div>
					
					</div>
				</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/board.js"></script>
</body>
</html>