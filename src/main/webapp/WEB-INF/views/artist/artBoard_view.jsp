<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>ArtistBoard_View</title>
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
	<section id="content_artbdview">
		<article class="artboard_box">
			<div class="container">
				<div class="row">
					<div class="artView">
						<div class="artpath">
							<c:if test="${artist eq 'band'}">
								<h3>소통게시판</h3>
								<p>- 소통게시판입니다.</p>
							</c:if>	
						
							<c:if test="${artist eq 'tattoo'}">
								<h3>후기게시판</h3>
								<p>- 후기게시판입니다.</p>
							</c:if>	
						</div>
						<div class="artTable">
							<form name="aboardView" action="">
								<table>
									<tbody>
										<!-- <tr>
											<th id="aview_board">게시판종류</th>
											<td class="aview_board"></td>
										</tr> -->
										<tr>
											<th class="aview_title">제목</th>
											<td class="aview_td">${readMap.artRead.b_title}</td>
										</tr>
										<tr>
											<th class="aview_writer">작성자</th>
											<td class="aview_td">${readMap.artRead.m_id}</td>
										</tr>
										<tr>
											<th class="aview_Date">작성일</th>
											<td class="aview_td">${readMap.artRead.b_date}</td>
										</tr>
										<tr>
											<th class="aview_content">내용</th>
											<td class="aview_td"  style="top: 28%;
																		    border: 2px solid black;
																		    height: 230px;
																		    font-size: 17px;
																		    margin-left: 5%;
																		    padding: 1%;
																		    width: 1500%;">
																		    ${readMap.artRead.b_content}
											</td>
										</tr>
										<c:forEach items="${readMap.flist }" var="filename">
										<tr>
											<th class="aview_file">파일</th>
											<td class="aview_td">
												<a href="<%=request.getContextPath() %>/resources/upload/${filename.renameFile}">
												${filename.originFileName}</a>
											</td>
										</tr>
										</c:forEach>
										
										<tr>
											<th class="aview_linke">링크</th>
											<td class="aview_td"><a href="${readMap.artRead.b_link}">${readMap.artRead.b_link}</a></td>
											
										</tr>
									</tbody>
								</table>
							</form>
							<div class="aboard_btn">
								<button class="btn_list" type="button" onclick="location.href='<%= request.getContextPath() %>/artist/artboardlist.do'">목록</button>
								<c:if test="${sessionScope.loginInfo.member.m_id eq readMap.artRead.m_id}">
									<button class="btn_modify" type="button" onclick="location.href='<%= request.getContextPath() %>/artist/aboardDelect.do?b_num=${readMap.artRead.b_num}'">삭제</button>
								</c:if>
								<button class="btn_pass" type="button" onclick="location.href='<%= request.getContextPath() %>/artist/artboardlist.do'">취소</button>
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

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.4.1.js"></script>

</body>
</html>