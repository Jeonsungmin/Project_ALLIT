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
   td{   
      font-size: 12px
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
   <h3>로그인</h3>
   <form action = "login" method="post">
   <div style="padding:30px; background:#e8ecf4">
      <table>
         <tr>
            <th>아이디</th>
            <td><input type ="text" name="mb_id"/></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type ="password" name="mb_pw"/></td>
         </tr>
         <tr>
            <th colspan="2" style="padding-left: 105px;">
               <input type="button" value="로그인" onclick="location.href='eduList.go'" style="background-color:#a4c2f4ff;"/>
               <!-- spring 에서는 페이지 이동조차 컨트롤러에 요청을 해야 한다. -->
               <input type="button" value="회원가입" onclick="location.href='joinForm.go'" style="background-color:#f9cb9cff;"/>
            </th>
         </tr>
         <tr>
            <th></th>
            <td></td>
         </tr>
      </table>
   </div>
      <table>
         <tr>
            <th style="padding-left:70px; font-size: 12px; font-weight: 500;" onclick="location.href='idFind.go'" >아이디 찾기</th>
            <td style="padding-right:20px; font-weight: 500;" onclick="location.href='pwFind.go'" >비밀번호 찾기</td>
         </tr>
      </table>
   </form>
</body>
<script>
   var msg = "${msg}";
   
   if(msg != ""){
      alert(msg);
   }
</script>
</html>