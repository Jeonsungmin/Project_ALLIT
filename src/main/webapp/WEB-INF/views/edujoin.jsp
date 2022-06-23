<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
   
   td,th{
      font-size: 15 px;
   }
   td,th{
      padding: 5px 10px;
   }
   table{
      width: 350px;
      margin:0 auto;
   }
   
</style>
</head>
<body>
   <h3>교육기관 회원가입</h3>
   <form action="edujoin" method="post" >
   <div style="padding:30px; background:#e8ecf4">
      <table>
         <tr>
            <th>
               <input type="radio" name="member" value="일반">일반회원
            </th>
            <td style="font-weight:bold;">  
               <input type="radio" name="member" value="교육기관">교육기관회원
            </td>
         </tr>
         <tr>
            <th>아이디</th>
            <td><input type ="text" name="mb_id"/></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type ="text" name="mb_pw"/></td>
         </tr>
         <tr>
            <th>비밀번호 확인</th>
            <td><input type ="text" name="mb_pw"/></td>   
         </tr>
         <tr>
            <th>대표자 성명</th>
            <td><input type ="text" name="rep_name"/></td>
         </tr>
         <tr>
            <th>교육기관명</th>
            <td><input type ="text" name="edu_name"></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type ="text" name="mb_email"/></td>
         </tr>   
         <tr>
            <th>연락처</th>
            <td><input type ="text" name="mb_tel"/></td>
         </tr>
         <tr>
            <th>우편번호</th>
            <td><input type ="text" name="mb_postcode"/></td>
         </tr>
         <tr>
            <th>기본주소</th>
            <td><input type ="text" name="mb_basic_addr"/></td>
         </tr>
         <tr>
            <th>상세주소</th>
            <td><input type ="text" name="mb_detail_addr"/></td>
         </tr>
         <tr>
            <th>사업자등록증</th>
            <td><input type ="file" multiple="multiple" name="photo_copy"/></td>
         </tr>
         
         <tr>
            <th colspan="2" style="text-align:right; padding-right: 30px;">
               <input type="submit" value="회원가입" style="background-color:#9fc5e8;"/>
            </th>
         </tr>
      </table>
   </div>
   </form>
</body>
<script>
var msg = "${msg}";

if(msg != ""){
   alert(msg);
}

var selectBoxChange = function(value){
	console.log("값변경테스트 : "+ value);
	$("#changeInput").val(value);
}

</script>
</html>