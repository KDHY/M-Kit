<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<%
if(session.getAttribute("login") == null ) {

} else {
	String id=(String)session.getAttribute("id");
	int grante = (int) session.getAttribute("grante");
}
%>

<form id="menupage" method="get" action="mkit_menu">
	<div id="menu_top">
		<h1>제품</h1>
	</div>
	<%--검색 폼추가 --%>
	<div id="mFind_wrap">
		<select name="find_field" id="mfind_field">
			<option value="mk_name" <c:if test="${find_field=='mk_name'}">${'selected'}</c:if>>제품명</option>
		</select> 
		<input name="find_name" id="mfind_name" size="14" value="${find_name}" />
		<input type="submit" id="menu_ser" value="검색" />
	</div>
	<div id="menu_list">
		<table id="menu_t">
			<c:if test="${!empty mlist}">
				<c:set var="menu_count" value="1" />
				<tr>
					<c:forEach var="m" items="${mlist}">
							<td>
								<a href="menu_cont?no=${m.mk_id}&page=${page}&state=cont"> 
									<img src="/resources/upload${m.mk_images}" width="180" height="180">
								<br><h5>${m.mk_name}</h5> 
								<br><h5>${m.mk_price}원</h5>
								</a> 
							</td>
					<c:if test="${menu_count%4==0}"></tr><tr></c:if>
					<c:set var="menu_count" value="${menu_count+1}" />
				</c:forEach>
			</c:if>
			<c:if test="${empty mlist}">
				<tr>
					<th colspan="5" style="color: black;">목록이 없습니다</th>
				</tr>
			</c:if>
		</table>


		<%--페이징 즉 쪽나누기 추가 --%>
		<div id="mList_paging">
			<%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">
				<c:if test="${page<=1}">
     					[이전]&nbsp;
    				</c:if>

				<c:if test="${page>1}">
					<a href="mkit_menu?page=${page-1}">[이전]</a>&nbsp;
   					</c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<%--현재 페이지가 선택되었다면--%>
     						<${a}>
     					</c:if>

					<c:if test="${a != page}">
						<%--현재 페이지가 선택되지 않았다면 --%>
						<a href="mkit_menu?page=${a}">[${a}]</a>&nbsp;
     					</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    					[다음]
    				</c:if>

				<c:if test="${page<maxpage}">
					<a href="mkit_menu?page=${page+1}">[다음]</a>
				</c:if>
			</c:if>

			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty find_field) || (!empty find_name)}">
				<c:if test="${page<=1}">
     					[이전]&nbsp;
    				</c:if>
				<c:if test="${page>1}">
					<a
						href="mkit_menu?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
						[이전] </a>&nbsp;
   					</c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<%--현재 페이지가 선택되었다면--%>
      						<${a}>
     					</c:if>

					<c:if test="${a != page}">
						<%--현재 페이지가 선택되지 않았다면 --%>
						<a
							href="mkit_menu?page=${a}&find_field=${find_field}&find_name=${find_name}">
							[${a}] </a>&nbsp;
     					</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    					[다음]
    				</c:if>
				<c:if test="${page<maxpage}">
					<a
						href="mkit_menu?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
						[다음] </a>
				</c:if>
			</c:if>
		</div>

		<div id="mList_menu">
			<c:if test="${(!empty find_field) && (!empty find_name)}">
				<input type="button" id="li_menu" value="전체목록"
					onclick="location='mkit_menu?page=${page}';" />
			</c:if>
			<c:if test="${grante == 1}">
				<input type="button" id="menuin" value="등록"
					onclick="location='menu_insert'">
			</c:if>
		</div>


	</div>
</form>


<%-- 하단 공통 영역 --%>
<jsp:include page="../include/footer.jsp" />