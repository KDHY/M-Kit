/**
 * mkitmember.js
 */

function write_check(){
	if($.trim($("#m_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#m_name").val("").focus();
		return false;
	}
	if($.trim($("#m_id").val())==""){
		alert("아이디을 입력하세요!");
		$("#m_id").val("").focus();
		return false;
	}
	if($.trim($("#m_pwd").val())==""){
		alert("비밀번호를 입력하세요.");
		$("#m_pwd").val("").focus();
		return false;
	}
	if($.trim($("#m_pwd2").val())==""){
		alert("비밀번호를 입력하세요.");
		$("#m_pwd2").val("").focus();
		return false;
	}
	if($("#m_pwd").val() != $("#m_pwd2").val()){
		alert("비번이 다릅니다!");
		$("#m_pwd").val("");//비번 입력박스를 초기화
		$("#m_pwd2").val("");
		$("#m_pwd").focus();
		return false;
	}
	if($.trim($("#m_mail").val())==""){
		alert("이메일을 입력하세요.");
		$("#m_mail").val("").focus();
		return false;
	}
	if($.trim($("#secphone").val())==""){
		alert("전화번호를 입력하세요.");
		$("#secphone").val("").focus();
		return false;
	}
	if($.trim($("#lastphone").val())==""){
		alert("전화번호를 입력하세요.");
		$("#lastphone").val("").focus();
		return false;
	}
};

//중복아이디 검색
function id_check(){
 /* copy begin */
	$("#idcheck").hide();
	//아이디 영역을 숨김
	$m_id=$.trim($("#m_id").val());
	//1.입력글자 길이 체크
	if($m_id.length < 4){
		$newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#m_id").val('').focus();
		return false;
	};
	if($m_id.length > 12){
		$newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#m_id").val('').focus();
		return false;
	};
	//2.입력글자 확인
	if(!(validate_userid($m_id))){
		$newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#m_id").val('').focus();
		return false;
	};
	//아이디 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
       //url:"./member/member_idcheck.jsp",    
        url:"member_idcheck", //url 패턴 매핑주소 경로
        data: {"id":$m_id},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 자료형
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
        	//서버 데이터를 data변수에 저장
      	  if(data==1){//중복 아이디가 있다면
      		$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
      		$("#idcheck").text('');
        	$("#idcheck").show();
        	$("#idcheck").append($newtext);          		
          	$("#m_id").val('').focus();
          	return false;
	     
      	  }else{//중복 아이디가 아니면
      		$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append($newtext);
      		$("#m_pwd").focus();
      	  }  	    	  
        },
    	  error:function(){//비동기식 아작스로 서버디비 데이터를
    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
    		  alert("data error");
    	  }
      });//$.ajax
 /* end */	
};
function validate_userid($m_id)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
  //자와 숫자 와 _조합으로 처리
  return pattern.test($m_id);
};


function login_check(){
    if($.trim($("#login_id").val())==""){
       alert("로그인 아이디를 입력하세요!");
       $("#login_id").val("").focus();
       return false;
    }
    if($.trim($("#login_password").val())==""){
       alert("로그인 비번을 입력하세요!");
       $("#login_password").val("").focus();
       return false;
    }
 }

