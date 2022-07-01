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
	<h3>아이디 찾기</h3>
	<form action = "idsearch" method="post">
	<div style="padding:30px; background:#e8ecf4">
		<table>
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
					<!-- spring 에서는 페이지 이동조차 컨트롤러에 요청을 해야 한다. -->
					<input type="button" value="되돌아가기" onclick="location.href='/'" style="background-color:#f9cb9cff;"/>
				</th>
			</tr>
		</table>
	</div>
	</form>
</body>
<script>
	
</script>
</html>