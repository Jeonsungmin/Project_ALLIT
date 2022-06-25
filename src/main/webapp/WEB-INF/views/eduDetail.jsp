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
	<h3>상세보기</h3>
		<table class="board">
			<tr>
				<th>글번호</th>
				<td>${dto.board_idx}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.board_title}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.board_date}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.mb_id}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.board_hits}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.board_content}</td>
			</tr>
			<tr>
				<th colspan="2">										
					<input type="button" value ="수정하기" onclick="location.href='boardUpdate.go?board_idx=${dto.board_idx}'"/>
					<input type="button" value ="돌아가기" onclick="location.href='list.go?board_category=${dto.board_category}'"/>
					
				</th>
			</tr>
		</table>
</body>

<script>
/* mb_id
mb_name
mb_pass
mb_postcode
mb_basic_addr
mb_detail_addr
mb_email
mb_tel
mb_gender
mb_birth
mb_major
mb_edu
mb_status
mb_stopcnt
mb_withdraw
category_idx*/


/* var msg = "${msg}";
if(msg != "") {
	alert(msg);
} */
</script>
</html>