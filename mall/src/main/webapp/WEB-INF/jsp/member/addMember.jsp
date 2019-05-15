<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AddMember</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>AddMember</h1>
			<h3>회원가입</h3>
	 	</div>
	</div>
	<div class="container form-group">
		<form action="${pageContext.request.contextPath}/member/addMember" method="post">
			<input type="hidden" name="memberLevel" value="consumer">
			<table class="table">
				<tr>
					<td>아이디</td><td><input type="text" class="form-control" name="memberId"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
				<tr>
					<td>이름</td><td><input type="text" class="form-control" name="memberName"></td>
				</tr>
				<tr>
					<td>휴대전화</td><td><input type="text" class="form-control" name="memberPhone"></td>
				</tr>
				<tr>
					<td>주소</td><td><input type="text" class="form-control" name="memberAddress"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<div class="form-check-inline">
						  	<label class="form-check-label">
						    	<input type="radio" class="form-check-input" name="memberGender" value="M" checked="checked">남성
						  	</label>
						</div>
						<div class="form-check-inline">
						  	<label class="form-check-label">
						    	<input type="radio" class="form-check-input" name="memberGender" value="F">여성
						  	</label>
						</div>
						<div class="form-check-inline">
						  	<label class="form-check-label">
						    	<input type="radio" class="form-check-input" name="memberGender" value="O">기타
						  	</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td><td><input type="text" class="form-control" name="memberEmail"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>