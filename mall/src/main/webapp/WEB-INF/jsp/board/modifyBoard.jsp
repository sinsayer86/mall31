<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<title>BOARD MODIFY FORM(spring mvc + mybatis ���)</title>
</head>
<body>
<div class="container">
    <h1>BOARD MODIFY FORM(spring mvc + mybatis ���)</h1> 
    <form id="modifyBoard" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
        <div class="form-group">boardNo :
            <input class="form-control" name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/>
        </div>
        
        <div class="form-group">
            <label for="boardPw">��й�ȣ Ȯ�� :</label>
            <input class="form-control" name="boardPw" id="boardPw" type="password"/>
        </div>
        
        <div class="form-group">
            <label for="boardPw">boardTitle :</label>
            <input class="form-control" value="${board.boardTitle}" name="boardTitle" id="boardTitle" type="text"/>
        </div>
        
        <div class="form-group">boardContent :
            <textarea class="form-control" id="boardContent" name="boardContent" rows="5" cols="50">${board.boardContent}</textarea>
        </div>
        <div><a href="${pageContext.request.contextPath}/board/removeBoardFile?boardNo=${board.boardNo}&boardFileNo=${bf.boardFileNo}">����</a></div>
        <div class="form-group">
	        <label for="boardName">boardFile :</label>
	        <input class="form-control" name="boardFile" id="boardFile" type="file"/>
	    </div>
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
		            	<td><a href="${pageContext.request.contextPath}/board/modifyBoardFile?boardFileNo=${bf.boardFileNo}">����</a></td>
		            	<td><a href="${pageContext.request.contextPath}/board/removeBoardFile?boardNo=${board.boardNo}&boardFileNo=${bf.boardFileNo}">����</a></td>
		            </tr>
		        </c:forEach>
		    </table>
	    </c:if>
        <div>
            <input class="btn btn-default" id="modifyButton" type="submit" value="�ۼ���"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/board/getBoardList">�۸��</a>
        </div>
    </form>
</div>
</body>
</html>