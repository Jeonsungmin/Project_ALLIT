<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
table{
	width: 800px;
	margin: auto;
	border: 1px solid black;
	border-collapse: collapse;
}
th{
	background: #DEECFC;
}

td{
	font-size: 15px;
}

h3{
	text-align: center;
	padding: 20px 20px;
	font-size: 25px;
}

input[type="button"]{
	width:20%;
}

</style>
 <jsp:include page="./commons/loginBox.jsp"/>
   <jsp:include page="./commons/smnav.jsp"/>
</head>
<body>
	<h3>상담 신청 상세보기</h3>
		<table>
			<tr>
				<th rowspan="2" width="80"><input type="hidden" id="recruit_idx" value="${dto.recruit_idx}"/>과정명</th>
		      	<td rowspan="2"  width="530">${dto.recruit_title}</td>
			</tr>
		</table>
		<table>
			<tr>
				<th rowspan="3" width="80"><input type="hidden" id="mb_id" value="${dto.mb_id}"/>회원정보</th>
				<th width="75">이름</th>
				<td width="190">${dto.mb_name}</td>
				<th width="75">생년월일</th>
				<td width="190">${dto.mb_birth}</td>
			</tr>
			<tr>
				<th width="75">이메일</th>
				<td width="190">${dto.mb_email}</td>
				<th width="75">연락처</th>
				<td width="190">${dto.mb_tel}</td>
			</tr>
			<tr>
				<th width="75">전공유무</th>
				<td width="190">${dto.mb_major}</td>
				<th width="75">최종학력</th>
				<td width="190">${dto.mb_edu}</td>
			</tr>
		</table>
		<table>
			<tr>
				<th width="80">내용</th>
		      	<td rowspan="4" width="530" height="180" style =vertical-align:top>${dto.cons_content}</td>
			</tr>
		</table>
	<table>
			<tr>
		      	<th colspan="2" width="624"><input type="button" value="돌아가기" onclick="location.href='/cstList.go'"/></th>
			</tr>
		</table>
		
</body>
<script>

</script>
</html>