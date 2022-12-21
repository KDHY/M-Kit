<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<script>
function editGongjiCheck() {

	if (confirm("수정을 취소하시겠습니까??") == true) { //확인
		window.location.href='/gongji_list';
	}else{
		$('#edit_title').focus();
	}
}
</script>
<form id="gongji_edit" method="post" onsubmit="return gongji_write_check();" action="gongji_edit_ok">
	<input type="hidden" name="gongji_no" value="${g.gongji_no}" />
  	<input type="hidden" name="page" value="${page}" />
	<table id="gedit_t">
		<tr>
			<th style="padding-top: 30px;">제목</th>
			<td style="padding-top: 30px;">
				<input name="gongji_title" id="gongji_title" size="38" value="${g.gongji_title}" />
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input name="gongji_writer" id="gongji_writer" size="38" value="${g.gongji_writer}" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="gongji_cont" id="gongji_cont" rows="15" cols="55">${g.gongji_cont}</textarea>
			</td>
		</tr>
	</table>
	<div id="edit_menu">
		<input type="submit" id="gong_eedit" value="수정" /> 
		<input type="button" id="gong_ecan" value="취소" onclick="editGongjiCheck();" /> 
		<input type="button" id="gong_elist" value="목록" onclick="location='gongji_list?page=${page}';" />
	</div>
</form>
<jsp:include page="../include/footer.jsp" />