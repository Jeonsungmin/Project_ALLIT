<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style></style>
</head>
<body>
	<h3>수정하기</h3>
	<form action="userupdate.do" method="post">
		<table>
			<tr>
				<th>회원ID</th>
				<td>${dto.mb_id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.mb_name}</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td style="width: 400px;">
				<input type="hidden" name="mb_id" value="${dto.mb_id}"/>
				<input type="text" name="mb_pass"
					value="${dto.mb_pass}" /></td>
				<th>기본주소</th>
				<td style="width: 400px;"><input type="text"
					name="mb_basic_addr" value="${dto.mb_basic_addr}" /></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td style="width: 400px;"><input type="text" name="mb_detail_addr"
					value="${dto.mb_detail_addr}" /></td>
				<th>우편번호</th>
				<td style="width: 400px;"><input type="text" name="mb_postcode"
					value="${dto.mb_postcode}" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="mb_gender" value="남자" checked ="checked">남성
						<input type="radio" name="mb_gender" value="여자">여성</td>
				<th>전공유무</th>
				<td><input type="radio" name="mb_major" value="전공" checked ="checked">전공
						<input type="radio" name="mb_major" value="비전공">비전공</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="mb_birth" value="${dto.mb_birth}" /></td>
			</tr>
			<tr>
				<th>최종학력</th>
				<td><select name="mb_edu" id="changeTest"
						onchange="selectBoxChange(this.value);">
							<option value="고등학교 졸업">고등학교 졸업</option>
							<option value="전문대 졸업">전문대 졸업</option>
							<option value="대학교 졸업" selected="selected">대학교 졸업</option>
							<option value="대학원 졸업">대학원 졸업</option>
					</select></td>
				<th>이메일</th>
				<td><input type="text" name="mb_email" value="${dto.mb_email}" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mb_tel" value="${dto.mb_tel}" /></td>
				<td colspan="2"><input type="submit" value="수정하기">
				 <input type="button" value="돌아가기" onclick="location.href='/userInfo.go?mb_id='${mb_id}">
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
var msg = "${msg}";
if(msg != "") {
	alert(msg);
}
</script>
</html>