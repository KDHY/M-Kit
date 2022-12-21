<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id == null) response.sendRedirect("/mkit_Login");
%>
<jsp:include page="../include/header.jsp"/>
<script>
	function showdelpage(){
		$('#del_passch').show();
	}
	function closedelpage(){
		$('#del_passch').hide();
	}
</script>
<div id="mypage_cont">
	<div id="cont_size">
		<form id="del_passch" action="/member_del">
			<img id="clodel" src="resources/images/close.png" onclick="closedelpage()">
			<h2>비밀번호 입력</h2>
			<input type="password" id="del_pa_check" name="del_pa_check">
			<input type="submit" value="삭제">
		</form>
		<table id="myinfo">
			<tr>
				<th colspan="2" id="infot"><h1>"${meminfo.mkit_name}" 회원님</h1></th>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${meminfo.mkit_id}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${meminfo.mkit_password}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${meminfo.mkit_mail}</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>010-${meminfo.mkit_phone}</td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td>${meminfo.mkit_date}</td>
			</tr>
		</table>
		<div id="mypagebtn">
			<input type="button" id="info_edit" value="수정" onclick="location='/mkit_edit'">
			<input type="button" id="info_del" value="삭제" onclick="showdelpage()">
		</div>
		
	</div>
</div>

<jsp:include page="../include/footer.jsp" />