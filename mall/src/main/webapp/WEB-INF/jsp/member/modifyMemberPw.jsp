<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ModifyMemberPw</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>ModifyMemberPw</h1>
			<h3>회원 비밀번호 수정</h3>
	 	</div>
	</div>
	<div class="container form-group">
		<form action="${pageContext.request.contextPath}/member/modifyMemberPw" method="post">
			<table class="table">
				<tr>
					<td colspan="2">${loginMember.memberId}</td>
				</tr>
				<tr>
					<td>현재비밀번호</td><td><input type="password" class="form-control" name="memberPw1"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" class="form-control" name="memberPw2"></td>
				</tr>
				<tr>
					<td>비밀번호확인</td><td><input type="password" class="form-control" name="memberPw3"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>