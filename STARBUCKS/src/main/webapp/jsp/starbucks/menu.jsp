<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<link href="<c:url value='/css/starbucks.css'/>" rel="stylesheet">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	</head>
	<body>
		<div>
			<ul>
				<li><a href="<c:url value='/'/>">첫화면으로</a></li>
			</ul>
		</div>
		<div>
			<span>
				<img class="menuImg" data-menu="cake" src="<c:url value='/images/starbucks/cake.jpg'/>">
			</span>
			<span>
				<img class="menuImg" data-menu="coffee" src="<c:url value='/images/starbucks/coffee.jpg'/>">
			</span>
			<span>
				<img class="menuImg" data-menu="sandwich" src="<c:url value='/images/starbucks/sandwich.jpg'/>">
			</span>
		</div>
		<div>
			<span>
				<input type="number" id="count" value="1">개
			</span>
		</div>
		<div>
			<span>
				<input type="button" id="btnOrder" value="주문하기">
			</span>
		</div>
		<form id="orderForm" method="post" action="<c:url value='/starbucks/order.star'/>">
			<input type="hidden" id="menu" name="menu">
			<input type="hidden" id="amount" name="amount">
		</form>
		<script src="<c:url value='/js/starbucks_menu.js'/>"></script>
		<script>
			document.getElementById('btnOrder').addEventListener('click',function(){
			
				let json = new Object();
				json.param = new Object();
				json.param.menu = document.getElementById('menu').value;
				json.param.amount = document.getElementById('count').value;
				
				$.ajax({
				  method: "POST",
				  url: "<c:url value='/starbucks/stock.star'/>",
				  data: JSON.stringify(json),
				  contentType: "application/json",
				  async: false
				}).done(function(json) {
					if ( 1 == json.resultCode ) {
						document.getElementById('amount').value = document.getElementById('count').value;
						document.getElementById('orderForm').submit();
					} else {
						alert('주문 가능 개수를 초과하였습니다.(최대수량:' +json.data.stock+ '개)');
					}
				});
				
			});
		</script>
	</body>
</html>