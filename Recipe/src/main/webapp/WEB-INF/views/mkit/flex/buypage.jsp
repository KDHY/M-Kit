<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String item_name="크림새우";
	int item_price=8000;
	String name="김대호";
	String phone="5555-5555";
	String addr="서울시 중랑구 면목동";
	String addrnum="02145";
%>
<jsp:include page="../include/header.jsp" />
<script>
	function buyCheck(){
		if($.trim($("#buy_name").val())==""){
			alert("주문자를 입력하세요!");
			$("#buy_name").val("").focus();
			return false;
		}
		if($.trim($("#buy_phone").val())==""){
			alert("폰번호를 입력하세요!");
			$("#buy_phone").val("").focus();
			return false;
		}
		if($.trim($("#buy_addr").val())==""){
			alert("주소를 입력하세요.");
			$("#buy_addr").val("").focus();
			return false;
		}
		if($.trim($("#buy_addrnum").val())==""){
			alert("우편번호를 입력하세요.");
			$("#buy_addrnum").val("").focus();
			return false;
		}
	};
</script>
<form id="buy_info" method="post">
	<div id="buy_infowrite">
		<table id="info_write">
			<tr>
				<th>상품명</th>
				<td><input type="text" id="buy_itemname" value="${item_name}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" id="buy_itemprice" value="${item_price}"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="buy_name" value="${name}"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" id="buy_phone" value="${phone}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="buy_addr" value="${addr}"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" id="buy_addrnum" value="${addrnum}"></td>
			</tr>
		</table>
		<div id="edit_menu">
			<input type="submit" id="buy_suc" value="결제" /> 
			<input type="button" id="buy_can" value="취소" onclick="buyCheck();" /> 
		</div>
	</div>
</form>


<jsp:include page="../include/footer.jsp" />