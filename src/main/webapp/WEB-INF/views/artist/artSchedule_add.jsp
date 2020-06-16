<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Artist_Schedule_add</title>
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
	<section id="content_artscheadd">
		<article class="artscheadd_box">
			<div class="container">
				<div class="row">
					<div class="artscheadd_table">
						<div class="artscAddTitle">스케줄 입력</div>
						<br><br>
						<div class="artscStart" style="font-size: 2em;">시작일</div>
						<form action="<%=request.getContextPath()%>/artist/artistscheduleadd.do">
							<select name="artstartYear" class="artstartYear">
									<option value="selected disabled hidden">년도</option>
									<option value="2019-">2019년</option>
									<option value="2020-">2020년</option>
									<option value="2021-">2021년</option>
									<option value="2022-">2022년</option>
									<option value="2023-">2023년</option>
							</select> 
							
							<select name="artstartMonth" class="artstartMonth">
									<option value="selected disabled hidden">월</option>
									<option value="01-">1월</option>
									<option value="02-">2월</option>
									<option value="03-">3월</option>
									<option value="04-">4월</option>
									<option value="05-">5월</option>
									<option value="06-">6월</option>
									<option value="07-">7월</option>
									<option value="08-">8월</option>
									<option value="09-">9월</option>
									<option value="10-">10월</option>
									<option value="11-">11월</option>
									<option value="12-">12월</option>
							</select>
							
							<select name="artstartDay" class="artstartDay">
									<option value="selected disabled hidden">일</option>
									<option value="01">1일</option>
									<option value="02">2일</option>
									<option value="03">3일</option>
									<option value="04">4일</option>
									<option value="05">5일</option>
									<option value="06">6일</option>
									<option value="07">7일</option>
									<option value="08">8일</option>
									<option value="09">9일</option>
									<option value="10">10일</option>
									<option value="11">11일</option>
									<option value="12">12일</option>
									<option value="13">13일</option>
									<option value="14">14일</option>
									<option value="15">15일</option>
									<option value="16">16일</option>
									<option value="17">17일</option>
									<option value="18">18일</option>
									<option value="19">19일</option>
									<option value="20">20일</option>
									<option value="21">21일</option>
									<option value="22">22일</option>
									<option value="23">23일</option>
									<option value="24">24일</option>
									<option value="25">25일</option>
									<option value="26">26일</option>
									<option value="27">27일</option>
									<option value="28">28일</option>
									<option value="29">29일</option>
									<option value="30">30일</option>
									<option value="31">31일</option>
							</select>
							
							<select name="artstartHour" class="artstartHour">
								<option value="selected disabled hidden">시</option>
									<option value="T24:">0시</option>
									<option value="T01:">1시</option>
									<option value="T02:">2시</option>
									<option value="T03:">3시</option>
									<option value="T04:">4시</option>
									<option value="T05:">5시</option>
									<option value="T06:">6시</option>
									<option value="T07:">7시</option>
									<option value="T08:">8시</option>
									<option value="T09:">9시</option>
									<option value="T10:">10시</option>
									<option value="T11:">11시</option>
									<option value="T12:">12시</option>
									<option value="T13:">13시</option>
									<option value="T14:">14시</option>
									<option value="T15:">15시</option>
									<option value="T16:">16시</option>
									<option value="T17:">17시</option>
									<option value="T18:">18시</option>
									<option value="T19:">19시</option>
									<option value="T20:">20시</option>
									<option value="T21:">21시</option>
									<option value="T22:">22시</option>
									<option value="T23:">23시</option>
							</select>
							
							<select name="artstartMinute" class="artstartMinute">
								<option value="selected disabled hidden">분</option>
									<option value="00:00">00분</option>
									<option value="10:00">10분</option>
									<option value="20:00">20분</option>
									<option value="30:00">30분</option>
									<option value="40:00">40분</option>
									<option value="50:00">50분</option>
							</select>

							<br><br><br><br><br>
						<div class="artscEnd" style="font-size: 2em;">종료일</div>
							<select name="artendYear" class="artendYear">
									<option value="selected disabled hidden">년도</option>
									<option value="2019-">2019년</option>
									<option value="2020-">2020년</option>
									<option value="2021-">2021년</option>
									<option value="2022-">2022년</option>
									<option value="2023-">2023년</option>
							</select> 
							
							<select name="artendMonth" class="artendMonth">
									<option value="selected disabled hidden">월</option>
									<option value="01-">1월</option>
									<option value="02-">2월</option>
									<option value="03-">3월</option>
									<option value="04-">4월</option>
									<option value="05-">5월</option>
									<option value="06-">6월</option>
									<option value="07-">7월</option>
									<option value="08-">8월</option>
									<option value="09-">9월</option>
									<option value="10-">10월</option>
									<option value="11-">11월</option>
									<option value="12-">12월</option>
							</select>
							
							<select name="artendDay" class="artendDay">
									<option value="selected disabled hidden">일</option>
									<option value="01">1일</option>
									<option value="02">2일</option>
									<option value="03">3일</option>
									<option value="04">4일</option>
									<option value="05">5일</option>
									<option value="06">6일</option>
									<option value="07">7일</option>
									<option value="08">8일</option>
									<option value="09">9일</option>
									<option value="10">10일</option>
									<option value="11">11일</option>
									<option value="12">12일</option>
									<option value="13">13일</option>
									<option value="14">14일</option>
									<option value="15">15일</option>
									<option value="16">16일</option>
									<option value="17">17일</option>
									<option value="18">18일</option>
									<option value="19">19일</option>
									<option value="20">20일</option>
									<option value="21">21일</option>
									<option value="22">22일</option>
									<option value="23">23일</option>
									<option value="24">24일</option>
									<option value="25">25일</option>
									<option value="26">26일</option>
									<option value="27">27일</option>
									<option value="28">28일</option>
									<option value="29">29일</option>
									<option value="30">30일</option>
									<option value="31">31일</option>
							</select> 
							
							<select name="artendHour" class="artendHour">
								<option value="selected disabled hidden">시</option>
									<option value="T24:">0시</option>
									<option value="T01:">1시</option>
									<option value="T02:">2시</option>
									<option value="T03:">3시</option>
									<option value="T04:">4시</option>
									<option value="T05:">5시</option>
									<option value="T06::">6시</option>
									<option value="T07:">7시</option>
									<option value="T08:">8시</option>
									<option value="T09:">9시</option>
									<option value="T10:">10시</option>
									<option value="T11:">11시</option>
									<option value="T12:">12시</option>
									<option value="T13:">13시</option>
									<option value="T14:">14시</option>
									<option value="T15:">15시</option>
									<option value="T16:">16시</option>
									<option value="T17:">17시</option>
									<option value="T18:">18시</option>
									<option value="T19:">19시</option>
									<option value="T20:">20시</option>
									<option value="T21:">21시</option>
									<option value="T22:">22시</option>
									<option value="T23:">23시</option>
							</select>
							
							<select name="artendMinute" class="artendMinute">
								<option value="selected disabled hidden">분</option>
									<option value="00:00">00분</option>
									<option value="10:00">10분</option>
									<option value="20:00">20분</option>
									<option value="30:00">30분</option>
									<option value="40:00">40분</option>
									<option value="50:00">50분</option>
							</select> 
							
							공연이름 : <input type="text" name="atr_as_content" class="atr_as_content"/>
							
							<button class="art_dbSearch">추가하기</button>
						<!-- <input class="sub" value="sub" style="display:none;"></input> -->
						</form>
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