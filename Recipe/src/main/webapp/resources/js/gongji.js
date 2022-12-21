/**
 * mkitmember.js
 */

function gongji_write_check(){
	if($.trim($("#gongji_title").val())==""){
		alert("제목을 입력하세요!");
		$("#gongji_title").val("").focus();
		return false;
	}
	if($.trim($("#gongji_writer").val())==""){
		alert("작성자를 입력하세요!");
		$("#gongji_writer").val("").focus();
		return false;
	}
	if($.trim($("#gongji_cont").val())==""){
		alert("내용을 입력하세요.");
		$("#gongji_cont").val("").focus();
		return false;
	}
};

