<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 Q&A 페이지</title>
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="resources/js/jquery.twbsPagination.js"></script>
<!-- 페이징 처리 -->
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

#leftnav>ul {
   background-color: #a4bdefff;
   width: 150px;
   list-style-type: none;
   margin: 0;
   padding: 0;
}

#leftnav>ul>li:first-child {
   background-color: #efd2a4ff;
}

#leftnav>ul>li {
   height: 80px;
   text-align: center;
   padding-top: 30px;
}

#leftnav>ul>li a {
   display: block;
   color: #000000;
   padding: 8px;
   text-decoration: none;
   font-weight: bold;
}

#leftnav>ul>li a:hover {
   background-color: #CD853F;
   color: white;
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

.links {
   margin-right: 30px;
}

table {
   width: 1080px;
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

th {
   background-color: #e8ecf4ff;
}
</style>
<jsp:include page="./commons/loginBox.jsp" />
</head>
<body>
   <header>
      <a href="/"><img class="logo" src="resources/images/logo1.png" /></a>
      <nav>
         <div class="nav">
            <ul>
               <li><a href="/">모집공고</a></li>
               <li><a href="/boardlist.go?board_category=공지사항">게시판</a></li>
               <li><a href="/qna.go">Q&A</a></li>
               <%-- <li><a href="/userInfo.go?mb_id=${id}">마이페이지</a></li> --%>
               <li><a href="/vslogin.go">마이페이지</a></li>
            </ul>
         </div>
      </nav>
   </header>
   <form action="userInfo" method="post">
      <div id="leftnav">
         <ul id="leftli">
            <li><a href="/">마이페이지</a></li>
            <li><a onclick="msg()">상담신청 내역</a></li>
            <li><a href="/">찜한 공고</a></li>
            <li><a href="/">쪽지함</a></li>
            <li><a href="/">작성한 게시글</a></li>
            <li><a href="/">작성한 Q&A</a></li>
            <li><a href="/userInfo.go?mb_id=${mb_id}">개인정보 조회</a></li>
         </ul>
      </div>
 	     
      <select id="pagePerNum"
         style="margin-left: 200px; margin-top: -500px;">
         <option value="5">5개씩</option>
         <option value="10">10개씩</option>
         <option value="15">15개씩</option>
         <option value="20">20개씩</option>
      </select>
      <table class="info" style="margin-left: 225px; margin-top: -450px;">
         <thead>
            <tr>
               <!-- <th><input type="checkbox" id="all"/></th> -->
               <th>번호</th>
               <th>게시글제목</th>
               <th>조회수</th>
               <th>작성일</th>
            </tr>
            
         </thead>
         <tbody id="list">
      
         </tbody>
         
         <tr>
            <td colspan="4" id="paging">
         	<!-- <button onclick="boardHisdel()">삭제</button> -->
               <div class="container">
                  <nav arial-label="Page navigation" style="text-align: center">
                     <ul class="pagination" id="pagination"></ul>
                  </nav>
               </div>
            </td>
         </tr>
      </table>
      
   </form>
</body>
<script>
var msg = "${msg}";

if(msg != ""){
   alert(msg);
}

var currPage = 1;

listCall(currPage);
//페이징 처리
$('#pagePerNum').on('change', function() {
   console.log("currPage: " + currPage);
   //페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
   //페이지당 보여줄 수 변경시 기존 페이지 요소를 없애고 다시 만들어 준다.
   $("#pagination").twbsPagination('destroy');
   listCall(currPage);

});

//리스트 call 과정
function listCall(page) {

   var pagePerNum = $('#pagePerNum').val();
   console.log("param page : " + page);
   
   $.ajax({
      type : 'GET',
      url : '/boardHistory.ajax',
      data : {
         cnt : pagePerNum,
         page : page, 
      },
      dataType : 'JSON',
      success : function(data) {
         console.log(data);
         drawList(data.list,data.currPage);
         currPage = data.currPage;
         $("#pagination").twbsPagination({
            startPage : data.currPage,
            totalPages : data.pages,
            visiblePages : 5,
            onPageClick : function(e, page) {   
               console.log(page);
               currPage = page;
               listCall(page);
            }
         });

      },
      error : function(e) {
         console.log(e);//
      }
   });
}
function drawList(list,start) {
   var content = '';
   

   //console.log(start);
   var num = ((start-1) * 5)+1;
   console.log(num);
   list.forEach(function(item) {
	   var date = new Date(item.board_date);
	  
      console.log(item);
      content += '<tr>';
      content += '<td>'+(num++)+'</td>';
      content += '<td><a href="boarddetail.go?board_idx='+item.board_idx+'">'+item.board_title+'</a></td>';
      content += '<td>'+item.board_hits+'</td>';
      
      content += '<td>'+date.toLocaleDateString("ko-KR").replace(/\.$/, '')+'</td>';
      content += '</tr>';
   });
   $('#list').empty();
   $('#list').append(content);
}

/* $('#all').click(function(){
	
	var $chk = $('input[type="checkbox"]');	//체크박스를 모두 가져옴
	
	if($(this).is(":checked")){
		$chk.prop("checked",true);	
	}else{
		$chk.prop("checked",false);
	}
	
});



function boardHisdel(){
	var idx = "${sessionScope.loginId}";
	var chkarr=[];
	//check 된 체크박스의 값을 가져온다.
	$('#list input[type="checkbox"]:checked').each(function(idx,item){
		chkarr.push($(this).val());
	});
	
	console.log(chkarr);
	
	//체크된 박스들 아작스로 컨트롤에 보내기
	$.ajax({
		type:'get',
		url:'/boardHisdel.ajax',
		data:{boarddelList:chkarr,
				idx : idx,	
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.login){
				location.href='/boardHistory.go';
				listCall(currPage);
				alert(data.msg);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
} */

</script>
</html>