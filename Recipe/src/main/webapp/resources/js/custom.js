/**
 * mkitmember.js
 */

function custom_write_check(){
	if($.trim($("#custom_title").val())==""){
		alert("제목을 입력하세요!");
		$("#custom_title").val("").focus();
		return false;
	}
	if($.trim($("#custom_writer").val())==""){
		alert("작성자를 입력하세요!");
		$("#custom_writer").val("").focus();
		return false;
	}
	if($.trim($("#custom_cont").val())==""){
		alert("내용을 입력하세요.");
		$("#custom_cont").val("").focus();
		return false;
	}
};

function custom_edit_check(){
	if($.trim($("#custom_etitle").val())==""){
		alert("제목을 입력하세요!");
		$("#custom_etitle").val("").focus();
		return false;
	}
	if($.trim($("#custom_ewriter").val())==""){
		alert("작성자를 입력하세요!");
		$("#custom_ewriter").val("").focus();
		return false;
	}
	if($.trim($("#custom_econt").val())==""){
		alert("내용을 입력하세요.");
		$("#custom_econt").val("").focus();
		return false;
	}
};

