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
							<h3>콘텐츠 업로드</h3>
						</div>
						<div class="aboardView-table">
							<form name="artView"
								action="<%=request.getContextPath()%>/artist/artConUpload.do"
								method="post" enctype="multipart/form-data">

								<table>
									<tbody>

										<tr>
											<th id="aview_title">제목</th>
											<td class="aview_td"><input type="text" class="artTitle"
												name="au_content"></td>
										</tr>
										<tr>
											<th class="aview_writer">작성자</th>
											<td class="aview_td">${loginInfo.member.m_nickname}</td>
										</tr>
										<tr>
											<th class="aview_link">콘텐츠 종류</th>
											<td><b>사진</b>
											<input type="radio" name="au_type"
												value="1" onclick="filechoice()"> <br>
												 <b>영상</b> <input type="radio"
												name="au_type" value="2" onclick="filechoice()"></td>
										</tr>
										<tr id="aview_photo" style="display: block;">
											<th class="aview_file">파일 등록1</th>
											<td class="aview_td"><input type="file" name="au_file"
												multiple></td>
										</tr>
										<tr id="aview_video" style="display: none;">
											<th class="aview_file">파일 등록2</th>
											<td class="aview_td"><input type="text"
												name="au_thumbnail" /></td>
										</tr>
									</tbody>
								</table>
								<button type="submit" class="btn_fin">등록하기</button>
							</form>
							<%-- <div class="aboard_btn">
								<button class="btn_pass" type="button"
									onclick="location.href='<%=request.getContextPath()%>/artist/artist.do'">취소</button>
							</div> --%>
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

	<script type="text/javascript">
		
		function filechoice() {

			var file = document.getElementsByName('au_type');
			console.log(file);

			if (file[0].checked == true) {
				document.querySelector('#aview_photo').style.display = 'block';
				document.querySelector('#aview_video').style.display = 'none';
			} else if(file[1].checked == true) {
				document.querySelector('#aview_photo').style.display = 'none';
				document.querySelector('#aview_video').style.display = 'block';
			}

		}
	</script>

</body>
</html>