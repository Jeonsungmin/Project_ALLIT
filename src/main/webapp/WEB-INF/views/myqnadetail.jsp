<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

table{
	width:600px;
	margin-left:50%;
	margin-right:50%;
	}


table,th,td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px;
      margin: auto;
      text-align:center;
   	}

h4{margin-left: 40%; }

h1{margin:200px 40% 10px 40%;}
</style>
</head>
<body>
<h1>Q&A 상세보기</h1>
<h4>작성 내용</h4>
	<table>
		<thead>
			<tr>
				<th>작성자 ID</th>
				<td>${dto.mb_id}</td>
				<th>작성일자</th>
				<td>${dto.qna_date}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.qna_title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.qna_content}</td>
			</tr>
		</thead>
	</table><br/><br/><br/><br/>
	<h4>답변 내용</h4>
	<table>
		<thead>
			<tr>
				<th>답변자 ID</th>
				<td>${dto.qna_answer_id}</td>
				<th>답변일자</th>
				<td>${dto.qna_answer_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.qna_answer}</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="돌아가기" onclick="location.href='/qnaHistory.go'">
				</th>
		</thead>
	</table>
</body>
<script>


</script>
</html>