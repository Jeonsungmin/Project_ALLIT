<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ALLIT</title>
<style>
* {
   margin: 0;
   padding: 0;
}

body {
   font-family: sans-serif;
}

li {
   list-style: none;
}

a {
   text-decoration: none;
}

img {
   border: 0;
}

* {
   box-sizing: border-box;
   /* 길이 계산을 편하게 하기위함. box-sizing에 관한 설명은 아래 링크를 참고해주세요 */
}

body {
   margin: 0;
   font-family: sans-serif;
}

a {
   text-decoration: none; /* 기본 밑줄 제거 */
   color: #888;
}

a:hover {
   text-decoration: underline; /* 마우스 커서가 올라갔을 때 밑줄 생성*/
}

header {
   margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
   width: 1080px;
   height: 180px;
   display: flex;
   align-items: center; /* 하위 요소들 수직 가운데정렬 */
   position: relative;
}

.visually-hidden { /* legend 안보이게 설정. 이렇게하면 접근성을 준수하면서 디자인을 해치지 않습니다. */
   position: absolute !important;
   height: 1px;
   width: 1px;
   overflow: hidden;
   clip: rect(1px, 1px, 1px, 1px);
   clip: rect(1px, 1px, 1px, 1px);
   white-space: nowrap;
}

.links { /* 링크들을 상단 우측에 위치시킵니다. */
   margin-right: 10px;
   position: absolute;
   top: 0;
   right: 0;
}

.link_text {
   font-size: 12px;
   margin-left: 5px;
}

.logo {
   margin-left: 50px;
   margin-bottom: 60px;
   width: 148.34px;
   height: 130px;
}

/* nav */
header>nav {
   width: 100%;
   height: 60px;
   position: absolute;
   bottom: 0;
}

.nav {
   width: 100%;
   height: 100%;
   display: flex;
   justify-content: space-between;
   align-items: center;
   font-size: 20px;
   font-weight: bold;
   border-top: 1px solid #f1f3f6;
   background-color: #0070c0ff;
}

.nav ul>li {
   display: inline-block;
   margin-left: 130px;
   margin-right: 30px;
}

.nav ul>li:nth-child(n)>a:hover {
   color: black;
}

.nav ul>li:nth-child(n)>a {
   color: #ffffff;
}

.nav ul>li>a {
   text-decoration: none;
   cursor: pointer;
}

/* #side{float: left; width: 200px; height: 700px; background-color: #b6d7f1; margin-left: 88px;}   
  #contents {float: left; width: 880px; line-height: 700px; height: 700px; background-color: #e4edf3;}  마이페이지의 경우*/
#contents {
   margin: auto;
   width: 1080px;
   height: 700px;
   background-color: #eff4f8;
}

#test {
   width: 250px;
   height: 50px;
   align-items: center;
}

main {
   background: #ffffff;
   min-height: 700px;
}

.test_box {
   margin: 400px;
   margin-top: 200px;
   border: 2px solid #4F82DB;
   border-radius: 30px;
   background-color: #4F82DB;
   color: #ffffff;
   width: 300px;
   height: 150px;
   font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
      sans-serif;
   font-size: 25px;
   font-weight: bold;
}

.test_box:hover {
   background-color: #1273cd;
   color: #ffffff;
   border: 2px solid #1281ea;
}

ul {
   margin: 0;
   padding: 0;
}

footer {
   width: 1080px;
   height: 40px;
   margin: auto;
   padding: 0 8px 0 8px; /* 각각 위 오른쪽 아래 왼쪽 */
   display: flex;
   flex-direction: column; /* 요소들을 수평정렬 */
   font-size: 12px;
   background: #f4f4f4;
}

.bottom_box {
   flex: 3;
   padding-top: 10px;
   font-size: 12px;
}

.bottom_box ul>li {
   display: inline-block; /* 수평정렬 */
   margin-left: 75px;
}

.bottom_box ul>li:last-child { /* 마지막 li요소 (Naver Corp.) 굵게 */
   font-weight: bold;
}
</style>

</head>

<body>
   <form action="main" method="post">
      <header>
         <div class="links">
            <a href="login.go" class="link_text">로그인</a> 
            <a href="joinForm.go" class="link_text">회원가입</a>
         </div>
         <a href="/"><img class="logo" src="resources/images/logo1.png"/></a>
         <nav>
            <div class="nav">
               <ul>
                  <li><a href="/">모집공고</a></li>
                  <li><a href="/boardlist.go">게시판</a></li>
                  <li><a href="/qna.go">Q&A</a></li>
                  <li><a href="/">마이페이지</a></li>
               </ul>
            </div>
         </nav>
      </header>

      <main>
         <div id="contents">
            <button class="test_box" type="button" name="test">
               나와 맞는 교육 과정 <br/>빠르게 찾기
            </button>
         </div>
      </main>
      <footer>
         <div class="bottom_box">
            <ul>
               <li><a href="/">회사소개</a></li>
               <li><a href="/">인재채용</a></li>
               <li><a href="/">이용약관</a></li>
               <li><a href="/">개인정보처리방침</a></li>
               <li><a href="/">청소년보호정책</a></li>
               <li><a href="/">ALLIT 정책</a></li>
               <li><a href="/">고객센터</a></li>
            </ul>
         </div>
      </footer>
   </form>
</body>
</html>