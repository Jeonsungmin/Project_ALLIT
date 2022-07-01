<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<input type="hidden" id="loginid" value="${sessionScope.loginId}"/>
	<select id="pagePerNum">
		<option value="5">5개씩</option>
		<option value="10">10개씩</option>
		<option value="15">15개씩</option>
		<option value="20">20개씩</option>
	</select>
	<select id="msg_open">
		<option value="1" >읽음</option>
		<option value="0" selected="selected">안읽음</option>
	</select>
	<tr>
		<th colspan="2"><input type="button" value="쪽지 수신함"> <input
			type="button" value="쪽지 발신함" onclick="location.href='sendHistory.go?'" /><!--${sessionScope.loginId}-->
		</th>
	</tr>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="all"></input></th>
				<th>번호</th>
				<th>발신자ID</th>
				<th>내용</th>
				<th>수신일</th>
				<th>알람여부</th>
			</tr>
		</thead>
		<tbody id="msgreceivelist">

		</tbody>
		<tr>
			<td colspan="4" id="paging">
				<!-- plugin 사용법(twbspagination) , 이렇게 쓰라고 명시되어있음. -->
				<div class="container">
					<nav arial-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>
	<button onclick="del()">삭제</button>
</body>
<script>

var currPage = 1;

listCall(currPage);
//페이징 처리
$('#pagePerNum').on('change',function(){
	console.log("currPage: " + currPage);
  //페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
  //페이지당 보여줄 수 변경시 기존 페이지 요소를 없애고 다시 만들어 준다.
  $("#pagination").twbsPagination('destroy');   
  listCall(currPage);    
});

$('#msg_open').on('change', function(){
	 var openok = $('#msg_open').val();
	 	console.log(openok);
	 	$.ajax({
	 		type:'get',
	 		url:'opentest.ajax',
	 		data : {openok : openok},
	 		dataType:'JSON',
	 		success:function(data){
	 			console.log("성공");
	 			listCall(currPage);
	 		},
	 		error:function(e){
	 			consloe.log(e);
	 		}
	 	});
	});

function listCall(page){
	var id = $('#loginid').val();
	var openok = $('#msg_open').val();
   var pagePerNum = $('#pagePerNum').val();
   console.log("param page : " +page);
   $.ajax({
      type:'GET',
      url:'msgreceivelist.ajax',
      data:{
         cnt : pagePerNum,
         page : page,
         opentest : openok,
         id : id
         },
      dataType:'JSON',
      success:function(data){
         console.log(data);
         console.log(data.msgcnt);
         drawList(data.msgreceivelist);
         currPage = data.currPage;
         //불러오기가 성공되면 플러그인을 이용해 페이징 처리
         $("#pagination").twbsPagination({
           startPage: data.currPage,//시작 페이지
           totalPages: data.pages,//총 페이지(전체 게시물 수 / 한 페이지에 보여줄 게시물 수)
            visiblePages: 5,//한번에 보여줄 페이지 수[1][2][3][4][5]
            onPageClick:function(e,page){
               //console.log(e);//클릭한 페이지와 관련된 이벤츠 객체
               console.log(page);//사용자가 클릭한 페이지
               currPage = page;
               listCall(page);
            }
         });
         
      },
      error:function(e){
         console.log(e);//
      }
   });
}

function drawList(msgreceivelist){
    var content = '';
    msgreceivelist.forEach(function(item){
    	var date = new Date(item.msg_receive_date);
       console.log(item);
       content += '<tr>';
       content += '<td><input type="checkbox" value="'+item.msg_idx+'" /></td>';
       content += '<td>'+item.msg_idx+'</td>';
       content += '<td>'+item.sender_id+'</td>';
       content += '<td><a href="msgdetail.go?msg_idx='+item.msg_idx+'">'+item.msg_content+'</a></td>';
       content += '<td>'+date.toLocaleDateString("ko-KR")+'</td>';
       if(item.msg_open == false ){
    	   content += '<td>'+"안읽음"+'</td>';	   
       }else {content += '<td>'+"읽음"+'</td>';	
       }
       content += '</tr>';
    	});
    $('#msgreceivelist').empty();
    $('#msgreceivelist').append(content);

}   	
    	
 $('#all').click(function(){
	 
	 var $chk = $('input[type="checkbox"]');
	 
	 if($(this).is(":checked")){
		 $chk.prop("checked",true);
	 }else{
		 $chk.prop("checked",false);
	 }
 });

 
 function del(){
		var chkArr = [];
		
		//check 된 체크박스의 박을 가져온다.
		$('#msgreceivelist input[type="checkbox"]:checked').each(function(msg_idx,item){
			chkArr.push($(this).val());
		});
		
		console.log(chkArr);
		
		$.ajax({
			type:'get',
			url:'receivedelete.ajax',
			data:{delList:chkArr},
			dataType:'JSON',
			success:function(data){
					listCall(currPage);	
			},
			error:function(e){
				console.log(e);
			}		
		});
}

	
</script>
</html>