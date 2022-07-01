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

</style>
</head>
<body>
	<jsp:include page="./commons/loginBox.jsp" />
	<jsp:include page="./commons/smnav.jsp" />
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
			<th colspan="2"><input type="button" value="수정하기"
				onclick="location.href='boardUpdate.go?board_idx=${dto.board_idx}'" />
				<input type="button" value="돌아가기"
				onclick="location.href='boardlist.go?board_category=${dto.board_category}'" />
				<input type="button" value="신고하기" onclick="location.href=''" /></th>
		</tr>
	</table>

	댓글목록 : ${cmtsize}
	<table>
		<c:forEach items="${cmtlist}" var="cmt">
			<tr>
				<td>${cmt.mb_id}</td>
				<td>${cmt.cmt_content}</td>
				<td>${cmt.cmt_date}</td>
				<td id="cmtName"><a
					href="cmt_del.do?board_idx=${dto.board_idx}&cmt_idx=${cmt.cmt_idx}"
					onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
			</tr>
		</c:forEach>
	</table>

	<form action="cmt_write.do" method="post">
		<input type="hidden" name="board_idx" value="${dto.board_idx}" />
		<table>
			<tr>
				<td><input type="text" name="cmt_content" /></td>
				<td><button type="submit">댓글입력</button></td>
			</tr>
		</table>
	</form>
	<!-- 김동훈 -->
	<form action="blind.do" method="post">
			<div id="blind"> 
				<c:if test = "${cateId ne '일반회원'}">
				<input class="blind_button" type="radio" name="blind" value="do" <c:if test="${dto.board_blind eq 'true'}">checked</c:if>/>숨김 처리
				<input class="blind_button" type="radio" name="blind" value="cancel" <c:if test="${dto.board_blind eq 'false'}">checked</c:if>/>숨김 해제
				<input type="hidden" name="board_idx" value="${dto.board_idx}"/>
				<input type="hidden" name="report_idx" value="${dto.report_idx}"/>
					
				<select name="report_state" id="changeTest" name="changeTest" onchange="">
						<option value="미처리" <c:if test="${dto.report_state.equals('미처리')}">selected</c:if>>미처리</option>
						<option value="처리중" <c:if test="${dto.report_state.equals('처리중')}">selected</c:if>>처리중</option>
						<option value="처리완료" <c:if test="${dto.report_state.equals('처리완료')}">selected</c:if>>처리완료</option>
				</select>
					<input type="submit" id="report_save" value="저장"/>
				</c:if>
			</div>
			</form>
			<!-- ㅇㄱㄲㅉ -->
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
 /*
 $('input[name="blind"]').on('click', function(){
     location.href = "blind.do?board_idx=${dto.board_idx}&blind=" + $(this).val();
  });
 */

$("#report_save").on('click', function(){ /* 김동훈 */
	location.href = "blind.do?board_idx=${dto.board_idx}&blind=" + $(".blind_button").val();
});

/*let changeTest = '${changeTest}';
//value값으로 설정
$("#changeTest").val(changeTest).prop("selected", true);
  */
 
 
 
 
 var catecmtName = "${cmt.mb_id}";
 
 if(catecmtName != "${sessionScope.loginId}") { 
   $("#cmtName").attr('hidden',true);    
 }

var msg = "${msg}";
if(msg != "") {
	alert(msg);
}  



/* var cateName = "${cateId}";

if(cateName != "매니저 회원" || cateName != "관리자") {
	$(".blind_button").empty();
} */

</script>
</html>