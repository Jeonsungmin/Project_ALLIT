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
   <h3>교육기관 회원 상세보기</h3>
   <table class="edu">
      <thead>
         <tr>
            <th>교육기관 ID</th>
            <td>${dto.mb_id}</td>
            <th>대표자성명</th>
            <td>${dto.rep_name}</td>
         </tr>
         <tr>
            <th>주소(우편번호)</th>
            <td>${dto.mb_basic_addr}(${dto.mb_postcode})</td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td>${dto.mb_tel}</td>
            <th>교육기관명</th>
            <td>${dto.edu_name}</td>
         </tr>
         
         <tr>
            <th colspan="2">
               <input type="button" value="돌아가기" onclick="location.href='edu/detail.go'"> 
               <input type="button" value="답변하기" onclick="location.href='answer.go?edu_idx=${dto.edu_idx}'" />
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