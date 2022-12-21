<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M-KIT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/m_main.css">
<%
	int price=8000;
	
	String id=(String)session.getAttribute("id");

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
						<li style="margin-right: 30px; font-size: 13px;"> <strong>${id}님 환영합니다.</strong><br> </li>
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



		<!-- 메인  -->
		<div id="main_cont">
			<div id="banner">
				<img src="/resources/images/pre1.png" class="cha_btn" onclick="btn_m()"
					style="width: 60px; height: 60px;">
				<div id="bannerimg">
					<img src="/resources/images/main4.jpg" id="bannerImage">
				</div>
				<img src="/resources/images/next1.png" class="cha_btn" onclick="btn_s()"
					style="width: 60px; height: 60px;">
			</div>
			
			<div id="glsi">
				<div class="hr-sect">이달의 특선(50% 세일)</div>
			</div>
			<div id="menues">

				<table id="m_menu_t">
					<tr>
						<c:forEach var="m" items="${mlist}">
							<td>
								<a href="menu_cont?no=${m.mk_id}&state=cont"> 
									<img src="/resources/upload${m.mk_images}" width="180" height="180">
									<br>
									<h5>${m.mk_name}</h5> 
									<br>
									<h5>${m.mk_price}원</h5>
								</a>
							</td>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
		

		
		<!-- 수평선 -->
		<div id="footer">
		<hr id="fothr"> 	
			<div id="copy_mn">
				<div id="copy">
					상호 :주식회사 엠키트 대표 :누군가 사업자등록번호 : 725-88-00354 <br>
					통신판매업신고번호:제2050-서울어디-1234호<br> 대표번호 :1228-1234 팩스번호
					:031-121-1234 문의 :Mkit@myKit.kr<br> 주소 :서울시 어디가 있는동 100-8번지
					123호 <br> copyright (c) Mkit.kr all rights reserved.
				</div>
			</div>
			<div id="social_mn">
				<div id="social">
					<img src="/resources/images/mkit_logo.png" width="150" height="150" style="float: left;">
					<a href="#"><img src="/resources/images/face.png" width="60" height="60" style="float: left; margin-left:15px;" alt="Facebook"></a>
					<a href="#"><img src="/resources/images/insta.png" width="60" height="60" style="margin-left: 8px;" alt="Twitter"></a>
				</div>
			</div>
		</div>
	</div>

	<script>
		var myImage = document.getElementById("bannerImage");
		var imageArray = [ "/resources/images/main4.jpg",
				"/resources/images/main5.png", "/resources/images/main6.jpg" ];
		var imageIndex = 1;

		function changeImage() {
			myImage.setAttribute("src", imageArray[imageIndex]);
			imageIndex++;
			if (imageIndex >= imageArray.length) {
				imageIndex = 0;
			}
		}
		function btn_s() {
			myImage.setAttribute("src", imageArray[imageIndex]);
			imageIndex++;
			if (imageIndex >= imageArray.length) {
				imageIndex = 0;
			}
		}
		function btn_m() {
			myImage.setAttribute("src", imageArray[imageIndex]);
			imageIndex--;
			if (imageIndex < 0) {
				imageIndex = 2;
			}
		}
		setInterval(changeImage, 3000);
	</script>
</body>
</html>