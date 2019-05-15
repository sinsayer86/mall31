<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BOARD VIEW(spring mvc 방식 + mybatis)</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	    <h1>BOARD VIEW(spring mvc + mybatis 방식)</h1>
	     <table class="table">
	         <tbody>
	            <tr>
	                <td>board_no :</td>
	                <td>${board.boardNo}</td>
	               </tr>
	            <tr>
	               	<td>board_title :</td>
	               	<td>${board.boardTitle}</td>
	            </tr>
	            <tr>
	               	<td>board_content :</td>
	               	<td>${board.boardContent}</td>
	            </tr>
	            <tr>
	               	<td>board_user :</td>
	               	<td>${board.boardUser}</td>
	            </tr>
	            <tr>
					<td>board_date :</td>
	               	<td>${board.boardDate}</td>
	            </tr>
	            
	        </tbody>
	    </table>
	    <c:if test="${boardFileList.size() != 0}">
			<table class="table">
				<c:forEach var="bf" items="${boardFileList}" varStatus="status">
		         	<tr>
		           		<td>board_file_${status.count}</td>
		            	<td><a href="${pageContext.request.contextPath}/upload/${bf.boardFileSaveName}.${bf.boardFileExt}">${bf.boardFileOriginName}.${bf.boardFileExt}</a></td>
		           		<td>
		            		<c:if test="${bf.boardFileSize < 1024}">
		            			${bf.boardFileSize}Byte
		            		</c:if>
		            		<c:if test="${bf.boardFileSize >= 1024 && bf.boardFileSize < 1048576}">
		            			${bf.boardFileSize / 1024}KB
		            		</c:if>
		            		<c:if test="${bf.boardFileSize >= 1048576}">
		            			${bf.boardFileSize / 1048576}MB
		            		</c:if>
		            	</td>
		            	<td><a href="${pageContext.request.contextPath}/board/modifyBoardFile?boardFileNo=${bf.boardFileNo}">수정</a></td>
		            	<td><a href="${pageContext.request.contextPath}/board/removeBoardFile?boardNo=${board.boardNo}&boardFileNo=${bf.boardFileNo}">삭제</a></td>
		            </tr>
		        </c:forEach>
		    </table>
	    </c:if>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/getBoardList">글목록</a>
		<table>
			<c:forEach var="bc" items="${boardCommentList}">
				<tr>
					<td>${bc.boardCommentNo}_</td>
					<td>${bc.boardCommentUser}</td>
				</tr>
				<tr>
					<td colspan="2">${bc.boardCommentContent}</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/board/removeBoardComment?boardNo=${board.boardNo}&boardCommentNo=${bc.boardCommentNo}">댓글삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<form action="${pageContext.request.contextPath}/board/addBoardComment" method="post">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<div>boardCommentUser <input type="text" name="boardCommentUser"></div>
				<div>boardCommentPw <input type="password" name="boardCommentPw"></div>
				<div>boardCommentContent</div>
				<div><textarea name="boardCommentContent" cols="80" rows="3"></textarea></div>
				<div><input type="submit" value="댓글입력"></div>
			</form>
		</div>
	</div>
</body>
</html>
