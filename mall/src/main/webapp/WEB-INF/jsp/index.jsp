<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
	    	<h1>Index</h1>
			<h3>쇼핑몰 메인 페이지!</h3>
	 	</div>
	</div>
	<div class="container">
		<c:if test="${loginMember == null}">
			<ol>
				<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/member/addMember">회원가입</a></li>
			</ol>
		</c:if>
		<c:if test="${loginMember != null}">
			${loginMember.memberName}
			<ol>
				<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath}/member/getMemberOne">내 정보 확인</a></li>
				<li><a href="${pageContext.request.contextPath}/member/removeMember">회원 탈퇴</a></li>
			</ol>
		</c:if>
		
		
		 
		<!-- 쇼핑몰 메뉴 -->
		<div>
			<ol>
				<c:forEach var="category" items="${categoryList}">
					<li><a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${category.categoryNo}">${category.categoryName}</a></li>
				</c:forEach>
			</ol>
		</div>
	</div>
</body>
</html>
