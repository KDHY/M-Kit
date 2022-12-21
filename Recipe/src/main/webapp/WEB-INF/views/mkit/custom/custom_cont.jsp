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
function CustomremoveCheck() {

	if (confirm("삭제 하시겠습니까??") == true) { //확인
		window.location.href='custom_cont?no=${c.custom_no}&page=${page}&state=del';
	}else{
		
	}
}
</script>

<form id="custom_view" method="post">
	<div id="cCont_wrap">
		<table id="cCont_t">
			<tr>
				<td style="font-size: 35px; height: 80px;">${c.custom_title}</td>
				<td rowspan="2" style="text-align: right;">조회수 : ${c.custom_hit}회</td>
			</tr>
			<tr>
				<td style="font-size: 11px;">${c.custom_writer}</td>
			</tr>
			<tr id="contbot">
				<td colspan="2">${ccont}</td>
			</tr>

		</table>
			<div id="cCont_menu">
				<c:choose>
					<c:when test="${(!empty grante && id eq c.custom_writer) || grante == 1}">
						<input type="button" id="cus_edit" value="수정" onclick="location='custom_cont?no=${c.custom_no}&page=${page}&state=edit';" />
						<input type="button" id="cus_del" value="삭제" onclick="CustomremoveCheck();" />
						<input type="button" id="cus_list" value="목록" onclick="location='custom_list?page=${page}';" />
					</c:when>
					<c:when test="${(!empty grante && id ne c.custom_writer) || empty grante}">
						<input type="button" id="cus_nlist" value="목록" onclick="location='custom_list?page=${page}';" />				
					</c:when>
				</c:choose>
			</div>
		</div>
</form>

<jsp:include page="../include/footer.jsp" />