<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      width: 450px;
      margin:0 auto;
   }
   
</style>
</head>
<body>
   <h3>일반 회원가입</h3>
   <form action="join" method="post" >
      <div style="padding:50px; background:#e8ecf4">
         <table>
            <tr>
               <th>
                  <input type="radio" name="member" value="일반" checked="checked">일반회원
               </th>
               <td style="font-weight:bold;">  
                  <input type="radio" name="member" value="교육기관" onclick="window.location.href='action.do';">교육기관회원
               </td>
            </tr>
            <tr>
               <th>아이디</th>
               <td><input type ="text" name="mb_id"/></td>
               <td><button type="button" onclick="location.href='joinequl'">중복체크</button></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type ="text" name="mb_pass"/></td>
            </tr>
            <tr>
               <th>비밀번호 확인</th>
               <td><input type ="text" name="pw"/></td>
               <td><button type="button" onclick="alert('일치합니다.')">일치 확인</button></td>
            </tr>
            <tr>
               <th>이름</th>
               <td><input type ="text" name="mb_name"/></td>
            </tr>
            <tr>
               <th>생년월일</th>
               <td><input type ="date" name="mb_birth"></td>
            </tr>
            <tr>
               <th>이메일</th>
               <td><input type ="text" name="mb_email"/></td>
            </tr>
            <tr>
               <th>성별</th>
               <td>
                  <input type="radio" name="mb_gender" value="남자">남성        
                  <input type="radio" name="mb_gender" value="여자">여성
               </td>
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
               <th>최종학력</th>
               <td><input type ="text" name="mb_edu" id="changeInput"/></td>
               <td>
               		<select name="mb_edu" id="changeTest" onchange="selectBoxChange(this.value);">
					  <option value="고등학교 졸업">고등학교 졸업</option>
					  <option value="전문대 졸업">전문대 졸업</option>
					  <option value="대학교 졸업" selected="selected">대학교 졸업</option>
					  <option value="대학원 졸업" >대학원 졸업</option>
					</select>
               </td>
            </tr>
            <tr>
               <th>전공유무</th>
               <td>
                  <input type="radio" name="mb_major" value="전공">전공        
                  <input type="radio" name="mb_major" value="비전공">비전공
               </td>
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