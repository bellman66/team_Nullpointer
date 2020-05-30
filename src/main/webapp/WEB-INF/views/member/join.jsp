<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<article class="join_box">
			<div class="container">
				<div class="row">
					<div class="join_table">
						<table>
							<tr>
								<td class="join-text">아이디</td>
								<td>
									<input type="text" name="USER_ID" id="USER_ID" class="inputText" maxlength="20" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" />
									<button class="overlap" type="button" onclick="idCheck()">아이디 중복체크</button> 
									<span id="idCheckMsg"></span>
								</td>
							</tr>
							<tr>
								<td class="join-text">비밀번호</td>
								<td>
									<input type="password" name="USER_PWD" id="JOIN_USER_PWD" class="inputText" class="pw" maxlength="30" />
									<span id="pwd-text">영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.</span>
								</td>
							</tr>
							<tr>
								<td class="join-text">비밀번호 확인</td>
								<td>
									<input type="password" name="PWD_CHECK" id="JOIN_PWD_CHECK" class="inputText" maxlength="30" /> 
									<span id="same" style="display: none;">비밀번호가 일치합니다.</span> 
									<span id="different" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
								</td>
							</tr>
							<tr>
								<td class="join-text">이름</td>
								<td>
									<input type="text" name="USER_NAME" maxlength="30" class="inputText" />
								</td>
							</tr>
							<tr>
								<td class="join-text">닉네임</td>
								<td>
									<input type="text" name="NICKNAME" id="NICKNAME" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="inputText" maxlength="15" />
									<button class="overlap" type="button" onclick="nickCheck()">닉네임 중복체크</button><br> 
									<span id="nickCheckMsg"></span>
								</td>
							</tr>
							<tr>
								<td class="join-text">생일</td>
								<td>
								<select name="BIRTHDAY_YY" class="inputText">
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
								<select name="BIRTHDAY_MM" class="inputText">
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
								<select name="BIRTHDAY_DD" class="inputText">
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
									<select name="USER_TELL1" id="USER_TELL1" class="inputText">
										<option value="" selected disabled hidden>==</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> &nbsp;-&nbsp; 
									<input type="text" name="USER_TELL2" size="5" maxlength="4" class="inputText" /> &nbsp;-&nbsp; 
									<input type="text" name="USER_TELL3" size="5" maxlength="4" class="inputText" />
								</td>
							</tr>
							<tr>
								<td class="join-text">이메일</td>
								<td>
									<input type="text" name="USER_MAIL" maxlength="50" class="inputText" />&nbsp;@&nbsp; 
									<select name="USER_MAIL2" class="inputText" style="width: 200px">
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
									<input id="ZIPCODE" name="ZIPCODE" class="inputText" type="text" value="" placeholder="우편번호" style="width: 100px;" readonly /> &nbsp; 
									<!-- 우편주소찾기 버튼 --> 
									<input id="addrFind" type="button" onclick="openDaumZipAddress()" value="주소 찾기" /><br /> 
									<!-- 기본주소 --> 
									<input type="text" id="ADDRESS" name="ADDRESS" placeholder="기본주소" value="" class="inputText" style="width: 240px;" readonly /><br /> 
									<!-- 나머지 주소 -->
									<input type="text" id="ADDRESS_ETC" name="ADDRESS_ETC" placeholder="나머지 주소" value="" class="inputText" style="width: 240px;" />
								</td>
							</tr>
						</table>
						<button id="joinButton" name="joinButton">가입하기</button>
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