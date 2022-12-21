<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M-KIT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/m_main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/m_login.css">
<link rel="stylesheet" type="text/css" href="/resources/css/find.css">
<script src="/resources/js/find.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%-- 상단 메뉴 --%>
			<div id="header_search">
				<div id="header_logo">
					<%-- 회사 로고 --%>
					<div id="logo">
						<a href="/mkit_main"> 
						<img src="/resources/images/mkit_logo.png" width="130px" height="130px" alt="MKIT"></a>
					</div>
				</div>
			</div>
		</div>

		<div id="find_cont">
		<form id="find_id_cont" onsubmit="return id_find_check()" action="find_id_ok" >
				<div id="id_find">
					<div id="find_id_t">아이디 찾기</div>
					<div id="find_id">
						<input type="text" size="20" class="textbox1" placeholder="이름" id="find_id_name" name="find_id_name"
						onfocus="this.placeholder=''" onblur="this.placeholder='이름'">
						<input type="text" size="20" class="textbox1" placeholder="메일" id="find_id_mail" name="find_id_mail"
						onfocus="this.placeholder=''" onblur="this.placeholder='메일'">	
						<input type="submit" id="find_id_btn" value="아이디 찾기">
					</div>
				</div>
		</form>
		
		<form id="find_pw_cont" onsubmit="return pw_find_check()" action="find_pw_ok">
				<div id="pw_find">
					<div id="find_pw_t">비밀번호 찾기</div>
					<div id="find_pw">
						<input type="text" size="20" class="textbox1" placeholder="아이디" id="find_pw_id" name="find_pw_id"
						onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
						<input type="text" size="20" class="textbox1" placeholder="메일" id="find_pw_mail" name="find_pw_mail"
						onfocus="this.placeholder=''" onblur="this.placeholder='메일'">	
						<input type="submit" id="find_pw_btn" value="비밀번호 찾기">
					</div>
				</div>
		</form>
				<div class="clear"></div>
				<input type="submit" id="find_t_login" value="로그인 페이지로" onclick="location='mkit_Login'">
		</div>

<jsp:include page="../include/footer.jsp" />