<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />
	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script defer src="https://kit.fontawesome.com/2c8a84bfa2.js" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<jsp:include page="./include/header.jsp" flush="false"/>
	
	<c:set var="posts" value="${posts}"/>
	<c:set var="premiere" value="${premiere}"/>
	<c:set var="info" value="${info}"/>
	
	<div id="slideShow"> 
		<iframe src="./banner" frameborder="0" width="100%"  height="420px" scrolling=auto name=banner ></iframe>
	</div>
	
	<%-- 본문 컨텐츠 자리 --%>
	<div class="main_content first">

        <div class="notice">
 			<img id="notice" alt="" src="resources/image/notice.png"
				onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">
			<div class="notice_content">
				<div class="content_container">
					<ul class="content_container_list">
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=3&page=1">[공지사항] 영화수다 게시판 이용 관련 공지사항입니다.</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=4&page=1">[공지사항] 신규기능 '극장맛집' 탭 소개 및 이용안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=5&page=1">[공지사항] 2022년 개봉예정작 시사회 일정 안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=6&page=1">봄봄 커뮤니티에 오신 것을 환영합니다.</a>
				      </li>
				    </ul>
			    </div>
		    </div>
		</div>
		
		

        <div class="talk_section">
            <h2>인기 게시글</h2>
                <div class="talk_posts">
                    <ul>
                    <c:forEach var="postDTO" items="${posts}" varStatus="status">
                        <li>
                        <c:choose>
                        	<c:when test="${status.count == 1}">
                            	<span class="rank one">${status.count}</span>
                            </c:when>
                            <c:when test="${status.count == 2}">
                            	<span class="rank two">${status.count}</span>
                            </c:when>
                            <c:when test="${status.count == 3}">
                            	<span class="rank three">${status.count}</span>
                            </c:when>
                            <c:otherwise>
                            	<span class="rank">${status.count}</span>
                            </c:otherwise>
                        </c:choose>
                            <a href="${pageContext.request.contextPath}/user_talk.do/${postDTO.getTalk_no()}">
                            	${postDTO.getTalk_title()}
                            	<c:if test="${postDTO.getCnt() != 0 }">
                            		<span class="cmt">(${postDTO.getCnt()})</span>
                            	</c:if>
                            </a>
                            <div class="score_block">
                                <span class="talk_score">
                                    <i class="fas fa-thumbs-up"></i>
                                    <span>${postDTO.getTalk_like()}</span>
                                </span>
                                <span class="talk_score">
                                    <i class="fas fa-eye"></i>
                                    <span class="hit">${postDTO.getTalk_hit()}</span>
                                </span>                                
                            </div>
                        </li>                     
					</c:forEach>
                    </ul>
                </div>
        </div>
   </div>
   <div class="info_content">
        <div class="info_section">	
			<h2>영화 정보</h2>
			<div class="info_cards">
			<c:forEach var="idto" items="${info}">
		    	<figure>
					<a href="${pageContext.request.contextPath}/main_info_detail.do?no=${idto.getInfo_no() }">
				    	<div class="gallery-img"><img src="resources/upload/info/${idto.getInfo_thumbnail() }" ></div>
				
				      	<figcaption>
							
				          	<h3>${idto.getInfo_subtitle() }</h3>
							<br>
				          	<p>${idto.getInfo_synopsis().substring(0, 50) }...</p>
				
				      	</figcaption>
					</a>
			  	</figure>     
			  </c:forEach>
			 </div>
		</div>
	</div>     
    
    <div class="main_content">
		<div class="article">	
			<h2>시사회 정보</h2>
				<div class="premiere_content">
				<!-- 게시물 영역을 누르면 모달창으로 넘어갈 수 있도록 -->
				<c:if test="${!empty premiere }">
				<c:forEach items="${premiere }" var="pDto">
				
					<div class="content_cards" 
						onclick="location.href='${pageContext.request.contextPath}/user_premiere.do?no=${pDto.getPremiere_no() }'">
					
					<!-- 오늘날짜 -->
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
					
					<!-- 비교할 날짜 -->
					<fmt:parseDate var="bdate" value="${pDto.getPremiere_date()}" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate var="oldday" value="${bdate}" pattern="yyyyMMdd" />
					
					<c:set var="dateCal" value="${today-oldday}"/>
					
						<div class="content_img_wrapper">
						<!-- 게시글 작성일이 7일 전이면  N 딱지 보여주기-->
						<c:if test="${dateCal<'7' }">
							<span class="new_atc">N</span>
						</c:if>
							<img src="resources/upload/premiere/${pDto.getPremiere_thumbnail() }" 
								alt="${pDto.getPremiere_title() }">
						</div>
						
						<div class="content_title">
							<!-- 제목 문자열이 길면 자르자 -->
							<c:if test="${pDto.getPremiere_title().length()>20 }">
								<p>${pDto.getPremiere_title().substring(0,19) }...</p>
							</c:if>
							<!-- 제목 문자열이 20자 이하면 그대로 보여주자 -->
							<c:if test="${pDto.getPremiere_title().length()<=20 }">
								<p>${pDto.getPremiere_title() }</p>
							</c:if>
						</div>
					</div>
				</c:forEach>	
				</c:if>
         	</div>
		</div>
  </div>
  
  <div class="food_content">
        <div class="food_section">	
        	<h2>극장 맛집</h2>
			<div class="food_container">	
				<div class="food_image">
					<img src="resources/image/cgv_용산.jpg" onclick="alert('클릭')">
				</div>
				
				<div class="food_list">
					<ul>
						<li id="food_first" onclick="location.href='${pageContext.request.contextPath}/user_food.do'"><span>전체보기</span></li>
					</ul>
					<ul>
						<li id="on"><span>CGV 용산</span></li>
					</ul>
					<ul>
						<li><span>롯데시네마 월드타워</span></li>
					</ul>
					<ul>
						<li><span>메가박스 코엑스</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>  
	
	<jsp:include page="./include/footer.jsp" flush="false"/>
	
<%--	
</body>
</html>
--%>