<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
   
   h1 {
   text-align: center;
   margin-bottom: 55px;
   margin-top: 30px;
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
    <h1>모집공고 수정하기<h1>
    
    <form action="/recruit/update.do" method="post" enctype="multipart/form-data">
    <table>
    	<tr>
	    	<th>훈련기관명</th>
	    	<td>
	    	<input type="hidden" name="recruit_idx" value="${recruit.recruit_idx}"/>
	    	<input type="text" name="edu_name" value="${recruit.edu_name}" readonly/>
	    	</td>
	    	<th>훈련기간</th>
	    	<td>
	    	<input type="date" max="9999-12-31" name="recruit_period_sta" value="${recruit.recruit_period_sta}"/>
	    	 ~ 
	    	<input type="date" max="9999-12-31" name="recruit_period_end" value="${recruit.recruit_period_end}"/>
	    	</td>
    	</tr>
    	<tr>
	    	<th>과정명</th>
	    	<td>
	    		<input type="text" name="recruit_title" value="${recruit.recruit_title}"/>
	    	</td>
	    	<th>모집기간</th>
	    	<td>
	    		<input type="date" max="9999-12-31" name="recruit_start" value="${recruit.recruit_start}"/>
	    	 	~ 
	    		<input type="date" max="9999-12-31" name="recruit_end" value="${recruit.recruit_end}"/>
	    	</td>
    	</tr>
    	<tr>
	    	<th>교육기관 위치</th>
	    	<td><input type="text" name="mb_basic_addr" value="${recruit.mb_basic_addr}" readonly/></td><!-- 작성자(ID) 기본주소를 가져와야함(수정불가) -->
	    	<th>연락처</th>
	    	<td><input type="text" name="mb_tel" value="${recruit.mb_tel}" readonly/></td><!-- 작성(ID)의 연락처를 가져와야함(수정불가) -->
    	</tr>
    	<tr>
	    	<th>학원 홈페이지</th>
	    	<td colspan="3"><input type="text" name="recruit_link" value="${recruit.recruit_link}" placeholder="ex) http://www.naver.com"/></td>
    	</tr>
    	<tr>
	    	<th>교육분야</th>
	    	<!-- 교육분야가 기존의 데이터 값으로 선택 되어있어야 함 -->
	    	<td colspan="3">
	    	  <c:choose>
		    	  <c:when test="${recruit.recruit_field eq '웹개발 (Front-end)'}">
				      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)" checked/> 프론트엔드</label>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)"/> 백엔드</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)"/> 안드로이드 앱개발 (Kotlin)</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)"/> IOS 앱개발 (Swift)</label>
			      </c:when>
				      <c:when test="${recruit.recruit_field eq '웹개발 (Back-end)'}">
				      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)"/> 프론트엔드</label>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)" checked/> 백엔드</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)"/> 안드로이드 앱개발 (Kotlin)</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)"/> IOS 앱개발 (Swift)</label>
			      </c:when>
			      <c:when test="${recruit.recruit_field eq '앱개발 (Kotlin)'}">
				      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)"/> 프론트엔드</label>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)"/> 백엔드</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)" checked/> 안드로이드 앱개발 (Kotlin)</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)"/> IOS 앱개발 (Swift)</label>
			      </c:when>
			      <c:when test="${recruit.recruit_field eq '앱개발 (Swift)'}">
				      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)"/> 프론트엔드</label>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)"/> 백엔드</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)"/> 안드로이드 앱개발 (Kotlin)</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)" checked/> IOS 앱개발 (Swift)</label>
			      </c:when>
			      <c:otherwise>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Front-end)" checked/> 프론트엔드</label>
				      <label><input type="radio" name="recruit_field" value="웹개발 (Back-end)"/> 백엔드</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Kotlin)"/> 안드로이드 앱개발 (Kotlin)</label>
				      <label><input type="radio" name="recruit_field" value="앱개발 (Swift)"/> IOS 앱개발 (Swift)</label>
			      </c:otherwise>
	    	  </c:choose>
	    	</td>
    	</tr>
    	<tr>
	    	<th>내용</th>
	    	<td colspan="3"><textarea name="recruit_content">${recruit.recruit_content}</textarea></td>
    	</tr>
    	<tr>
	    	<th>사진첨부</th>
	    	<td colspan="3">
	    	<input type="file" name="r_photo" multiple="multiple"/>
	   	
	    	</td>
    	</tr>
    </table>
    <input type="submit" value="등록하기"/>
	<input type="button" value="되돌아가기" onclick="location.href='/recruit/detail.do?idx=${recruit.recruit_idx}'"/>
    </form>
</body>
<script>
</script>
</html>