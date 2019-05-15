<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GetMemberId</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>GetMemberId</h1>
			<h3>아이디 찾기</h3>
	 	</div>
	</div>
	<div class="container form-group">
		<form action="${pageContext.request.contextPath}/member/getMemberId" method="post">
			<table class="table">
				<tr>
					<td>이메일</td><td><input type="text" class="form-control" name="memberEmail" placeholder="가입 시 입력한 이메일 입력"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>