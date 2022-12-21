<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<%
if (session.getAttribute("login") == null) {

} else {

String id = (String) session.getAttribute("id");
int grante = (int) session.getAttribute("grante");

}
%>
<script>
function GongjiremoveCheck() {

	if (confirm("삭제 하시겠습니까??") == true) { //확인
		window.location.href='gongji_cont?no=${g.gongji_no}&page=${page}&state=del';
	}else{
		
	}
}
</script>

<form id="gongji_view" method="post">
	<div id="bCont_wrap">
		<table id="bCont_t">
			<tr>
				<td style="font-size: 35px; height: 80px;">${g.gongji_title}</td>
				<td rowspan="2" style="text-align: right;">조회수 : ${g.gongji_hit}회</td>
			</tr>
			<tr>
				<td style="font-size: 11px;">${g.gongji_writer}</td>
			</tr>
			<tr id="contbot">
				<td colspan="2">${gcont}</td>
			</tr>

		</table>
			<div id="bCont_menu">
				<c:if test="${grante  == 1}">
					<input type="button" id="gong_edit" value="수정" onclick="location='gongji_cont?no=${g.gongji_no}&page=${page}&state=edit';" />
					<input type="button" id="gong_del" value="삭제" onclick="GongjiremoveCheck();" />
					<input type="button" id="gong_list" value="목록" onclick="location='gongji_list?page=${page}';" />
				</c:if>
				<c:if test="${grante != 1}">
					<input type="button" id="il_gong_list" value="목록" onclick="location='gongji_list?page=${page}';" />
				</c:if>
				
			</div>
		</div>
</form>

<jsp:include page="../include/footer.jsp" />