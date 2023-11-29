<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//String menu = (String)request.getAttribute("menu");
	//int amount = (Integer)request.getAttribute("amount");
	//String sum = (String)request.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<style>
		  .main_image {
		    position: relative;
		  }
		  .main_image_text {
		    position: absolute;
		    top: -50%;
		    left: 50%;
		    transform: translate( -50%, -50% );
		    color: white;
		  }
		</style>
	</head>
	<body>
		<div>
			<ul>
				<li><a href="<c:url value='/'/>">첫화면으로</a></li>
			</ul>
		</div>
		<div>
			<h2>
				고객님 주문하신 
				<font style="font-size: 2.5em;"><c:out value="${menu }" /> <c:out value="${amount }" /></font>
				개가 나왔습니다.
			</h2>
		</div>
		<div>
			<h3>결제하실 금액은 <fmt:formatNumber value="${sum }" type="currency" currencySymbol="" />원 입니다.</h3>
		</div>
		<div>
		<%
			//for (int i = 0 ; i < amount ; i++) {
		%>
			<c:forEach begin="1" end="${amount }" var="i" varStatus="s">
				<c:if test="${0 == i%10 }">
					<span class="main_image">
						<img style="width:70px; border:5px solid red" src="<c:url value='/images/starbucks/${menu }.jpg'/>">
						<font class="main_image_text" style="font-size:20px">${i }</font>
					</span>
				</c:if>
				<c:if test="${0 != i%10 }">
					<span>
						<img style="width:70px;" src="<c:url value='/images/starbucks/${menu }.jpg'/>">
					</span>
				</c:if>
			</c:forEach>
		<%
			//}
		%>
		</div>
	</body>
</html>