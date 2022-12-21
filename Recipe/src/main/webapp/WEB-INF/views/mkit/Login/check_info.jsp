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
		
	<form id="checkidpage">
		<h1>회원님의 아이디는 "${mmv.mkit_id}" 입니다.</h1>
		<div id="ckbtn">
		<input type="button" id="ckfilo" value="로그인하기" onclick="location='/mkit_Login'">
		<input type="button" id="ckfipw" value="비번찾기" onclick="location='/find_info'">
		</div>
	</form>
		
<jsp:include page="../include/footer.jsp" />