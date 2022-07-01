<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style></style>
</head>
<body>
	<%-- <jsp:include page="./commons/loginBox.jsp"/> --%>
	<h3>수정하기</h3>
		<form action="board_update.do" method="post">
			<table class="board">
				<tr>
					<th>제목</th>
					<td>
						<input type="hidden" name="board_idx" value="${dto.board_idx}"/>
						<input type="text" name ="board_title" value="${dto.board_title}"/>
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<input type="text" name="board_date" value="${dto.board_date}" readonly/>				
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="mb_id" value="${dto.mb_id}" readonly/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name ="board_content" value="${dto.board_content}"/>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value ="저장"/> <%--  onclick="location.href='datail.go?idx=${dto.board_idx}'" --%>
						<input type="button" value ="돌아가기" onclick="location.href='list.go'"/>
					</th>
				</tr>
			</table>
		</form>
</body>
<script>
/* var msg = "${msg}";
if(msg != "") {
	alert(msg);
} */
</script>
</html>