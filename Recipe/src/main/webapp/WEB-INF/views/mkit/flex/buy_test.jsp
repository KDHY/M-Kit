<%@page import="java.io.PrintWriter"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>
<!-- <form id="buy_info" method="post" action="#">  -->
   <div id="buy_infowrite">
   		<h1>상품 구매</h1>
      <table id="info_write">
         <tr>
            <th>상품명</th>
            <td><input type="text" id="buy_itemname" value="${iitem_name}"></td>
         </tr>
         <tr>
            <th>가격(원)</th>
            <td><input type="text" id="buy_itemprice" value="${total}"></td>
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" id="buy_name" value="${mm.mkit_name}"></td>
         </tr>
         <tr>
            <th>핸드폰</th>
            <td><input type="text" id="buy_phone" value="010-${mm.mkit_phone}"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td><input type="text" id="buy_addr" name="buy_addr"></td>
         </tr>
         <tr>
            <th>우편번호</th>
            <td><input type="text" id="buy_addrnum" name="buy_addrnum"></td>
         </tr>
      </table>
      <div id="gumae_menu">
         <input type="submit" id="buy_suc" value="결제" onclick="requestPay();"/>  
         <input type="button" id="buy_can" value="취소" onclick="buyCheck();" /> 
      </div>
   </div>
<!-- </form>  -->
<jsp:include page="../include/footer.jsp" />

<script type= 'text/javascript'>
/* function requestPay() {
	console.log('merchart_'+new Date().toLocaleString());
	console.log(item_name);
	console.log(item_price);
	console.log(name);
	console.log(phone);
	console.log(addr);
	console.log(addrnum);
	alert("주문번호: "+merchart_uid +" | 구매 물품명 : "+item_name+" | 결제 금액 : "+item_price+" | 구매자명 : "+name
			+"\n 전화번호 : "+phone+" | 배송주소 : "+addr+" | 우편번호 : "+addrnum);
} */

//변수에 가맹점 식별코드를 저장
//API 사용시 필수로 존재해야함
var IMP = window.IMP; 
IMP.init("imp82147837"); 

var merchart_uid = 'merchart_'+new Date().toLocaleString();
var item_name=document.getElementById("buy_itemname").value;
var item_price=parseInt(document.getElementById("buy_itemprice").value);
var name=document.getElementById("buy_name").value;
var phone=document.getElementById("buy_phone").value;
var addr=document.getElementById("buy_addr").value;
var addrnum=document.getElementById("buy_addrnum").value;

  //함수에 매개변수 넘겨줘서 연결하기
  function requestPay() { 
  // IMP.request_pay(param, callback) 결제창 호출
   IMP.request_pay({  // param
	  pg: "html5_inicis", //결제대행사 
      pay_method: "card", // 신용카드 결제
      merchant_uid: 'merchart_'+new Date().toLocaleString(), // 주문번호, 중복되면 작동안되서 날짜가 들어가게함
      name: item_name, //이름
      amount: item_price, //가격
      buyer_email: "gildong@gmail.com", //구매자 이메일
      buyer_name: name, //구매자 이름
      buyer_tel: phone, //구매자 전화번호
      buyer_addr: addr, //구매자 주소
      buyer_postcode: addrnum //구매자 우편번호
   
   }, function (rsp) {  // callback
       if (rsp.success) { // 결제 성공 시 로직
           console.log(rsp); //브라우저에서 f12(개발자 모드) 콘솔 탭에 출력 
           window.location.href='/mkit_main';
      } else { // 결제 실패 시 로직
    	  console.log(rsp);
      	  console.log("결제실패 : "+rsp.error_msg);
      }
  }); 
} 


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