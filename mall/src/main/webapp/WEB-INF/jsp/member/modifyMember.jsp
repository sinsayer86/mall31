<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ModifyMember</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>ModifyMember</h1>
			<h3>회원 정보 수정</h3>
	 	</div>
	</div>
	<div class="container form-group">
		<form action="${pageContext.request.contextPath}/member/modifyMember" method="post">
			<table class="table">
				<tr>
					<td>아이디</td><td><input type="text" class="form-control" name="memberId" value="${member.memberId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
				<tr>
					<td>이름</td><td><input type="text" class="form-control" name="memberName" value="${member.memberName}"></td>
				</tr>
				<tr>
					<td>휴대전화</td><td><input type="text" class="form-control" name="memberPhone" value="${member.memberPhone}"></td>
				</tr>
				<tr>
					<td>주소</td><td><input type="text" class="form-control" name="memberAddress" value="${member.memberAddress}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<c:if test="${member.memberGender == 'M'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="M" checked="checked">남성
							  	</label>
							</div>
						</c:if>
						<c:if test="${member.memberGender != 'M'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="M">남성
							  	</label>
							</div>
						</c:if>
						<c:if test="${member.memberGender == 'F'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="F" checked="checked">여성
							  	</label>
							</div>
						</c:if>
						<c:if test="${member.memberGender != 'F'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="F">여성
							  	</label>
							</div>
						</c:if>
						<c:if test="${member.memberGender == 'O'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="O" checked="checked">기타
							  	</label>
							</div>
						</c:if>
						<c:if test="${member.memberGender != 'O'}">
							<div class="form-check-inline">
							  	<label class="form-check-label">
							    	<input type="radio" class="form-check-input" name="memberGender" value="O">기타
							  	</label>
							</div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>이메일</td><td><input type="text" class="form-control" name="memberEmail" value="${member.memberEmail}"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>