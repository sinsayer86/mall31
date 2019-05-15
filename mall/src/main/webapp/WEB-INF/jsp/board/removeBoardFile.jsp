<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<title>BOARD COMMENT REMOVE FORM(spring mvc + mybatis 방식)</title>
</head>
<body>
	<div class="container">
	<h1>BOARD COMMENT REMOVE FORM(spring mvc + mybatis 방식)</h1>
	     <form  class="form-inline" action="${pageContext.request.contextPath}/board/removeBoardFile" method="post">
	         <!-- boardPw와 함께 boardNo값도 숨겨서(hidden값으로) 넘김 -->
	         <input name="boardNo" value="${boardNo}" type="hidden"/>
	         <input name="boardFileNo" value="${boardFileNo}" type="hidden"/>
	         <div class="form-group">
	             <label>비밀번호확인 :</label>
	             <input class="form-control" name="boardPw" type="password">
	         </div>
	         <div class="form-group">
	             <input class="btn btn-default" type="submit" value="파일삭제"/>
	         </div>
	     </form>
	</div>
</body>
</html>