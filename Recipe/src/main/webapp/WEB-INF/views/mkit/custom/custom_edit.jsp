<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<script>
function editCustomCheck() {

	if (confirm("수정을 취소하시겠습니까??") == true) { //확인
		window.location.href='custom_list';
	}else{
		$('#edit_title').focus();
	}
}
</script>
<form id="custom_edit" method="post" onsubmit="return custom_write_check();" action="custom_edit_ok">
	<input type="hidden" name="custom_no" value="${c.custom_no}" />
  	<input type="hidden" name="page" value="${page}" />
	<table id="cedit_t">
		<tr>
			<th style="padding-top: 30px;">제목</th>
			<td style="padding-top: 30px;">
				<input name="custom_title" id="custom_title" size="38" value="${c.custom_title}" />
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input name="custom_writer" id="custom_writer" size="38" value="${c.custom_writer}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="custom_cont" id="custom_cont" rows="15" cols="55">${c.custom_cont}</textarea>
			</td>
		</tr>
	</table>
	<div id="cedit_menu">
		<input type="submit" id="cus_eedit" value="수정" /> 
		<input type="button" id="cus_ecan" value="취소" onclick="editCustomCheck();" /> 
		<input type="button" id="cus_elist" value="목록" onclick="location='custom_list?page=${page}';" />
	</div>
</form>
<jsp:include page="../include/footer.jsp" />