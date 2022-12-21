<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id == null) response.sendRedirect("/mkit_Login");
%>
<script>
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}
function edituserCheck() {

	if (confirm("수정을 취소하시겠습니까??") == true) { //확인
		window.location.href='/mkit_mypage';
	}else{
		$('#edit_name').focus();
	}
}
</script>
<jsp:include page="../include/header.jsp"/>
<div id="mypage_cont">
	<form id="cont_size" action="mkit_edit_ok">
		<table id="myinfo">
			<tr>
				<th>회원명</th>
				<td><input type="text" id="edit_name" name="edit_name" value="${meminfo.mkit_name}"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="edit_id" name="edit_id" value="${meminfo.mkit_id}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="edit_pwd" name="edit_pwd" value="${meminfo.mkit_password}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="edit_mail" name="edit_mail" value="${meminfo.mkit_mail}"></td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
				<input type="text" value="010" size="4" readonly="readonly"> 
				-
				<input type="text" value="${secphone}" size="8" id="edit_secphone" name="edit_secphone"  maxlength="4" oninput="maxLengthCheck(this)">
				-
				<input type="text" value="${lastphone}" size="9" id="edit_lastphone" name="edit_lastphone"  maxlength="4" oninput="maxLengthCheck(this)">
				</td>
			</tr>
		</table>
		<div id="mypagebtn">
			<input type="submit" id="edit_ok" value="수정">
			<input type="button" id="edit_can" value="취소" onclick="edituserCheck()">
		</div>
		
	</form>
</div>

<jsp:include page="../include/footer.jsp" />