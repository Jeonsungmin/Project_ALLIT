<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style>
.links { /* 링크들을 상단 우측에 위치시킵니다. */
   position: absolute;
   top: 0;
   right: 0;
}
.link_text {
   font-size: 12px;
   margin-left: 5px;
   margin-right: 200px;
}
</style>
</head>
<body>
<div class="links">
   <a href="/userList.go">${sessionScope.loginId}님 환영합니다.  /  </a><a href="/logout" class="link_text">로그아웃</a>
</div>
</body>
<script>

</script>