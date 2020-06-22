<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>At_write</title>
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
	<section id="content_artwrite">
		<article class="artwrite_box">
			<div class="container">
				<div class="row">
					<div class="artwrite_table">
						<div class="artpath">
						<c:if test="${artist eq 'band'}">
							<h3>소통게시판</h3>
							<p>소통게시판입니다.</p>
						</c:if>	
						
						<c:if test="${artist eq 'tattoo'}">
							<h3>후기게시판</h3>
							<p>후기게시판입니다.</p>
						</c:if>	
						</div>
						<div class="aboardView-table">
							<form name="artView"
								action="<%=request.getContextPath()%>/artist/aboardUpload.do" method="post" enctype="multipart/form-data">
								<table>
									<tbody>

										<tr>
											<th id="aview_title">제목</th>
											<td class="aview_td"><input type="text" class="artTitle"
												name="b_title"></td>
										</tr>
										<tr>
											<th class="aview_writer">작성자</th>
											<td class="aview_td">M_NICKNAME</td>
										</tr>
										<tr>
											<th class="aview_content">내용</th>
											<td class="aview_td"><textarea cols="300" rows="15"
													name="b_content" style="width: 100%"></textarea></td>
										</tr>
										<tr>
											<th class="aview_file">파일 등록</th>
											<td class="aview_td"><input type="file" name="bfile" multiple></td>
										</tr>
										<tr>
											<th class="aview_link">링크 등록</th>
											<td class="aview_td">
												<input type="text" class="artLink" name="b_link">
											</td>
										</tr>
									</tbody>
								</table>
								<button class="btn_fin">등록하기</button>
							</form>
							<div class="aboard_btn">


								<button class="btn_pass" type="button"
									onclick="location.href='<%=request.getContextPath()%>/artist/artist.do'">취소</button>
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

</body>
</html>