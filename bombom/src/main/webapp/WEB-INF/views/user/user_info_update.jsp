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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info_write.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info.css?after"/>
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script defer src="${pageContext.request.contextPath}/resources/js/info_write.js"></script>

	<script>
			
		let teaser ='${modify.getInfo_teaser()}';
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu2').attr('id', 'on');
			
			$('#info_teaser').val(teaser);
		
		});
		
	</script>
	
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>

    <div class="jumbotron">
        <div class="textBlock1">
            <span class="main_title">영화정보</span>
            <br>
            <span class="sub_title">상영중인 영화의 정보를 한눈에!</span> 
        </div>
    </div>

	<div class="container">
        <form method="post" enctype="multipart/form-data" name="postForm"
			action="<%=request.getContextPath() %>/user_info_update.do">>
            <header class="write_header">
                <h2>영화정보 : 수정하기</h2>
            </header>
            <c:set var="dto" value="${modify }" />
            <c:set var="page" value="${page }" />
            <div class="write_block">
            	
            	<input type="hidden" name="page" value="${page }">
            	<input type="hidden" name="info_no" value="${dto.getInfo_no() }">
            	
                <table class="title_wrap" align="center">
                	<tr>
                		<th> 영화 제목 </th>
                    	<td> 
                    		<input type="text" id="info_title" name="info_title" value="${dto.getInfo_title() }" required="required"/>
               			</td>
               		</tr>
                
               		<tr>
                		<th> 썸네일 이미지</th>
                    	<td> 
                    		<input type="file" id="info_thumbnail" name="thumbnail" required="required"/>
               			</td>
               		</tr>
                    
                	<tr>
                		<th> 배경 이미지</th>
                    	<td> 
                    		<input type="file" id="info_bgimg" name="bgimg" required="required"/>
               			</td>
               		</tr>
                
	                <tr>
                		<th> 개봉 연도</th>
                    	<td> 
                    		<input type="date" id="info_year" name="info_year" value="${dto.getInfo_year() }" required="required"/>
               			</td>
               		</tr>
               		
               		<tr>
                		<th> 러닝타임 </th>
                    	<td> 
                    		<input type="number" min="0" max="300" id="info_runtime" name="info_runtime" value="${dto.getInfo_runtime() }" required="required"/>
               			</td>
               		</tr>
                
	                <tr>
                		<th> 티저 </th>
                    	<td> 
                    		<input type="text" id="info_teaser" name="info_teaser" value="" required="required"/>
               			</td>
               		</tr>
                
	                <tr>
                		<th> 게시글 소제목</th>
                    	<td> 
                    		<input type="text" id="info_subtitle" name="info_subtitle" value="${dto.getInfo_subtitle() }"/ required="required">
               			</td>
               		</tr>
               		
               		<tr>
                		<th> 캐스트 </th>
                    	<td> 
                    		<textarea id="info_cast" name="info_cast" required="required">${dto.getInfo_cast() }</textarea>
               			</td>
               		</tr>
               		
               		<tr>
                		<th> 내용 </th>
                    	<td> 
                    		<textarea id="info_synopsis" name="info_synopsis" required="required">${dto.getInfo_synopsis() }</textarea>
               			</td>
               		</tr>
               		
                </table>

                
            </div>
            <div class="write_btns">
                <button class="submit_btn" type="button">등록</button>
                <button class="goBack_btn" type="button" onclick="history.back()">뒤로가기</button>
            </div>
        </form>
    </div>
    
    <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>