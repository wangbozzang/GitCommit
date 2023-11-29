<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
	</head>
	<body>
		<div>
			<h1>스타벅스(f)에 오신걸 환영합니다!</h1>
		</div>
		<c:if test="${ null eq sessionScope.userName }">
			<div>
				<span style="color:red">${msg }</span>
			</div>
			<div>
				<form id="frmLogin" method="post" action="<c:url value='/login.star'/>">
					<input type="text" name="userId" id="userId" placeholder="아이디"><br>
					<input type="text" name="userPw" id="userPw" placeholder="암호"><br>
					<input type="button" id="btnLogin" value="로그인">
				</form>
			</div>
		</c:if>
		<c:if test="${ null ne sessionScope.userName }">
			<div>
				<span>${sessionScope.userName }님 </span>
				<span>
					<input type="button" id="btnLogout" value="로그아웃">
				</span>
			</div>
			<div>
				<ul>
					<li><a href="<c:url value='/starbucks/menu.star'/>">메뉴</a></li>
					<li><a href="<c:url value='/file/main.star'/>">파일</a></li>
				</ul>
			</div>
		</c:if>
		
		<!-- https://chlolisher.tistory.com/100 -->
		<div id="popup_layer" style="display: none">
		  <div class="popup_box">
		      <!--팝업 컨텐츠 영역-->
		      <div class="popup_cont">
		          <h2>BlackFridayGift</h2>
		          <span>
					<img style="width:50%" id="imgBlackFridayGift">
				  </span>
		      </div>
		      <!--팝업 버튼 영역-->
		      <div class="popup_btn">
		          <!--하루동안 보지않기-->
		          <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for a day</a> 
		          <!--7일간 보지않기-->
		          <!-- <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for 7 days</a>-->
		          <a href="javascript:closePop();">Close</a>
		      </div>
		  </div>
		</div>
		
		<script>
			let btnLogin = document.getElementById('btnLogin');
			if ( null != btnLogin ) {
				btnLogin.addEventListener('click',function(){
					document.getElementById('frmLogin').submit();
				});
			}
			let btnLogout = document.getElementById('btnLogout');
			if ( null != btnLogout ) {
				btnLogout.addEventListener('click',function(){
					location.href = "<c:url value='/logout.star'/>";
				});
			}
			
			let getCookie = function(name) {
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
				return value? value[2] : null;
			};
			
			let closePop = function() { 
				document.getElementById("popup_layer").style.display = "none";
			};

			let blackFridayGift = getCookie('BlackFridayGift');
			if ( null != blackFridayGift ) {
				document.getElementById("popup_layer").style.display = "block";
				document.getElementById("imgBlackFridayGift").src
				= "<c:url value='/images/cookie/" + blackFridayGift + ".png'/>"
			}

		</script>
		
		
		
		
		
		
		
	</body>
</html>