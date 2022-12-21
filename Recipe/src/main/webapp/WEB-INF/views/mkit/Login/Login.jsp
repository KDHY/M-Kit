<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M-KIT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/m_main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/m_login.css">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/mkitmember.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%-- 상단 메뉴 --%>
			<div id="header_search">
				<div id="header_logo">
					<%-- 회사 로고 --%>
					<div id="logo">
						<a href="/mkit_main"> <img src="/resources/images/mkit_logo.png" width="130px" height="130px" alt="MKIT"></a>
					</div>
				</div>
			</div>
		</div>


		<div id="login_p">
			<form name="login" id="login_re" method="post" onsubmit="return login_check()" action="member_login_ok">
				<div id="topfont">LOGIN</div>
				<div class="box2">
					<input type="text" size="20" class="textbox1" placeholder="아이디" id="login_id" name="login_id"
						onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
				</div>
				<div class="box2">
					<input type="password" size="20" class="textbox1" id="login_password" name="login_password"
						placeholder="비밀번호" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호'">
				</div>
				
				<div id="ckbox">
					<input type="checkbox"> 로그인 유지
				</div>
				
				<div id="login_btns">

					<div style="margin-bottom: 45px;">
						<input type="submit" id="LoginBtn" value="로그인">
					</div>
					<div id="join_find">
						<a href="/mkit_join">회원가입</a> | <a href="/find_info">ID/PW 찾기</a>
					</div>
				</div>
			</form>
		</div>




		<%-- 하단 공통 영역 --%>
		<jsp:include page="../include/footer.jsp" />