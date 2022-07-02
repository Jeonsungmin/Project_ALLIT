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
<h1>Q&A 답변하기</h1>
<h4>작성 내용</h4>
	<table>
		<thead>
			<tr>
				<td>작성자 ID</td>
				<td>${dto.mb_id}</td>
				<td>작성일자</td>
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
	
	<form action="answer.do" method="post">
		<table>
			<tr>
				<th>답변자 ID</th>
				<td><input type="text" id="qna_answer_id" name="qna_answer_id" value="${sessionScope.loginId}" readonly/></td>
				<th>작성일자</th>
				<td><input type='date' id='currnetMonth' name="qna_answer_date" readonly></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">내용</td>
				<td colspan="2"><textarea name="qna_answer" id="qna_answer" style="width: 399px; height: 241px;">${dto.qna_answer}</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="돌아가기" onclick="location.href='/msdetail.go'">
					<input type="submit" value="답변하기"/>
				</th>
			</tr>
			<tr>
               <th>글번호</th>
               <td><input type="text" name="qna_idx" id="qna_idx" value="${dto.qna_idx}" readonly/></td>
               <td><select name="qna_answer_chk" id="qna_answer_chk"
                  onchange="selectBoxChange(this.value);">
                     <option value="1">답변완료</option>
                     <option value="0" selected="selected">미답변</option>
               </select></td>
            </tr>
		</table>
	</form>
</body>
<script>
document.getElementById('currnetMonth').value= new Date().toISOString().slice(0, 10);

</script>
</html>