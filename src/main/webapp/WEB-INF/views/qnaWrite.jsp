<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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

	h2{
   width:100px;
    text-align: center;
    font-weight: bold;
    position : relative;
    margin-top:200px;
    margin-left:50%;
    margin-right:50%;
   }
   
 	td, th {
    width: 300px;
    border: 1px solid #444444;
    
   }
   
   form{
   width: 300px;
   height: 500px;
   margin-left:50%;
    margin-right:50%;
   }
   
   #qna_content{
   width: 400px;
   height: 100px;
   }
   
   #qna_title{
   width: 400px;}

	
</style>
</head>

<body>

<h2>Q&A 글쓰기</h2>
	<form action="write.do" method="post">
		<table>
			<thead>
				<tr>
					<td>작성자 ID</td>
					<td><%=session.getAttribute("loginId")%></td>
					<td>작성일자</td>
					<td><input type='date' id='currnetMonth' name="qna_date" readonly></td>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2" text-align:center>제목</td>
				<td colspan="2"><input type="text" name="qna_title" id="qna_title"/></td>
			</tr>
			<tr>
				<td colspan="2" text-align:center;>내용</td>
				<td colspan="2"><textarea name="qna_content" id="qna_content" style="width: 399px; height: 241px;"/></textarea></td>
			</tr>
			</tbody>
			<tr>
				<td colspan="2">
					<input type="button" value="돌아가기" onclick="location.href='list.go'">
					<input type="submit" value="작성하기"/>
				</td>
			</tr>
		</table>
	</form>
</body>


<script>
document.getElementById('currnetMonth').value= new Date().toISOString().slice(0, 10);
</script>
</html>