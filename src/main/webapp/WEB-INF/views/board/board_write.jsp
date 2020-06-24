<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>BoardWrite</title>
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
	<section id="content_bwrite">
		<article class="bwrite_box">
			<div class="container">
				<div class="row">
					<div class="bwrite_table">
						<div class="bwrite_list">
							<form
								action="<%=request.getContextPath()%>/board/boardupload.do"
								method="post" enctype="multipart/form-data">

								<c:if test="${board eq 'sh'}">
									<div class="write_category">
										<strong>공유게시판</strong>
									</div>
								</c:if>

								<c:if test="${board eq 'pr'}">
									<div class="write_category">
										<strong>홍보게시판</strong>
									</div>
								</c:if>

								<div class="write_detail">
									<div class="title_file">
										<label>제목 :</label> 
										<input type="text" name="b_title" class="write_title" /><br /> 
										<label>파일 :</label> 
										<input type="file" name="bfile" id="contract_file" multiple /><br />
									</div>
									
									<br/>
									
									<div class="write_content">
										<textarea cols="300" rows="15" name="b_content"></textarea>
									</div>
									<div class="write_btn">
										<button class="bdwrite_button">확인</button>
										<c:if test="${board eq 'sh'}">
											<button class="bdWriteCancel"
												onclick="location.href='<%=request.getContextPath()%>/board/boardSH.do'">취소</button>
										</c:if>

										<c:if test="${board eq 'pr'}">
											<button class="bdWriteCancel"
												onclick="location.href='<%=request.getContextPath()%>/board/boardPR.do'">취소</button>
										</c:if>
									</div>
								</div>
							</form>
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