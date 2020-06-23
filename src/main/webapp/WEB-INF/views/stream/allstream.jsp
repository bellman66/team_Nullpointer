<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Stream Live</title>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/stream/allStreamCustom.css" /> 
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
		rel="stylesheet">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.5.1.js"></script>

</head>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Stream container -->
	<section id="content_str">
		<article class="stream_box">
			<div class="container">
				<div class="np_row">
					<div class="stream_list">
	
	<!-- 1.View 방식 선택 : List or Grid -->
    <div class="row">
        <div class="col-lg-12 my-3">
            <div class="pull-right">
                <div class="btn-group">
                    <button class="btn btn-info" id="list">
                        List
                    </button>
                    <button class="btn btn-danger" id="grid">
                        Grid
                    </button>
                    <button class="btn" id="live">
                        Live Start
                    </button>
                </div>
            </div>
        </div>
    </div> 
    
    <!-- 2. 실제 View  -->
    <div id="products" class="row view-group">
    
    			<!-- test 예시  -->
                <!-- <div class="item col-xs-4 col-lg-4">
                    <div class="thumbnail card">
                        <div class="img-event">
                            <img class="group list-group-image img-fluid" src="http://placehold.it/400x250/000/fff" alt="" />
                        </div>
                        <div class="caption card-body">
                            <h4 class="group card-title inner list-group-item-heading">
                                Product title</h4>
                            <p class="group inner list-group-item-text">
                                Product description... Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                                sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                        $21.000</p>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <a class="btn btn-success" href="http://www.jquery2dotnet.com">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <c:if test="${streamObj.size() == 0}">
                	<div id="notStreamDiv">
	                	<span> 
	                		<h1> 
                	스트림 채널이 존재하지않습니다. 
	                		</h1> 
	                	</span>
	                </div>
                </c:if>
                
                <c:forEach var="vo" items="${streamObj}">
	                <div class="item col-xs-4 col-lg-4">
	                    <div class="thumbnail card">
	                    
	                        <div class="img-event">
	                        	<a href="/springmvc/streamMapping/${vo.id}.do">
	                            	<img class="group list-group-image img-fluid" src="http://rndso15.synology.me:8080/hls/${vo.userHashCode}/${vo.userHashCode}_thumbnail.png"
	                            		 onerror="this.src='<%=request.getContextPath()%>/resources/img/stream/wait2.png'" alt="" />
	                        	</a>
	                        </div>
	                        
	                        <div class="caption card-body">
	                            <h4 class="group card-title inner list-group-item-heading">
	                                <c:out value='${vo.title}'/>
	                            </h4>
	                            <span> <c:out value='${vo.people.size()}'/> </span>
	                            <p class="group inner list-group-item-text">
                                	<c:out value='${vo.id}'/>
                                </p>
	                        </div>
	                        
	                    </div>
	                </div>
                </c:forEach>
                
            </div>
					</div>
				</div>
			</div>	
		</article>
	</section>
	
	<script type="text/javascript">
		$(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
       			
            $('#live').click(function(event){
            	location.href = "<%=request.getContextPath()%>/stream/usersetting.do";
            });
		});
	</script>
</body>

</html>