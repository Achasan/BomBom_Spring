<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/talk.css?after"/>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script defer src="${pageContext.request.contextPath}/resources/js/write.js"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu1').attr('id', 'on');
			}
		);
		
	</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>

    <div class="jumbotron">
        <div class="textBlock1">
            <span class="main_title">영화수다</span>
            <br>
            <span class="sub_title">봄봄인들의 수다공간</span> 
        </div>
    </div>

	<c:set var="dto" value="${post}"/>
	<div class="container">
        <form name="postForm" action="${pageContext.request.contextPath}/user_write.do/${dto.getTalk_no()}" method="post">
            <header class="write_header">
                <h2>영화수다 : 글 수정</h2>
            </header>
            
            <div class="write_block">
                <div class="title_wrap">
                    <input type="text" id="title" name="talk_title" placeholder="제목을 입력해주세요" value="${dto.getTalk_title()}"/>
                </div>

                <div class="editor_wrap">
                    <div id="editor">${dto.getTalk_cont()}</div>
                    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                    <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
                    <input id="contValue" type="hidden" name="talk_cont" value=""/>
                </div>
            </div>
            <div class="write_btns">
                <button class="submit_btn" type="button">수정</button>
                <button class="goBack_btn" type="button" onclick="history.back()">뒤로가기</button>
            </div>
        </form>
    </div>
    
    <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>