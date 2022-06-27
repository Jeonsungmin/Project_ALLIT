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
   <table class="edu">
      <thead>
         <tr>
            <th>회원ID</th>
            <td>${dto.mb_id}</td>
            <th>이름</th>
            <td>${dto.mb_name}</td>
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
         <tr>
            <th>매니저</th>
            <td>${dto.category_idx}</td>
         </tr>
         <tr>
            <th colspan="2">
               <input type="button" value="돌아가기" onclick="location.href='user/list.ajax'"> 
               <input type="button" value="답변하기" onclick="location.href='detail.go?mb_id=${dto.mb_id}'" />
            </th>
         </tr>
   </table>
</body>

<script>
   /* mb_id
    mb_name
    mb_pass
    mb_postcode
    mb_basic_addr
    mb_detail_addr
    mb_email
    mb_tel
    mb_gender
    mb_birth
    mb_major
    mb_edu
    mb_status
    mb_stopcnt
    mb_withdraw
    category_idx*/

   /* var msg = "${msg}";
    if(msg != "") {
    alert(msg);
    } */
</script>
</html>