<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>"https://code.jquery.com/jquery-3.6.0.min.js"


</script>
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
	    	<td><textarea name="mb_id" readonly>${sessionScope.loginId}</textarea></td>
	    	<th>작성일</th>
	    	<td><input type='date' id='currnetMonth' name="board_date" readonly></td>
	    </tr>
    	<tr>
	    	<th>게시글 종류</th>
		    	<td colspan="3">
			      <label><input type="radio" name="board_category" value="공지사항" checked>공지사항</label> 
			      <label><input type="radio" name="board_category" value="질문하기">질문하기</label>
			      <label><input type="radio" name="board_category" value="TIP">TIP</label>
			      <label><input type="radio" name="board_category" value="잡담">잡담</label>
	    		</td>
 		</tr>
    	<tr>
	    	<th>제목</th>
	    	<td><textarea name="board_title"></textarea></td>
    	</tr>
    	
    	<tr colspan="2">
	    	<th>내용</th>
	    	<td colspan="3"><textarea name="board_content"></textarea></td>
    	</tr>
	</table>
	<input type="submit" value="등록"/>
	<input type="button" value="되돌아가기" onclick="location.href='/'"/>
	</form>

    
</body>
<script>
document.getElementById('currnetMonth').value= new Date().toISOString().slice(0, 10);
</script>
</html>