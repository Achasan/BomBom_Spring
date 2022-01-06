<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화커뮤니티 : 봄봄</title>

<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/premiere.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu4').attr('id', 'on');
			}
		);
		
	</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false"/>
	<%-- 가로 배너 들어갈 위치 --%>
	
	<div class="write_wrap">
	
	<!-- 글쓰기 에디터 -->
	<div class="editor_wrap">
         <div id="editor"></div>
         <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
         <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
     </div>
	
	</div>

</body>
</html>