<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script> <!-- 페이징 처리 -->
<style>
	.nav1 > ul {
    width: 1000px;
    height: 40px;
	margin: 0 auto;
    display: flex;
    justify-content: space-around;
    align-items: center;
    font-size: 7px;
    font-weight: bold;
    border-top: 1px solid #f1f3f6;
    background-color: #fff;
  }
    
    

  .nav1 ul > li > a:hover{
    color: black;
  }
  .nav1 ul > li > a {
    text-decoration: none;
  }
  .nav1 ul > li.on > a {
  	color:#ff0000;
  }
</style>
</head>
<body>
        <div class="nav1">
          <ul>
          	<!--
          		data 속성은 body 내 사용할 수 있는 대부분의 HTML Element(요소)에 값을 줄 수 있다.
          		jQuery 에서 해당 요소의 속성을 이용해 값을 가져오기 편하고,
          		Ajax로 통신할 때 DB에 WHERE 을 추가하여 board_category 컬럼(필드)와 비교하여 해당 카테고리 내 게시물만 가져오기 위한 선행 작업인 것이다.
          	-->
            <li data="공지사항" class="on"><a href="#">공지사항</a></li>
            <li data="질문"><a href="#">질문하기</a></li>
            <li data="tip"><a href="#">tip</a></li>
            <li data="잡담"><a href="#">잡담</a></li>
           
          </ul>
        </div>
	게시물 갯수
   <select id="pagePerNum">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
   </select>
   보기
   <select id="listPerName">
   		<option value="">최신순</option>
   		<option value="">오래된순</option>
   </select>
   
	<div class="searchbox">
		<div class="header">
			<h1>검색</h1>
			<input type="text" id="board_search" placeholder="Type to Search">
			<button type="button" onclick="filter()">검색</button>
		</div>
	</div>
	
   <table>
      <thead>
         <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>

      <tbody id="list">
      
      </tbody>
      <tr>
         <td colspan="4" id="paging">
            <!-- plugin 사용법(twbspagination) , 이렇게 쓰라고 명시되어있음. -->
            <div class="container">
               <nav arial-label="Page navigation" style="text-align:center">
               <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
      <tr>
		<th colspan="2">
			<input type="button" value ="글쓰기" onclick="location.href='boardWrite.go'"/>
		</th>
	</tr>
   </table>



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


function filter() {
	// 1. search라는 이름으로 id를 가진 녀석의 value 값을 먼저 알아낸다.
	
	var board_search = $('#search').val();
	// 2. Ajax 리스트 함수를 호출하되, 1에서 얻은 값을 요청하는 것이다.
	
	
}


// 내비게이션 요소(공지사항, 질문하기, tip, 잡담)를 클릭하면 발생할 이벤트
$('.nav1 > ul > li').on('click',function(){
	// 내비게이션 요소의 모든 li에 on 클래스를 제거한다.
	$('.nav1 > ul > li').removeClass('on');
	// 클릭한 요소에 on 이라는 클래스를 추가한다.
	$(this).addClass('on');
	
	// 마지막으로 listCall(1) 을 호출함으로써 Ajax 를 호출하여 최초 페이지인 1페이지로 보내기 위한 것이다.
	$("#pagination").twbsPagination('destroy');
	currPage = 1;
	listCall(currPage);
});

function listCall(page){
   
   var pagePerNum = $('#pagePerNum').val();
   console.log("param page : " +page);
   
   $.ajax({
      type:'GET',
      url:'list.ajax',
      data:{
    	 cnt : pagePerNum,
         page : page,
         board_category : $('.nav1 > ul > li.on').attr('data'), // 현재 활성화 되어 있는 내비게이션의 data 속성을 가져온다.(즉, 내가 선택한 카테고리)
         //board_search : $('#board_search').val()
         },
      dataType:'JSON',
      success:function(data){
         console.log(data);
         drawList(data.list);
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


function drawList(list){
	
    var content = '';
    list.forEach(function(item){
    	var date = new Date(item.board_date);
       console.log(item);
       content += '<tr>';
       content += '<td>'+item.board_idx+'</td>';
       content += '<td><a href="detail.go?board_idx='+item.board_idx+'">'+item.board_title+'</a></td>';
       content += '<td>'+item.mb_id+'</td>';
       content += '<td>'+date.toLocaleDateString("ko-KR").replace(/\.$/, '')+'</td>';
       
       content += '<td>'+item.board_hits+'</td>';
       content += '</tr>';
       
    });
    $('#list').empty();
    $('#list').append(content);
 }






</script>
</html>