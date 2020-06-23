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
    
    <style type="text/css">
        #content_artmvView{
    	    width: 100%;
    		height: 100%;
    	}
    	.artmvView_box{
    	    width: 100%;
    		height: 100%;
    	}
    	.container{
    	    width: 100%;
    		height: 100%;
    	}
    	.row{
    	  	width: 90%;
    		height: 100%;
    		margin-left: 5%;
    		margin-right: 5%
    	}
    	.artView{
    	    width: 100%;
    		height: 100%;
    		max-width: 100%;
    		max-height: 100%;

    	}
    	
    	.artpath {
    		width: 100%;
    	}
    	.artTable {
    		width: 100%;
    		height: 100%;
    	}
    	.amovieForm{
    	    width: 100%;
    		height: 95%;
    	}
    </style>
</head>
<body>
	<!-- header부분 시작  -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- header부분 끝 -->

	<!-- nav부분 시작 -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<!-- nav부분 끝 -->

	<!-- content부분 시작 -->
	<section id="content_artmvView">
		<article class="artmvView_box">
			<div class="container">
				<div class="row">
					<div class="artView">
						<div class="artpath">
							<h2><b> ${selectvideo.m_nickname} / ${selectvideo.au_date} </b></h2>
						</div>
						<div class="artTable">
						
							<div class="amovieForm">
								<iframe height="100%" width="100%" src="https://www.youtube.com/embed/${selectvideo.au_file}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							
							<!-- 목록, 수정(작성한 아이디만), 취소 -->
							<!-- <div class="aboard_btn">
								<button class="btn_list" type="button">목록</button>
								<button class="btn_modify" type="button">수정</button>
								<button class="btn_pass" type="button">취소</button>
							</div> -->
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