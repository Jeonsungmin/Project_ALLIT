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
    
    <div id="main-text">모집공고 글쓰기</div>
    
    <form action="/recruit/Write.do" method="post" enctype="multipart/form-data">
    <table>
    	<tr>
	    	<th>훈련기관명</th>
	    	<td>
	    	<input type="hidden" name="mb_id" value="${writeList.mb_id}"/>
	    	<input type="text" name="edu_name" value="${writeList.edu_name}" readonly/>
	    	</td>
	    	<th>훈련기간</th>
	    	<td><input type="date" max="9999-12-31" name="recruit_period_sta"/> ~ <input type="date" max="9999-12-31" name="recruit_period_end"/></td>
    	<tr>
    	<tr>
	    	<th>과정명</th>
	    	<td><input type="text" name="recruit_title" maxlength="50"/></td>
	    	<th>모집기간</th>
	    	<td><input type="date" max="9999-12-31" name="recruit_start"/> ~ <input type="date" max="9999-12-31" name="recruit_end"/></td>
    	<tr>
    	<tr>
	    	<th>교육기관 위치</th>
	    	<td><input type="text" name="mb_basic_addr" value="${writeList.mb_basic_addr}" readonly/></td><!-- 작성자(ID) 기본주소를 가져와야함(수정불가) -->
	    	<th>연락처</th>
	    	<td><input type="text" name="mb_tel" value="${writeList.mb_tel}" readonly/></td><!-- 작성(ID)의 연락처를 가져와야함(수정불가) -->
    	<tr>
    	<tr>
	    	<th>학원 홈페이지</th>
	    	<td colspan="3"><input type="text" name="recruit_link" placeholder="ex) http://www.naver.com" maxlength="50"/></td>
    	<tr>
    	<tr>
	    	<th>교육분야</th> <!-- recruit 테이블의 recruit_field 에 값을 insert 해줘야함 -->
	    	<td colspan="3">
			      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)" checked/> 프론트엔드</label> 
			      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)"/> 백엔드</label>
			      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)"/> 안드로이드 앱개발(Kotlin)</label>
			      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)"/> IOS 앱개발(Swift)</label>
	    	</td>
    	<tr>
    	<tr>
	    	<th>내용</th>
	    	<td colspan="3"><textarea name="recruit_content" maxlength="500"></textarea></td>
    	<tr>
    	<tr>
	    	<th>사진첨부</th>
	    	<td colspan="3">
	    	<input type="file" name="r_photo" multiple="multiple"/>
	    	</td>
    	<tr>
    </table>
    <input type="submit" value="등록"/>
	<input type="button" value="되돌아가기" onclick="location.href='/recruitList.go?field=all'"/>
    </form>
    
</body>
<script>

</script>
</html>