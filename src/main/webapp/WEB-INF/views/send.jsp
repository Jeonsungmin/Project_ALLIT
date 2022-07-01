<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쪽지 보내기</h1>
<form action="send.do" method="post">
	<table>
		<tr>
			<th>수신자 ID</th>
			<td><input type="text" name="receiver_id" value="${dto.sender_id}" readonly/></td>
			<td><input type="hidden" name="sender_id" value="${sessionScope.loginId}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="msg_content" required></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="돌아가기" onclick="location.href='msgsend.go'"/>
				<input type="submit" value="전송"/>
			</th>
		</tr>
	</table>
</form>
</body>
</html>