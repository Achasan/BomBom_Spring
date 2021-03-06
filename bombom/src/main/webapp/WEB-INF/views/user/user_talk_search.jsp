<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/talk.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
	
	
	<c:set var="session" value="${user}"/>
	<c:set var="paging" value="${paging}"/>
	<div class="containter">
        <div class="jumbotron">
            <div class="textBlock1">
                <span class="main_title">영화수다</span>
                <br>
                <span class="sub_title">봄봄인들의 수다공간</span> 
            </div>
        </div>

		<c:set var="dto" value="${posts}"/>
		<c:set var="today" value="${today}"/>
        <div class="boardArea">
            <div class="board">
                <table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    
                    <c:forEach var="post" items="${dto}" varStatus="status">
                    <tr>
                        <td>${post.getTalk_no()}</td>
                        <td class="title_left">
                            <a href="${pageContext.request.contextPath}/user_talk.do/${post.getTalk_no()}">
                            	${post.getTalk_title()}
                            	<c:if test="${post.getCnt() != 0 }">
                            		<span class="cmt">(${post.getCnt()})</span>
                            	</c:if>
                            </a>
                        </td>
                        <td>
                            <a href="#">${post.getUser_nickname()}</a>
                        </td>
                        <c:if test="${fn:substring(post.getTalk_date(), 0, 10) eq today}">
                        	<td>${fn:substring(post.getTalk_date(), 11, 16)}</td>
                       	</c:if>
                       	
                       	<c:if test="${fn:substring(post.getTalk_date(), 0, 10) ne today}">
                       		<td>${fn:substring(post.getTalk_date(), 0, 10)}</td>
                       	</c:if>
                        <td>${post.getTalk_hit()}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="board_footer">
                <div class="board_bottom">
                
	                <form method="post" action="${pageContext.request.contextPath}/user_search.do" class="search-container">
					  <input id="search-box" type="text" class="search-box" name="keyword" />
					  <label for="search-box">
					    <span>🔍</span>
					  </label>
					  <input type="submit" id="search-submit" />
					</form>
					<c:if test="${session.user_id ne null}">
                    	<a href="${pageContext.request.contextPath}/user_write.do" class="post_btn">글쓰기</a>
                    </c:if>
                </div>

                <div class="paging">
                	<c:if test="${paging.currRange ne 1}">
                		<a href="${pageContext.request.contextPath}/user_search.do?page=${paging.startPage}&keyword=${paging.keyword}" class="paging_first"><<</a>
                	</c:if>
                	<c:if test="${paging.currPage ne 1}">
                		<a href="${pageContext.request.contextPath}/user_search.do?page=${paging.prevPage}&keyword=${paging.keyword}" class="paging_prev"><</a>
                	</c:if>
                	<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
                		<c:choose>
                			<c:when test="${pageNum eq paging.currPage}">
                				<a href="javascript:void(0);" class="paging_number_active">${pageNum}</a>
                			</c:when>
                			<c:otherwise>
                				<a href="${pageContext.request.contextPath}/user_search.do?page=${pageNum}&keyword=${paging.keyword}" class="paging_number">${pageNum}</a>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	<c:if test="${paging.currPage ne paging.pageCount && paging.pageCount > 0}">
                    	<a href="${pageContext.request.contextPath}/user_search.do?page=${paging.nextPage}&keyword=${paging.keyword}" class="paging_next">></a>
                    </c:if>
                    <c:if test="${paging.currRange ne paging.rangeCount && paging.rangeCount > 0}">
                    	<a href="${pageContext.request.contextPath}/user_search.do?page=${paging.endPage}&keyword=${paging.keyword}" class="paging_last">>></a>
                    </c:if>
                </div>
            </div>
        </div>


    </div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>