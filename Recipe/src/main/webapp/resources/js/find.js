/**
 * mkitmember.js
 */

function id_find_check(){
	if($.trim($("#find_id_name").val())==""){
		alert("이름을 입력하세요!");
		$("#find_id_name").val("").focus();
		return false;
	}
	if($.trim($("#find_id_mail").val())==""){
		alert("메일을 입력하세요!");
		$("#find_id_mail").val("").focus();
		return false;
	}
};

function pw_find_check(){
	if($.trim($("#find_pw_id").val())==""){
		alert("아이디을 입력하세요!");
		$("#find_pw_id").val("").focus();
		return false;
	}
	if($.trim($("#find_pw_mail").val())==""){
		alert("메일을 입력하세요!");
		$("#find_pw_mail").val("").focus();
		return false;
	}
};

