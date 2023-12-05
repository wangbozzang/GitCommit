<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
	</head>
	<body>
		<div>
			<ul>
				<li><a href="<c:url value='/'/>">첫화면으로</a></li>
			</ul>
		</div>
		<div>
			<h2>주문목록</h2>
		</div>
		<div>
			<form id="frmOrderSerch" method="post" action="<c:url value='/starbucks/orderList.star'/>">
				<select name="menu">
					<option value="">전체</option>
					<option value="cake">케이크</option>
					<option value="coffee">커피</option>
					<option value="sandwich">샌드위치</option>
				</select>
				<input type="text" name="user_id" placeholder="주문아이디">
				<input type="button" id="btnSearch" value="조회">
			</form>
		</div>
		<div>
			<ul>
				<c:forEach var="order" items="${orderList }" >
					<li>
						<c:out value="${order.seq }" />
						<c:out value="${order.menu }" />
						<c:out value="${order.amount }" />
						<c:out value="${order.sum }" />
						<c:out value="${order.user_id }" />
						<c:out value="${order.create_date }" />
					</li>
				</c:forEach>
			</ul>
		</div>
		<script>
			document.getElementById('btnSearch').addEventListener('click',function(){
				document.getElementById('frmOrderSerch').submit();
			});
		</script>
	</body>
</html>