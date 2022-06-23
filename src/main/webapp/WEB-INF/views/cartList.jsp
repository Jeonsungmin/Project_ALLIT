<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src= "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>

<section id="content">
 
 <ul>
  <c:forEach items="${cartList}" var="cartList">
  <li>
   
   <div class="gdsInfo">
    <p>
     <span>과정명 : </span>${cartList.recruit_title}<br />
     <span>찜한 날짜 : </span>${cartList.cart_date}<br />
    </p>    
   </div>
   
   
  </li>
  </c:forEach>
 </ul>
</section>


</body>
<script></script>
</html>