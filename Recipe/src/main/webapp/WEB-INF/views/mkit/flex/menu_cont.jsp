<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  const totalElement = document.getElementById('total');
	  const priceElement = document.getElementById('item_gagg');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  let price = priceElement.innerText;
	  let total=0;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	    total=parseInt(price)*number;
	  }else if(type === 'minus')  {
		if(parseInt(number)>0){
	    number = parseInt(number) - 1;
	    total=parseInt(price)*number;
		}
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  $('#total').attr("value",total);
	}
</script>

<form id="page_cont" method="post" action="menu_buy">
	<div id="pagemain">
		<img src="/resources/upload${mm.mk_images}" id="kitmainimg">
		<ul id="item_cont">
			<li style="margin-top: 50px;"><input type="text" id="iitem_name" name="iitem_name" value="${mm.mk_name}"><!-- 여기에 값가져온거 사용 --></li>
			
			<li style="margin-top: 100px; width: 700px;"><hr></li>
			
			<li class="item_info">가   격</li>
			<li class="item_info_info"><div id="item_gagg">${mm.mk_price}원</div></li>
			
			<li class="item_info">개   수</li>
			<li class="item_info_info">
			<input type='button' class="udbtn" id="upbtn" onclick='count("plus")' value='+'/>
			<div id='result'>0</div>
			<input type='button' class="udbtn" onclick='count("minus")' value='-'/>
			</li>
			
			<li style="margin-top:95px;width: 700px;"><hr></li>
			
			<li class="total_price">총가격</li>
			<li class="total_price_info"><div><input type="text" id='total' name="total" value="0"></div>원<!-- 여기에 값가져온거 사용 --></li>
			<li><div class="clear"></div></li>
			
			
			<li>
				<div id="item_button">
					<input type="button" id="bagunibutton" value="장바구니" onclick="location='menu_backpack'">
					<input type="submit" id="buybutton" value="즉시구매">
				</div>
			</li>
		</ul>
	</div>
	<hr style="width: 1200px;">
	<h2 id="mtmtmt">설명</h2>
	<div id="menu_sulm">
			${mcont}
	</div>
</form>

<jsp:include page="../include/footer.jsp"/>