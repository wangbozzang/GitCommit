<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<style>
			#output {
			  display: block;
			  white-space: pre-wrap;
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
			<h2>파일 업로드</h2>
		</div>
		
		<!-- https://velog.io/@virtualplastic/JSP-Servlet-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C -->
		<div>
			<form id="frmUpload" method="post" enctype="multipart/form-data" action="<c:url value='/file/upload.star'/>">
				<input id="file" type="file" name="uploadFile" multiple>
				<output id="output"></output>
				<br>
				<input id="btnUpload" type="button" value="업로드">
			</form>
		</div>
		
		<div>
			<h2>파일 다운로드</h2>
		</div>
		<div>
			<ul id="ulDownload">
				<li data-file-name="brain_full_charge.png">두뇌풀가동</li>
				<li data-file-name="tomcat.zip">톰캣</li>
			</ul>
		</div>
		<form id="frmDownload" method="post" action="<c:url value='/file/download.star'/>">
			<input type="hidden" id="downloadFileName" name="downloadFileName" >
		</form>
		
		<script>
			const input = document.getElementById('file')
			const output = document.getElementById('output')
	
			document.getElementById('file').addEventListener('input', (event) => {
			  const files = event.target.files
			  output.textContent = Array.from(files).map(file => file.name).join('\n')
			})
			
			document.getElementById('btnUpload').addEventListener('click', function(){
				document.getElementById('frmUpload').submit();
			});
			
			Array.from(document.getElementById('ulDownload').children).forEach(function(li){
				li.addEventListener('click', function(){
					document.getElementById('downloadFileName').value = this.dataset.fileName;
					document.getElementById('frmDownload').submit();
				});
			});
			
			
			
			
		</script>
	</body>
</html>