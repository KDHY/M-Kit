<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<script>
function custom_write_check(){
	if($.trim($("#item_iname").val())==""){
		alert("상품명을 입력하세요!");
		$("#item_iname").val("").focus();
		return false;
	}
	if($.trim($("#item_price").val())==""){
		alert("가격을 입력하세요!");
		$("#item_price").val("").focus();
		return false;
	}
	if($.trim($("#iitem_cont").val())==""){
		alert("상품설명을 입력하세요.");
		$("#iitem_cont").val("").focus();
		return false;
	}
};
function insertmenuCan() {

	if (confirm("등록을 취소하시겠습니까??") == true) { //확인
		window.location.href='/mkit_menu';
	}else{
		$('#item_iname').focus();
	}
}
</script>
<div>
	<form id="insert_ment" action="menu_write_ok" onsubmit="return custom_write_check()" enctype="multipart/form-data" method="post">
	<h1>상품 등록</h1>
		<table id="in_item_t">
			<tr>
				<th>상품명</th>
				<td><input name="item_name" id="item_iname"/></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input name="item_price" id="item_price"/></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td><textarea name="item_cont" id="iitem_cont" rows="8" cols="12"></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="item_file" id="item_file" /></td>
			</tr>
		</table>
		<div id="bsW_menu">
			<input type="submit" value="등록" /> 
			<input type="button" value="취소" onclick="insertmenuCan();"> 
			<input type="button" value="목록" onclick="location='mkit_menu?page=${page}';">
		</div>
	</form>
</div>
<%-- 하단 공통 영역 --%>
<jsp:include page="../include/footer.jsp" />