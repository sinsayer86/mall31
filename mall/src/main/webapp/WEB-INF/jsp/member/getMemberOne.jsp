<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GetMemberOne</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>GetMemberOne</h1>
			<h3>내 정보</h3>
	 	</div>
	</div>
	<div class="container">
		<table class="table">
			<tr>
				<td>아이디</td><td>${member.memberId}</td>
			</tr>
			<tr>
				<td>이름</td><td>${member.memberName}</td>
			</tr>
			<tr>
				<td>휴대전화</td><td>${member.memberPhone}</td>
			</tr>
			<tr>
				<td>주소</td><td>${member.memberAddress}</td>
			</tr>
			<tr>
				<td>성별</td><td>${member.memberGender}</td>
			</tr>
			<tr>
				<td>이메일</td><td>${member.memberEmail}</td>
			</tr>
			<tr>
				<td>권한</td><td>${member.memberLevel}</td>
			</tr>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/member/modifyMember">회원수정</a>
			/
			<a href="${pageContext.request.contextPath}/member/modifyMemberPw">비밀번호수정</a>
		</div>
	</div>
		
</body>
</html>