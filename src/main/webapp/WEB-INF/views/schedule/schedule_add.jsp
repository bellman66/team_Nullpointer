<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>schedule_add</title>
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
	<section id="content_scheadd">
		<article class="scheadd_box">
			<div class="container">
				<div class="row">
					<!-- 스케줄 div 시작 -->
					<div class="scheadd_table">
						<div class="scAddTitle">스케줄 등록</div>
						<!-- form 시작 -->
						<div class="schformtag">
							<form name="sh"
								action="<%=request.getContextPath()%>/schedule/scheduleadd.do">
								<div class="scStart">시작일</div>
								<select name="startYear" class="startYear">
									<option value="selected disabled hidden">년도</option>
									<option value="2020-">2020년</option>
									<option value="2021-">2021년</option>
									<option value="2022-">2022년</option>
								</select>
								<select name="startMonth" class="startMonth">
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
								<select name="startDay" class="startDay">
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
								<select name="startHour" class="startYear">
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
								<select name="startMinute" class="startMinute">
									<option value="selected disabled hidden">분</option>
									<option value="00:00">00분</option>
									<option value="10:00">10분</option>
									<option value="20:00">20분</option>
									<option value="30:00">30분</option>
									<option value="40:00">40분</option>
									<option value="50:00">50분</option>
								</select>
								<div class="scEnd">종료일</div>
								<select name="endYear" class="endYear">
									<option value="selected disabled hidden">년도</option>
									<option value="2020-">2020년</option>
									<option value="2021-">2021년</option>
									<option value="2022-">2022년</option>
								</select>
								<select name="endMonth" class="endMonth">
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
								<select name="endDay" class="endDay">
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
								<select name="endHour" class="endHour">
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
								<select name="endMinute" class="endMinute">
									<option value="selected disabled hidden">분</option>
									<option value="00:00">00분</option>
									<option value="10:00">10분</option>
									<option value="20:00">20분</option>
									<option value="30:00">30분</option>
									<option value="40:00">40분</option>
									<option value="50:00">50분</option>
								</select>
								<div class="schTitle"> 일정 제목  </div>
								<input type="text" name="as_content" class="as_content" />
								<button class="dbSearch">추가하기</button>
							</form>
						</div>
						<!-- form 끝 -->
					</div>
					<!-- 스케줄 div 끝-->
				</div>
			</div>
		</article>
	</section>
	<!-- content부분 끝 -->

	<!-- footer부분 시작 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- footer부분 끝 -->

	<script type="text/javascript">

	
 	function sub(){
 		
		var formsub = $(".scheadd_table").serialize();
		var startYear = document.querySelector(".startYear").value;
		var startMonth = document.querySelector(".startMonth").value;
		var startDay = document.querySelector(".startDay").value;
		var endYear = document.querySelector(".endYear").value;
		var endMonth = document.querySelector(".endMonth").value;
		var endDay = document.querySelector(".endDay").value;
		$.ajax({
			href :'<%=request.getContextPath()%>/schedule/scheduleadd.do',
				data : {
					"startYear" : startYear,
					"startMonth" : startMonth,
					"startDay" : startDay,
					"endYear" : endYear,
					"endMonth" : endMonth,
					"endDay" : endDay
				},
				success : function(xh) {
					window.close();
				}
			});
		}

		/*  var sub = document.querySelector('.sub');
		
		 function sub(){
		
		
		
		 window.close();
		 return true;
		
		 }; */
	</script>



</body>
</html>