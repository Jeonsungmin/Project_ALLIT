<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	h3{
		margin-top:18px;
		text-align:center;
		background-color:#f2f2f2;
	}
	td{	
		font-size: 12px
   }
   td,th{
      padding: 15px 10px;
   }
   table{
      width: 350px;
      margin:0 auto;
   }
   
</style>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<form action = "pwsearch" method="post">
		<div style="padding:30px; background:#e8ecf4">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type ="text" name="mb_id"/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type ="text" name="mb_email"/></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type ="text" name="mb_tel"/></td>
				</tr>
				<tr>
					<th colspan="2" style="padding-left: 75px;">
						<input type="submit" value="찾기" style="background-color:#a4c2f4ff"/>
						<input type="button" value="되돌아가기" onclick="location.href='/'" style="background-color:#f9cb9cff;"/>
					</th>
				</tr>
				
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<script>
	
</script>
</html>