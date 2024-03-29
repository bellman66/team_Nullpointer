<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Artist_Schedule</title>
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
    	<c:forEach items="${artScList}" var="artist">
	    	{
	    	title : "${artist.ats_content}",
	    	start : "${artist.ats_start_date}",
	    	end : "${artist.ats_end_date}",
	    	groupId : "${artist.ats_num}"
	    	},
		</c:forEach>
        ],eventClick: function(arg) {
        	if (confirm('삭제 하시겠습니까?')) {
	        	var scdelete = document.querySelector('.scdelete');
	        	/* var scdeleteid = document.querySelector('.scdeleteid'); */
	        	scdelete.value = arg.event.groupId;
	        	/* scdeleteid.value = arg.event.id; */
	        	
			    document.del.submit();
		       	return true;
	       		 };
	          	arg.event.remove()
	    	  }
   		 });

    calendar.render();
  });



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
	<section id="content_art">
		<article class="artschedule_box">
			<div class="container">
				<div class="row">
					<div class="artschedule_list">
						<%-- <form name="artschedule" action="<%=request.getContextPath()%>/artist/artistschedule.do"> --%>
						<div class="scheform">
							<div id='calendar' style="margin-top: 5%; margin-bottom: 10%;"></div>
							
								
									<c:if test="${sessionScope.loginInfo.member.m_nickname eq m_nickname}">
										<button class="artist_schedule_add" onclick="location.href='<%= request.getContextPath() %>/artist/artistscheduleaddshow.do'">행사 등록</button>
									</c:if>
								 
								<%-- <c:if test="${sessionScope.loginInfo.member.m_class == 2}">
									<button class="artist_schedule_cancel" onclick="location.href='<%= request.getContextPath() %>/artist/artistpage.do?${m_nickname}'">뒤로가기</button>
								</c:if>
								
								<c:if test="${sessionScope.loginInfo.member.m_class == 3}">
									<button class="artist_schedule_cancel" onclick="location.href='<%= request.getContextPath() %>/artist/tattoopage.do?${m_nickname}'">뒤로가기</button>
								</c:if> --%>
								
								<button class="artist_schedule_cancel" onclick="location.href='<%= request.getContextPath() %>/artist/artist.do'">뒤로가기</button>
						</div>
						<!-- </form> -->
					</div>
					<form name="del" action="<%= request.getContextPath() %>/artist/artScDelete.do">
						<input style="display:none;" name="scdelete" class="scdelete" value=""/>
						<!-- <input name="scdeleteid" class="scdeleteid" value=""/> -->
					</form>
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