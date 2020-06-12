<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>schedule</title>
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
<link href='<%=request.getContextPath()%>/resources/packages/core/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/packages/daygrid/main.css' rel='stylesheet' />

<script src='${pageContext.request.contextPath}/resources/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/daygrid/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      header: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      defaultDate: '2020-06-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: '홍대공연',
          start: '2020-06-01'
        },
        {
          title: '미국 투어',
          start: '2020-06-07',
          end: '2020-06-10'
        },
        {
          groupId: 999,
          title: '치과 예약',
          start: '2020-06-09T16:00:00'
        },
        {
          groupId: 999,
          title: '바쁠 예정',
          start: '2020-06-16T16:00:00'
        },
        {
          title: '방콬 공연',
          start: '2020-06-11',
          end: '2020-06-13'
        },
        {
          title: '미팅',
          start: '2020-06-12T10:30:00',
          end: '2020-06-12T12:30:00'
        },
        {
          title: '점심약속',
          start: '2020-06-12T12:00:00'
        },
        {
          title: '미팅',
          start: '2020-06-12T14:30:00'
        },
        {
          title: '생일',
          start: '2020-06-12T17:30:00'
        },
        {
          title: '저녁약속',
          start: '2020-06-12T20:00:00'
        },
        {
          title: '생일파티',
          start: '2020-06-13T07:00:00'
        },
        {
          title: '클릭하면 구글로',
          url: 'http://google.com/',
          start: '2020-06-28'
        },
        {
          title: '수료하는날',
          start: '2020-06-24'

        }
        ],eventClick: function(arg) {
        if (confirm('delete event?')) {
          arg.event.remove()
        }
      }
    });

    calendar.render();
  });

</script>
<script type="text/javascript">
	function schedule_add(){
		var url = "<%= request.getContextPath() %>/schedule/add.do";
		var name = "scheduleAdd"
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
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
	<section id="content">
		<article class="schedule_box">
			<div class="container">
				<div class="row">
					
					<div id='calendar' style="margin-top: 5%; margin-bottom: 10%;"></div>
					
					<button class="sc_main_rent">메인 영상 대여</button>
					<button class="schedule_add" onclick="schedule_add()">스케줄 등록</button>
					
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