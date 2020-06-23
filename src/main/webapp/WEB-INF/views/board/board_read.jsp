<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>BoardRead</title>
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
	<section id="content_bread">
		<article class="bread_box">
			<div class="container">
				<div class="row">
					<%-- <form action="<%=request.getContextPath()%>/board/boardDelete.do?b_num=${read.board.b_num}">  --%>	
					<div class="bread_list">
						<c:if test='${read.board.b_category eq 1}'> 
                            <div class="read_category"><strong>공유게시판</strong></div>
                        </c:if> 

                        <c:if test='${read.board.b_category eq 2}'>
                            <div class="read_category"><strong>홍보게시판</strong></div>
                        </c:if>
                        

                        <div class="read_title">${read.board.b_title}</div>

                        <div class="read_info">
                            <div class="read_id">아이디 : ${read.board.m_id}</div>
                            <div class="read_day">작성일 : ${read.board.b_date}</div>
                            <div class="read_file">첨부파일 : 
								<c:forEach items="${read.flist }" var="filename">
									<a href="<%=request.getContextPath() %>/resources/upload/${filename.renameFile}">
										${filename.originFileName}
									</a><br>
								</c:forEach>
							</div>
                            <div class="read_content">${read.board.b_content}</div>
                            <div class="read_num" style="display:none;">${read.board.b_num}</div>
                        </div>
                        
					</div>
					
					<div class="read_button">
					<%-- 이코드는 작성자와 아이디가 같다면 버튼을 활성화 해주는 --%>
					<%-- <c:if test="${logInInfo.m_id eq read.board.m_id}"> --%>	
							
							<c:if test="${sessionScope.loginInfo.member.m_id eq read.board.m_id}">
					          <%--  <div class="read_delete">
					            	 <a href="<%=request.getContextPath()%>/board/boardDelete.do?b_num=${read.board.b_num}">삭제</a>
					            	 <!-- <button>삭제</button> -->
					           </div> --%>
					           <button class="read_delete" onclick="location.href='<%= request.getContextPath() %>/board/boardDelete.do?b_num=${read.board.b_num}'">삭제</button>
					         </c:if>  
			        
			        <%-- </c:if> --%>
				        <%-- <div class="read_list">
				        	<a href="<%=request.getContextPath()%>/board/boardRead_list.do?b_category=${read.board.b_category}">목록</a>
				        </div> --%>
				        <button class="read_list" onclick="location.href='<%= request.getContextPath() %>/board/boardRead_list.do?b_category=${read.board.b_category}'">목록</button>
					        
			       <!-- </form> --> 
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