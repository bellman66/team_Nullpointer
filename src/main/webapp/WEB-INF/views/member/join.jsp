e<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Team_Nullpointer">
<title>Join</title>
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
		.overlap {
			margin-left: 5px;
		}
		#trueMsg {
			display: none;
			margin-left: 5px;
		}
		
		#falseMsg{
			display : none;
			margin-left: 5px;
		}
		#trueMsg_nick {
			display: none;
			margin-left: 5px;
			margin-top: -16px;
		}
		
		#falseMsg_nick {
			display : none;
			margin-left: 5px;
			margin-top: -16px;
		}
		#joinIdCss *{
			float: left;
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
	<section id="content_join">
		<article class="join_box">
			<div class="container">
				<div class="row">
					<div class="join_table">
					
						<form action="<%=request.getContextPath()%>/member/sign_in.do" method="POST" onsubmit="return checkForm();">
						<h2>회원가입 정보</h2>
						<div class="join_list">
						<table>
							<tr>
								<td class="join-text">* 아이디</td>
								<td id="joinIdCss">
									<input type="text" name="m_id" id="USER_ID" class="inputText" maxlength="20" />
									<button id="overlap" class="overlap" type="button" onclick="idCheck()">아이디 중복체크</button> 
									<span id="trueMsg" style="display: none; color: green; font-weight: bold;">사용가능한 아이디입니다.</span>
									<span id="falseMsg" style="display: none; color: #d92742; font-weight: bold;">중복된 아이디입니다.</span>
								</td>
							</tr>
							<tr>
								<td class="join-text">* 비밀번호</td>
								<td>
									<input type="password" name="m_pass" id="JOIN_USER_PWD" class="inputText pw" maxlength="30" />
									<span id="pwd-text">영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.</span>
									<span id="passTrue" style="display: none; color: green; font-weight: bold;">사용가능한 비밀번호</span> 
									<span id="passFalse" style="display: none; color: #d92742; font-weight: bold;">비밀번호 사용 불가능</span>
								</td>
							</tr>
							<tr>
								<td class="join-text">* 비밀번호 확인</td>
								<td>
									<input type="password" name="PWD_CHECK" id="JOIN_PWD_CHECK" class="inputText" maxlength="30" /> 
									<span id="same" style="display: none; color: green; font-weight: bold;">비밀번호가 일치합니다.</span> 
									<span id="different" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
								</td>
							</tr>
							
							<hr>
							
							<tr>
								<td class="join-text">* Class </td>
								<td>
									<b>Basic</b> <input type="radio" name="m_class" value="1" checked="checked"> <br>
									<b>Musician</b> <input type="radio" name="m_class" value="2"> <br>
									<b>Tattooist</b> <input type="radio" name="m_class" value="3">
								</td>
							</tr>
							<tr>
								<td class="join-text">* 이름</td>
								<td>
									<input type="text" id="USER_NAME" name="m_name" maxlength="30" class="inputText" />
								</td>
							</tr>
							<tr>
								<td class="join-text">* 닉네임</td>
								<td id="joinIdCss">
									<input type="text" name="m_nickname" id="NICKNAME" class="inputText" maxlength="15" />
									<button id="overlap_nick" class="overlap" type="button" onclick="nickCheck()">닉네임 중복체크</button><br> 
									<span id="trueMsg_nick" style="display: none; color: green; font-weight: bold;">사용가능한 닉네임입니다.</span>
									<span id="falseMsg_nick" style="display: none; color: #d92742; font-weight: bold;">중복된 닉네임입니다.</span>
								</td>
							</tr>
							<tr>
								<td class="join-text">생일</td>
								<td>
								<select name="bith_yy" class="inputText">
										<option value="" selected disabled hidden>==</option>
										<option value="2001">2001</option>
										<option value="2000">2000</option>
										<option value="1999">1999</option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
										<option value="1996">1996</option>
										<option value="1995">1995</option>
										<option value="1994">1994</option>
										<option value="1993">1993</option>
										<option value="1992">1992</option>
										<option value="1991">1991</option>
										<option value="1990">1990</option>
										<option value="1989">1989</option>
										<option value="1988">1988</option>
										<option value="1987">1987</option>
										<option value="1986">1986</option>
										<option value="1985">1985</option>
										<option value="1984">1984</option>
										<option value="1983">1983</option>
										<option value="1982">1982</option>
										<option value="1981">1981</option>
										<option value="1980">1980</option>
										<option value="1979">1979</option>
										<option value="1978">1978</option>
										<option value="1977">1977</option>
										<option value="1976">1976</option>
										<option value="1975">1975</option>
										<option value="1974">1974</option>
										<option value="1973">1973</option>
										<option value="1972">1972</option>
										<option value="1971">1971</option>
										<option value="1970">1970</option>
								</select>&nbsp;년&nbsp; 
								<select name="bith_mm" class="inputText">
										<option value="" selected disabled hidden>==</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select> &nbsp;월&nbsp; 
								<select name="bith_dd" class="inputText">
										<option value="" selected disabled hidden>==</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
								</select> &nbsp;일&nbsp;</td>
							</tr>
							<tr>
								<td class="join-text">휴대전화</td>
								<td>
									<select name="m_tell1" id="USER_TELL1" class="inputText">
										<option value="" selected disabled hidden>==</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> &nbsp;-&nbsp; 
									<input type="text" name="m_tell2" size="5" maxlength="4" class="inputText" /> &nbsp;-&nbsp; 
									<input type="text" name="m_tell3" size="5" maxlength="4" class="inputText" />
								</td>
							</tr>
							<tr>
								<td class="join-text">* 이메일</td>
								<td>
									<input type="text" id="USER_MAIL" name="m_email1" maxlength="50" class="inputText" />&nbsp;@&nbsp; 
									<select name="m_email2" class="inputText" style="width: 200px">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="join-text">주소</td>
								<td>
									<!-- 신주소 우편번호 --> 
									<input id="ZIPCODE" name="zipcode" class="inputText" type="text" value="" placeholder="우편번호" style="width: 100px;" readonly /> &nbsp; 
									<!-- 우편주소찾기 버튼 --> 
									<input id="addrFind" type="button" onclick="openDaumZipAddress()" value="주소 찾기" /><br> 
									<!-- 기본주소 --> 
									<input type="text" id="ADDRESS" name="address" placeholder="기본주소" value="" class="inputText" style="width: 240px;" readonly /><br> 
									<!-- 나머지 주소 -->
									<input type="text" id="ADDRESS_ETC" name="address_etc" placeholder="나머지 주소" value="" class="inputText" style="width: 240px;" />
								</td>
							</tr>
							<tr>
								<td colspan="2" id="join-agree"><input type="checkbox" id="checkAge">14세 이상입니다.(필수)</td>
							</tr>
							<tr>
								<td colspan="2" id="join-agreetext">* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을 최소화하고 편리한 회원가입을 제공합니다.</td>
							</tr>
						</table>
						</div>
						
						<button type="submit" id="joinButton" name="joinButton">가입하기</button>
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
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-3.5.1.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
		function idCheck() {
			let m_id = $('#USER_ID').val();
			
			if(m_id == '') {
				alert('아이디를 입력해주세요');
			}
			else{
				$.ajax({
					url: "<%=request.getContextPath()%>/member/idCheck.do" ,
					method : "GET" ,
					data : {
						"id" : m_id
					},
					success : function(data) {
						if(data == true) {
							$('#overlap,#falseMsg').css('display',"none");
							$('#trueMsg').css('display','block');
							$('#trueMsg').addClass('checkSum');
							$('#USER_ID').attr('readonly',true);
						}
						else {
							$('#overlap,#falseMsg').css('display',"block");
							$('#trueMsg').css('display','none');
							$('#trueMsg').removeClass('checkSum');
						}
					}
				});
			}
		}
		
		function nickCheck() {
			let m_nick = $('#NICKNAME').val();
			
			if(m_nick == '') {
				alert('닉네임을 입력해주세요');
			}
			else{
				$.ajax({
					url: "<%=request.getContextPath()%>/member/nicknamecheck.do" ,
					method : "GET" ,
					data : {
						"m_nickname" : m_nick
					},
					success : function(data) {
						if(data == true) {
							$('#overlap_nick,#falseMsg_nick').css('display',"none");
							$('#trueMsg_nick').css('display','block');
							$('#trueMsg_nick').addClass('checkSum');
							$('#NICKNAME').attr('readonly',true);
						}
						else {
							$('#overlap_nick,#falseMsg_nick').css('display',"block");
							$('#trueMsg_nick').css('display','none');
							$('#trueMsg_nick').removeClass('checkSum');
						}
					}
				});
			}
		}

		function openDaumZipAddress() {
			daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		                $('#ZIPCODE').val(data.zonecode);
		                $('#ADDRESS').val(data.roadAddress);
		            }
		        }).open();
		    });
		}
		
		$('#JOIN_USER_PWD').on('keyup', function(e) {
			let regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			let pwd = $(this).val();
			
			if(regExp.test(pwd)){	
				// true 인 경우
				$('#passTrue').css('display',"block");
				$('#passTrue').addClass('checkSum');
				$('#passFalse').css('display',"none");
			}
			else {
				$('#passTrue').css('display',"none");
				$('#passTrue').removeClass('checkSum');
				$('#passFalse').css('display',"block");
			}
		});
		
		$('#JOIN_PWD_CHECK').on('keyup', function(e) {
			let pass1 = $('#JOIN_USER_PWD').val();
			let pwd = $(this).val();
			console.log(pass1 + " /// " + pwd)
			
			if(pass1 == pwd){	
				// true 인 경우
				$('#same').css('display',"block");
				$('#same').addClass('checkSum');
				$('#different').css('display',"none");
			}
			else {
				$('#same').css('display',"none");
				$('#same').removeClass('checkSum');
				$('#different').css('display',"block");
			}
		});
		
		function checkForm() {
			
			if(!$('#trueMsg').hasClass('checkSum')){
				alert("아이디 중복체크 확인");
				return false;
			}
			
			if(!$('#passTrue').hasClass('checkSum')){
				alert("비밀번호 확인");
				return false;
			}
			
			if(!$('#same').hasClass('checkSum')){
				alert("비밀번호 중복 확인");
				return false;
			}
			
			// 이름 공란인지 확인
			if($('#USER_NAME').val() == ''){
				alert("이름 입력 확인");
				return false;
			}
			
			if(!$('#trueMsg_nick').hasClass('checkSum')){
				alert("닉네임 중복체크 필수");
				return false;
			}
			
			if($('#USER_MAIL').val() == ''){
				alert("이메일 입력 필수");
				return false;
			}
			
			if(!$('#checkAge').is(":checked")){
				alert("14세 미만은 가입이 불가능합니다.");
				return false;
			}
			
			return true;
		}
	</script>

</body>
</html>