<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GetProductListByCategory</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#searchBtn").click(function(){
				$("#searchForm").submit();
			});
		});
	</script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>GetProductListByCategory</h1>
			<h3>카테고리별 상품 목록</h3>
	 	</div>
	</div>
	
	<div class="container form-group">
		<h3>${categoryName}</h3>
		<table class="table">
			<thead>
				<tr>
					<th>productCommonNo</th>
					<th>productCommonName</th>
					<th>productCommonPrice</th>
					<th>productCommonDescription</th>
					<th>productCommonDate</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="productCommon" items="${list}">
					<tr>
						<td>${productCommon.productCommonNo}</td>
						<td><a href="${pageContext.request.contextPath}/product/getProductOne?productCommonNo=${productCommon.productCommonNo}">${productCommon.productCommonName}</a></td>
						<td>${productCommon.productCommonPrice}</td>
						<td>${productCommon.productCommonDescription}</td>
						<td>${productCommon.productCommonDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<form id="searchForm" action="${pageContext.request.contextPath}/product/getProductListByCategory" method="get">
			<input type="hidden" name="categoryNo" value="${categoryNo}">
			상품명 : <input type="text" name="searchWord">
			<input id="searchBtn" type="button" value="검색">
		</form>
		
		<ul class="pagination">
			<c:if test="${lastPage <= 1}">
			</c:if>
			
			<c:if test="${currentPage <= 1 && lastPage > currentPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage+1}">다음페이지</a>
				</li>
			</c:if>
			
			<c:if test="${currentPage > 1 && lastPage > currentPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage-1}">이전페이지</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage+1}">다음페이지</a>
				</li>
			</c:if>
			
			<c:if test="${currentPage > 1 && lastPage <= currentPage}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage-1}">이전페이지</a>
				</li>
			</c:if>
		</ul>
	</div>
</body>
</html>