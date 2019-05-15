<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GetProductOne</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>GetProductOne</h1>
			<h3>상품 상세</h3>
	 	</div>
	</div>
	<div class="container form-group">
		<table class="table">
			<tr>
				<th>productCommonNo</th>
				<td>${productCommon.productCommonNo}</td>
			</tr>
			<tr>
				<th>productCommonName</th>
				<td>${productCommon.productCommonName}</td>
			</tr>
			<tr>
				<th>productCommonPrice</th>
				<td>${productCommon.productCommonPrice}</td>
			</tr>
			<tr>
				<th>productCommonDescription</th>
				<td>${productCommon.productCommonDescription}</td>
			</tr>
			<tr>
				<th>productCommonDate</th>
				<td>${productCommon.productCommonDate}</td>
			</tr>
			<tr>
				<th>product</th>
				<td>
					<select class="form-control">
						<c:forEach var="product" items="${productCommon.product}">
							<option>${product.productNo}_${product.productColor}_${product.productSize}(남은수량:${product.productStock})</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>