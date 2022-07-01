<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
table {
	width: 600px;
	margin-left: 50%;
	margin-right: 50%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
	margin: auto;
	text-align: center;
}

h4 {
	margin-left: 40%;
}

h1 {
	margin: 200px 40% 10px 40%;
}
</style>
</head>
<body>
	<%-- <jsp:include page="./commons/loginBox.jsp"/> --%>
	<h3>일반 회원 상세보기</h3>
	<form action="manager.do" method="post">
	<table class="user">
		<thead>
			<tr>
				<th>회원ID</th>
				<td>${dto.mb_id}<input type="hidden" name="mb_id" value="${dto.mb_id}"/></td>
				<th>이름</th>
				<td>${dto.mb_name}<input type="hidden" name="stop_manager" value="${sessionScope.loginId}"/></td>
			</tr>
			<tr>
				<th>주소(우편번호)</th>
				<td>${dto.mb_basic_addr}(${dto.mb_postcode})</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.mb_gender}</td>
				<th>전화번호</th>
				<td>${dto.mb_tel}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.mb_birth}</td>
			</tr>
			<tr>
				<th>전공유무</th>
				<td>${dto.mb_major}</td>
				<th>최종학력</th>
				<td>${dto.mb_edu}</td>
			</tr>
	</table>
		<table id="smchkcate">
			<tr>
				<th>매니저</th>
				<td><input type="radio" name="num" value=1>권한
					위임 <input type="radio" name="num" value=0
					checked="checked">권한 해제</td>
				<td><input type="submit" value="선택"/></td>
			</tr>
		</table> 
		</form>
		<form action="userStop.do" method="post">
		<table>
			<tr>
				<th>정지상태</th>
				<td>
					<input type="hidden" name="mb_id" value="${dto.mb_id}"/>
					<input type="hidden" name="stop_manager" value="${sessionScope.loginId}"/>
					<input type="radio" name="mb_status" value="1"/>정지
					<input type="radio" name="mb_status" checked="checked" value="0"/>정지해제
				</td>
				<th>정지횟수</th>
				<td>${dto.mb_stopcnt}<input type="hidden" name="mb_stopcnt" value="${dto.mb_stopcnt}"/></td>
			</tr>
			<tr>
				<th>정지기간</th>
				<td><input type="date" name="stop_start"> ~ <input
					type="date" name="stop_end"></td>
			</tr>
			<tr>
				<th>정지사유</th>
				<td><input type="radio" name="stop_reason" value="욕설">욕설
					<input type="radio" name="stop_reason" value="개인정보 유출 위험">개인정보
					유출 위험 <input type="radio" name="stop_reason" value="음란/유해">음란/유해<br>
					<input type="radio" name="stop_reason" value="허위광고">허위광고 <input
					type="radio" name="stop_reason" value="도배">도배</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="돌아가기" onclick="location.href='/userList.go'">
					 <input type="submit" value="저장하기"/>
				</th>
			</tr>
		</table>
		</form>
</body>

<script>
/*function func(){
	var authorize = $("input[name='authorize']").val();
	var mb_status = $("input[name='mb_status']").val();
	var stop_start = $("input[name='stop_start']").val();
	var stop_end = $("input[name='stop_end']").val();
	var stop_reason = $("input[name='stop_reason']").val();
	console.log(authorize,mb_status,stop_start,stop_end,stop_reason);
	$.ajax({
		type:"POST",
		url:"/userStop.ajax",
		data:{
			authorize:authorize,
			mb_status:mb_status,
			stop_start:stop_start,
			stop_end:stop_end,
			stop_reason:stop_reason
		},
		dataType:"JSON",
		success:function(data){
	         console.log(data);
	         if(data==1){
	        	 alert("회원 정지에 성공하였습니다.");
	         }else{
	        	 alert("회원 정지에 실패하였습니다.");
	         }
	      },
	      error:function(e){
	         console.log(e);
	      }
	});
}*/
function fix(){
	var count = $("input[name='authorize']").val();
	$.ajax({
		type:"post",
		url:"manager.ajax",
		data:{
			cnt:count
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

</script>
</html>