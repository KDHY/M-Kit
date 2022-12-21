<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M-KIT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/m_main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/m_login.css">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/mkitmember.js"></script>
<script type="text/javascript">
	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}

	function removeCheck() {

		if (confirm("정말 취소하시겠습니까??") == true) { //확인
			window.location.href='/mkit_main';
		}else{
			
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%-- 상단 메뉴 --%>
			<div id="header_search">
				<div id="header_logo">
					<%-- 회사 로고 --%>
					<div id="logo">
						<a href="/mkit_main"> <img
							src="/resources/images/mkit_logo.png" width="130px"
							height="130px" alt="MKIT"></a>
					</div>
				</div>
			</div>
		</div>

		<div id="join_main">
			<form name="join" id="join_re" method="post" onsubmit="return write_check()" action="mkitjoin" >
				<div id="topfont">JOIN</div>
				<div class="box2">
					<input type="text" size="20" class="textbox1" placeholder="이름"
						name="m_name" id="m_name" onfocus="this.placeholder=''"
						onblur="this.placeholder='이름'">
				</div>
				<div class="box2">
					<input type="text" size="16" class="textbox1" placeholder="아이디"
						name="m_id" id="m_id" onfocus="this.placeholder=''"
						onblur="this.placeholder='아이디'"> 
						<input type="button" value="중복확인" id="jungbok" onclick="id_check()">
						<br /> <span id="idcheck"></span>
				</div>
				<div class="box2">
					<input type="password" size="20" class="textbox1" id="m_pwd"
						name="m_pwd" placeholder="비밀번호" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호'">
				</div>
				<div class="box2">
					<input type="password" size="20" class="textbox1" id="m_pwd2"
						name="m_pwd2" placeholder="비밀번호 확인" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호 확인'">
				</div>
				<div class="box2">
					<input type="email" size="20" class="textbox1" placeholder="메일"
						name="m_mail" id="m_mail" onfocus="this.placeholder=''"
						onblur="this.placeholder='메일'">
				</div>

				<div class="box2">
					<input type="text" value="010" size="4" readonly="readonly" class="phonebox"> 
					-
					<input type="text" class="phonebox" size="8" id="secphone" name="secphone"  maxlength="4" oninput="maxLengthCheck(this)">
					-
					<input type="text" class="phonebox" size="9" id="lastphone" name="lastphone"  maxlength="4" oninput="maxLengthCheck(this)">
				</div>


				<div id="joinBtns">
					<input type="submit" id="joinBtn" value="회원가입"> 
					<input type="button" id="canBtn" value="취소" onclick="removeCheck()">
				</div>
			</form>
		</div>


		<%-- 하단 공통 영역 --%>
		<jsp:include page="../include/footer.jsp" />