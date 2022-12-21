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
<form id="custom_cont" method="get" action="custom_list">
	<div id="custom">
		<h1>사용자 게시판</h1>
	</div>
	<div id="custom_list">
		<table id="cMain_t">
			<tr id="c_top">
				<th width="6%" height="35">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">날짜</th>
				<th width="14%">조회수</th>
			</tr>
			<c:if test="${!empty clist}">
			<c:set var="customno" value="${listcount-((page-1)*10)}"/>
				<c:forEach var="c" items="${clist}">
					<tr>
						<td align="center">${customno}<%--${(page-1)*10 + gongjino} --%></td>
						<td>
							<a href="custom_cont?no=${c.custom_no}&page=${page}&state=cont">
								${c.custom_title} 
							</a>
						</td>
						<td align="center">${c.custom_writer}</td>
						<td align="center">${fn:substring(c.custom_date,0,10)}</td>
						<td align="center">${c.custom_hit}</td>
					</tr>
				<c:set var="customno" value="${customno-1}"/>
				</c:forEach>
			</c:if>
			<c:if test="${empty clist}">
				<tr>
					<th colspan="5" style="color: black;">목록이 없습니다</th>
				</tr>
			</c:if>
		</table>


		<%--페이징 즉 쪽나누기 추가 --%>
		<div id="cList_paging">
			<%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">
				<c:if test="${page<=1}">
     				[이전]&nbsp;
    			</c:if>

				<c:if test="${page>1}">
					<a href="custom_list?page=${page-1}">[이전]</a>&nbsp;
   				</c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}"> <%--현재 페이지가 선택되었다면--%>
     					<${a}>
     				</c:if>

					<c:if test="${a != page}"> <%--현재 페이지가 선택되지 않았다면 --%>
						<a href="custom_list?page=${a}">[${a}]</a>&nbsp;
     				</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    				[다음]
    			</c:if>

				<c:if test="${page<maxpage}">
					<a href="custom_list?page=${page+1}">[다음]</a>
				</c:if>
			</c:if>

			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty find_field) || (!empty find_name)}">
				<c:if test="${page<=1}">
     				[이전]&nbsp;
    			</c:if>
				<c:if test="${page>1}">
					<a href="custom_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
						[이전] 
					</a>&nbsp;
   				</c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}"> <%--현재 페이지가 선택되었다면--%>
      					<${a}>
     				</c:if>

					<c:if test="${a != page}"> <%--현재 페이지가 선택되지 않았다면 --%>
						<a href="custom_list?page=${a}&find_field=${find_field}&find_name=${find_name}">
							[${a}] 
						</a>&nbsp;
     				</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    				[다음]
    			</c:if>
				<c:if test="${page<maxpage}">
					<a href="custom_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
						[다음] 
					</a>
				</c:if>
			</c:if>
		</div>

		<div id="cList_menu">
			<c:if test="${(!empty find_field) && (!empty find_name)}">
				<input type="button" id="li_gong" value="전체목록" onclick="location='custom_list?page=${page}';" />
			</c:if>
			<c:if test="${!empty grante}">
				<input type="button" id="wr_gong" value="글쓰기" onclick="location='custom_write?page=${page}&id=${id}';" />
			</c:if>
		</div>

		<%--검색 폼추가 --%>
		<div id="cFind_wrap">
			<select name="find_field" id="find_field">
				<option value="custom_title" <c:if test="${find_field=='custom_title'}">${'selected'}</c:if>>제목</option>
				<option value="custom_cont" <c:if test="${find_field=='custom_cont'}">${'selected'}</c:if>>내용</option>
			</select> 
			<input name="find_name" id="find_name" size="14" value="${find_name}" /> 
			<input type="submit" id="gong_ser" 	value="검색" />
		</div>
	</div>
</form>

<jsp:include page="../include/footer.jsp" />