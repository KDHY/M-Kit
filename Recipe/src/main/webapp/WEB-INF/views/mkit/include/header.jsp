<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M-KIT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/m_main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/m_menu.css">
<link rel="stylesheet" type="text/css" href="/resources/css/gongji.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/mkitmember.js"></script>
<script src="/resources/js/gongji.js"></script>
<script src="/resources/js/custom.js"></script>
<%
	if (session.getAttribute("login") == null) {

} else {

	String id = (String) session.getAttribute("id");
	int grante = (int) session.getAttribute("grante");

}
%>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="header_top">
				<c:if test="${empty id}">
					<ul id="login" style="float: right">
						<li><a href='/mkit_Login'>Login</a><span class="textbar"></span></li>
						<li><a href="/mkit_join">Join</a><span class="textbar"></span></li>
					</ul>
				</c:if>
				<c:if test="${not empty id}">
					<ul id="login" style="float: right">
						<li style="margin-right: 30px; font-size: 13px;"> <strong>${id}님 환영합니다.</strong> </li>
						<li><a href='/mkit_Logout'>LogOut</a><span class="textbar"></span></li>
						<li><a href="/mkit_mypage">Mypage</a><span class="textbar"></span></li>
					</ul>
				</c:if>
			</div>

			<div class="clear"></div>



			<%-- 상단 메뉴 --%>
			<div id="header_search">
				<div id="header_logo">
					<%-- 회사 로고 --%>
					<div id="logo">
						<a href="/mkit_main"> <img src="/resources/images/mkit_logo.png" width="130px" height="130px" alt="MKIT"></a>
					</div>
				</div>
				<div id="header_mn">
					<nav id="head_nav">
						<ul>
							<li><a href="/mkit_main">홈</a></li>
							<li><a href="/mkit_menu">품목</a></li>
							<li><a href="/gongji_list">공지사항</a></li>
							<li><a href="/custom_list">게시판</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>