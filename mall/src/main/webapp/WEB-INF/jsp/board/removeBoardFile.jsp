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
	<title>BOARD COMMENT REMOVE FORM(spring mvc + mybatis ���)</title>
</head>
<body>
	<div class="container">
	<h1>BOARD COMMENT REMOVE FORM(spring mvc + mybatis ���)</h1>
	     <form  class="form-inline" action="${pageContext.request.contextPath}/board/removeBoardFile" method="post">
	         <!-- boardPw�� �Բ� boardNo���� ���ܼ�(hidden������) �ѱ� -->
	         <input name="boardNo" value="${boardNo}" type="hidden"/>
	         <input name="boardFileNo" value="${boardFileNo}" type="hidden"/>
	         <div class="form-group">
	             <label>��й�ȣȮ�� :</label>
	             <input class="form-control" name="boardPw" type="password">
	         </div>
	         <div class="form-group">
	             <input class="btn btn-default" type="submit" value="���ϻ���"/>
	         </div>
	     </form>
	</div>
</body>
</html>