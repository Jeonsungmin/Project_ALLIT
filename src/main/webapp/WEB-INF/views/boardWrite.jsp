<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  
   * {
   margin: 0;
   padding: 0;
   }
   
   .menu-bar {
   display: flex;
   justify-content: space-around;
   align-items: center;
   height: 80px;
   margin-top: 100px;
   background-color: #6ea3e8;
   }
   
   .menu-bar a {
   font-size: 24px;
   text-decoration: none;
   color: #fff;
   }
   
   #main-text {
   font-size: 24px;
   color: #303030;
   font-weight: bold;
   margin: 0 auto;
   }
   
   table,th,td{
   border: 1px solid black;
   border-collapse: collapse;
   padding: 5px;
   }
   
   table {
   width: 100%;
   }
   
   input[readonly] {border:1px solid black; background-color:#dfdfdf;}

</style>

<jsp:include page="./commons/loginBox.jsp"/>
<jsp:include page="./commons/smnav.jsp"/>
</head>
<body>
    <div id="main-text"> 글쓰기</div>
    
    <form action="board_write.do" method="post">
    
    <table>
    	<tr>
	    	<th>작성자 ID</th>
	    	<td><input type="text" name="mb_id" value="${sessionScope.loginId}" readonly /></td>
	    	<th>작성일</th>
	    	<td><input type='date' id='currnetMonth' name="board_date" readonly></td>
	    </tr>
    	<tr>
	    	<th>게시글 종류</th>
		    	<td colspan="3">
			      <label id="notice_hide"><input type="radio" name="board_category" value="공지사항">공지사항</label> 
			      <label><input type="radio" name="board_category" value="질문" checked>질문하기</label>
			      <label><input type="radio" name="board_category" value="tip">TIP</label>
			      <label><input type="radio" name="board_category" value="잡담">잡담</label>
	    		</td>
 		</tr>
    	<tr>
	    	<th>제목</th>
	    	<td><textarea name="board_title" maxlength="30" required ></textarea></td>
    	</tr>
    	
    	<tr colspan="2">
	    	<th>내용</th>
	    	
	    	<td colspan="3"><textarea name="board_content" maxlength="500" required></textarea></td>
    	</tr>
	</table>
	<input type="submit" />
	<input type="button" value="되돌아가기" onclick="location.href='/boardlist.go?board_category=${board_category}'"/>
	</form>

    
</body>
<script>

noticehide();

function noticehide(){
	
	var boardcateName = "${board_cateId}";

	if(boardcateName == "일반회원") {
		$("#notice_hide").hide();
	}
}
	
document.getElementById('currnetMonth').value= new Date().toISOString().slice(0, 10);






</script>
</html>