<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h1{margin:200px 50% 10px 50%;
text-align: center;}

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
</style>
</head>
<body>
<h1>쪽지 보기</h1>
<table>
	<tr>
		<th>발신자 ID</th>
		<td>${dto.sender_id}</td>
	</tr>
	<tr>
		<th>수신자 ID</th>
		<td>${dto.receiver_id}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${dto.msg_content}</td>
	</tr>
	<tr>
		<th colspan="3">
		<input type="button" id="chan" value="돌아가기" onclick="location.href='msgsend.go'"/>
		<input type="button" id="hid" value="답장하기" onclick="location.href='send.go?msg_idx=${dto.msg_idx}'"/>
		<input type="button" id="notchan" value="돌아가기" onclick="location.href='sendHistory.go'"/>
		</th>
	</tr>
</table>
</body>
<script>
	var msg = "${msg}";
	 if(msg == "hidden"){
		 var f = document.getElementById("hid");
		 f.type = "hidden";
		 var d = document.getElementById("chan");
		 d.type = "hidden";
	 }else if(msg == "nothidden"){
		 var s = document.getElementById("notchan");
		 s.type = "hidden";
	 }
</script>
</html>