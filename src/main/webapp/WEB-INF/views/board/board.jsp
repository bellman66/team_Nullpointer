<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>notice</title>
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
	<section id="content_notice_list">
		<article class="notice_box">
			<div class="container">
				<div class="row">
					<div class="boardTitle">
				        <div class="promotion"><strong>홍보 게시판</strong></div>
				
				        <div class="sharing"><strong>공유 게시판</strong></div>
	  				</div>
	  				
					<div class="notice_list">
						<table class="boardListTable">
					        <thead>
					            <tr>
					                <th class="listNum"><span>번호</span></th>
					                <th class="listTitle"><span>제목</span></th>
					                <th class="listWriter"><span>작성자</span></th>
					                <th class="listDay"><span>등록일</span></th>
					            </tr>
					        </thead>
					        
					        <tbody>
					            <%-- <c:forEach items="${mdata.nlist}" var="notice">
						            <tr>
						                <td class="num">${notice.noticeNo}</td>
						                <td class="subject"><a href="<%= request.getContextPath() %>/notice/noticedetail.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
						                <td class="writer">${notice.noticeDate}</td>
						                <td class="date">${notice.noticeDate}</td>
						            </tr>
					         </c:forEach> --%>
					         
					          	<tr>
						              	<td class="num">1</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">2</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">3</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">4</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">5</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">6</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">7</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">8</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">9</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">10</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">11</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">12</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">13</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">14</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
						       
						       <tr>
						              	<td class="num">15</td>
						                <td class="subject">테스트 입니다. 테스트 입니다. 테스트 입니다.</td>
						                <td class="writer">김경호</td>
						                <td class="date">20.06.01</td>
						       </tr>
					         
					         
					         
					         
					        </tbody>
        				</table>

  

						<div class="paging">
							<a href="<%= request.getContextPath() %>/board/board.do" class="nav first"><i class="fas fa-angle-double-left"></i></a>
						 	<c:choose>
						       <c:when test="${paging.blockStart > 1 }">
						            <a href="<%= request.getContextPath() %>/board/board.do?cPage=${paging.blockStart-1}" class="nav prev"><i class="fas fa-angle-left"></i></a>
						       </c:when>
						       <c:otherwise>
						           <a href="<%= request.getContextPath() %>/board/board.do?cPage=${paging.blockStart}" class="nav prev"><i class="fas fa-angle-left"></i></a>
						       </c:otherwise>
						   </c:choose>
						   
						   <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
						   		<a href="<%= request.getContextPath() %>/board/board.do?cPage=${page}" class="num active"><span>${page}</span></a>
						   </c:forEach> 
						   
						   <c:choose>
						       <c:when test="${paging.blockEnd+1 > paging.lastPage }">
						            <a href="<%= request.getContextPath() %>/board/board.do?cPage=${paging.blockEnd}" class="nav next"><i class="fas fa-angle-right"></i></a>
						       </c:when>
						       
						       <c:otherwise>
						            <a href="<%= request.getContextPath() %>/board/board.do?cPage=${paging.blockEnd+1}" class="nav next"><i class="fas fa-angle-right"></i></a>
						       </c:otherwise>
						   </c:choose>
						        
						        <a href="<%= request.getContextPath() %>/board/board.do?cPage=${paging.lastPage}" class="nav last"><i class="fas fa-angle-double-right"></i></a>
						  </div>
						  
						<div class="search">
							<form action="<%=request.getContextPath()%>/book/search.do">
								<select class="searchCategori">
										<option value="" selected disabled hidden>분류</option>
										<option value="write">작성자</option>
										<option value="title">제목</option>
										<option value="wrti">작성자 + 제목</option>
										
								</select>			
								<input Type ="text" name="search" placeholder="검색어를 입력하세요">
								<div class="searchButton">
						        	<a href="<%= request.getContextPath() %>/notice/noticewrite.do">검색</a>
						  		</div>
							</form>
						</div>
						  
						  <div class="write">
						        <a href="<%= request.getContextPath() %>/notice/noticewrite.do">글쓰기</a>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/board.js"></script>
</body>
</html>