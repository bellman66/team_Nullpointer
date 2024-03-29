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
    	 // 실질적으로 화면에 스케줄이 들어가는 코드
        <c:forEach items="${scheduleList.slist}" var="schedule">
	    	{
	    	title : "${schedule.as_content}",
	    	start : "${schedule.as_start_date}",
	    	end : "${schedule.as_end_date}",
	    	groupId : "${schedule.as_num}",
	    	id : "${schedule.m_id}"
	    	},
		</c:forEach>
        ],
        
        eventClick: function(arg) {
		        if (confirm('삭제 하시겠습니까?')) {
		        	var scdelete = document.querySelector('.scdelete');
		        	var scdeleteid = document.querySelector('.scdeleteid');
		        	scdelete.value = arg.event.groupId;
		        	scdeleteid.value = arg.event.id;
		        	
		        	
				    document.del.submit();
			       	return true;
		       	 };
		          	arg.event.remove()
		      }
    });

    calendar.render();
  });

/*   $(function(){
      var resule = new Array();
      
      <c:forEach items="${scheduleList.slist}" var="schedule">
	    	var json = new Object();
	    	json.title = "title : ${schedule.as_content}";
	    	json.as_start_date = "as_start_date : ${schedule.as_start_date}";
	    	json.as_end_date = "as_end_date : ${schedule.as_end_date}";
	    	result.push(json);
		</c:forEach>
		
		alert("jsonschedule=" + JSON.stringify(result));
		}); */
</script>
<script type="text/javascript">
	function schedule_add(){
		var url = "<%= request.getContextPath() %>/schedule/add.do";
		var name = "scheduleAdd"
		var option = "width = 500, height = 500, top = 200, left = 700, location = no"
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
				<!-- 스케줄 부분 시작 -->
					<div class="schedule_list">
						<!-- 페이지 제목 부분 시작 -->
						<c:if test="${rent eq 'rent'}">
							<div class="scheduleHead">메인 페이지 영상 스케줄 </div>
						</c:if>
						<c:if test="${sessionScope.loginInfo.member.m_class == '1'}">
							<div class="scheduleHead">메인 페이지 영상 스케줄 </div>
						</c:if>
						<c:if test="${sessionScope.loginInfo != null }">
							<c:if test="${sessionScope.loginInfo.member.m_class != '1'}">
								<c:if test="${rent != 'rent'}">
									<div class="scheduleHead">${sessionScope.loginInfo.member.m_nickname}'s Schedule</div>
								</c:if>
							</c:if>
						</c:if>	
						<!-- 페이지 제목 부분 끝 -->
						<!-- 달력 부분 시작 -->	
						<div id='calendar' style="margin-top: 5%; margin-bottom: 10%;"></div>
						<!-- 달력 부분 끝 -->
						<!-- 스케줄 관련 버튼 부분 시작 -->
						<c:if test="${sessionScope.loginInfo != null }">
							<c:if test="${sessionScope.loginInfo.member.m_class != '1'}">
								<button class="sc_main" onclick="location.href='<%= request.getContextPath() %>/schedule/rendSchedule.do'">메인 영상 스케줄</button> 
								<button class="sc_main_rent" onclick="location.href='<%= request.getContextPath() %>/schedule/rentAdd.do'">메인 영상 대여</button> 
								<button class="schedule_add" onclick="location.href='<%= request.getContextPath() %>/schedule/add.do'">스케줄 등록</button> 
								
							</c:if>
						</c:if>
						<!-- 스케줄 관련 버튼 부분 끝 -->
						<form name="del" action="<%= request.getContextPath() %>/schedule/delete.do">
							<input style="display:none;" name="scdelete" class="scdelete" value=""/>
							<input style="display:none;" name="scdeleteid" class="scdeleteid" value=""/>
						</form>
					</div>
					<!-- 스케줄 부분 끝 -->
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