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
	<jsp:include page="./commons/loginBox.jsp"/>
	<jsp:include page="./commons/smnav.jsp"/>
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
					<input type="button" value ="돌아가기" onclick="location.href='boardlist.go?board_category=${dto.board_category}'"/>
					<input type="button" value ="신고하기" onclick="location.href=''"/>
					
				</th>
			</tr>
		</table>
		
		댓글목록 : ${cmtsize}
		<table>
		<c:forEach items="${cmtlist}" var="cmt">
			<tr>
				<td>
					${cmt.mb_id}
				</td>
				<td>
					${cmt.cmt_content}
				</td>
				<td>
					${cmt.cmt_date}
				</td>
				<td><a href="cmt_del.do?board_idx=${dto.board_idx}&cmt_idx=${cmt.cmt_idx}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
			</tr>
		</c:forEach>
		</table>
		
		<form action="cmt_write.do" method="post">
			<input type="hidden" name="board_idx" value="${dto.board_idx}"/>
			<table>
				<tr>
					<td><input type="text" name="cmt_content"/></td>
					<td><button type="submit">댓글입력</button></td>
				</tr>
			</table>
		</form>
</body>
<script>
/* 
$('.cmt_del > a').on('click', function (e) {
	console.log("클릭잘됨 ");
	if (!confirm("정말 삭제하시겠습니까?")) {
    	e.preventDefault();   
    }
	
})
 */


var msg = "${msg}";
if(msg != "") {
	alert(msg);
}  
</script>
</html>