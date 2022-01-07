<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_join.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="content">
		<div class="article">	
			<div class="join_box" align="center">
				<h1>회원가입</h1>
				
				<form method="post" action="user_join_ok.do">
					<table class="join_form"> 
						<tr>
							<th>아이디</th>
							<td><input name="user_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"></td>
							<td><button class="btn_general">중복확인</button></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="user_pwd" placeholder="비밀번호를 입력해주세요"></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input name="user_name" placeholder="이름을 입력해주세요"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input name="user_nickname" placeholder="닉네임을 입력해주세요"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input name="user_email" placeholder="예: bom2022@bombom.com"></td>
							<td><button class="btn_general">중복확인</button></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input name="user_phone" placeholder="휴대폰 번호를 입력해주세요"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><button class="btn_address">주소 검색</button></td>
							<td><input name="user_addr" placeholder="API 적용 전 임시 주소 입력창"></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input name="user_age" placeholder="나이를 입력해주세요"></td>
						</tr>
						<tr>
							<th>프로필</th>
							<td><input name="user_profile" placeholder="일단 임시로 아무 스트링 저장"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<select name="user_gender">
									<option value="선택안함">선택안함</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select>
							</td>
						</tr>
					</table>
				
					<button type="submit" class="btn_register">가입하기</button>		
					<button type="reset" class="btn_reset">다시작성</button>
				</form>
				
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>