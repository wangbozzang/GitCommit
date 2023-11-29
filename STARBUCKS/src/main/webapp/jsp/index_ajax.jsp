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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	</head> 
	<body>
		<div>
			<h1>스타벅스(a)에 오신걸 환영합니다!</h1>
		</div>
		<div id="divLogin">
			<form id="frmLogin" method="post" action="<c:url value='/login.star'/>">
				<input type="text" name="userId" id="userId" placeholder="아이디"><br>
				<input type="text" name="userPw" id="userPw" placeholder="암호"><br>
				<input type="button" id="btnLogin" value="로그인">
			</form>
		</div>
		<div id="divMenu">
			<div>
				<span id="spanUserName">${sessionScope.userName }님 </span>
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
		</div>
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
					let userId = $('#userId').val();
					let userPw = $('#userPw').val();
					
					let json = new Object();
					json.param = new Object();
					json.param.userId = userId;
					json.param.userPw = userPw;
					
					$.ajax({
					  method: "POST",
					  url: "<c:url value='/loginA.star'/>",
					  data: JSON.stringify(json),
					  contentType: "application/json",
					  async: false
					}).done(function(json) {
						//JSON.parse() : json String으로 받은 경우 변환 필요
						if ( 1 == json.resultCode ) {
							$('#spanUserName').html(json.data.userName + '님');
							$('#divMenu').css('display','block');
							$('#divLogin').css('display','none');
						} else {
							alert('아이디와 비밀번호를 다시 확인해 주세요.');
						 	$('#divMenu').css('display','none');
						 	$('#divLogin').css('display','block');
						}
					});
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
			
			$(function(){
				let userName = '<c:out value="${sessionScope.userName}"/>';
				if ( '' != userName ) {
					$('#divMenu').css('display','block');
					$('#divLogin').css('display','none');
				} else {
				 	$('#divMenu').css('display','none');
				 	$('#divLogin').css('display','block');
				}
			});

		</script>
		
		
		
		
		
		
		
	</body>
</html>