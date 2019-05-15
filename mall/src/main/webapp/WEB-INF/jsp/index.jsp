<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
			<h3>���θ� ���� ������</h3>
	 	</div>
	</div>
	<div class="container">
		<c:if test="${loginMember == null}">
			<ol>
				<li><a href="${pageContext.request.contextPath}/member/login">�α���</a></li>
				<li><a href="${pageContext.request.contextPath}/member/addMember">ȸ������</a></li>
			</ol>
		</c:if>
		<c:if test="${loginMember != null}">
			${loginMember.memberName}
			<ol>
				<li><a href="${pageContext.request.contextPath}/member/logout">�α׾ƿ�</a></li>
				<li><a href="${pageContext.request.contextPath}/member/getMemberOne">�� ���� Ȯ��</a></li>
				<li><a href="${pageContext.request.contextPath}/member/removeMember">ȸ�� Ż��</a></li>
			</ol>
		</c:if>
		
		<!-- ���θ� �޴� -->
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