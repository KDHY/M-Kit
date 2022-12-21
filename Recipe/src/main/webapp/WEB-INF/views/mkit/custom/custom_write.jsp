<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<script>
function removecustomCheck() {

	if (confirm("작성을 취소하시겠습니까??") == true) { //확인
		window.location.href='/custom_list';
	}else{
		$('#custom_title').focus();
	}
}
</script>
<form id="custom_write" method="post" onsubmit="return custom_write_check();" action="custom_write_ok">
	<table id="mcWrite_t">
		<tr>
			<th style="padding-top: 30px;">제목</th>
			<td style="padding-top: 30px;">
				<input name="custom_title" id="custom_title" size="38" />
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input name="custom_writer" id="custom_writer" size="38" value="${id}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="custom_cont" id="custom_cont" rows="15" cols="55"></textarea>
			</td>
		</tr>
	</table>
	<div id="mcWrite_menu">
		<input type="submit" id="cus_save" value="저장" /> 
		<input type="button" id="cus_can" value="취소" onclick="removecustomCheck();" /> 
		<input type="button" id="cus_wlist" value="목록" onclick="location='custom_list?page=${page}';" />
	</div>
</form>
<jsp:include page="../include/footer.jsp" />