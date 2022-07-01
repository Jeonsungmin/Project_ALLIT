<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="resources/img/icon.png">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script> <!-- 페이징 처리 -->
<style>
   table{
   width:100%;
   }
   
   table,th,td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px;
   }
</style>
</head>
<body>
   게시물 갯수
   <select id="pagePerNum">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
   </select>
   <table>
      <thead>
         <tr>
            <th>글제목</th>
            <th>제목</th>
            <th>작성자</th>
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
   </table>
</body>
<script>
/*
   $(document).ready(function(){
      
   });
 */
 var currPage = 1;
 
 listCall(currPage);
 
 $('#pagePerNum').on('change',function(){
	console.log("currPage: " + currPage);
   //페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
   //페이지당 보여줄 수 변경시 기존 페이지 요소를 없애고 다시 만들어 준다.
   $("#pagination").twbsPagination('destroy');   
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
          page : page
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
       console.log(item);
       content += '<tr>';
       content += '<td>'+item.idx+'</td>';
       content += '<td>'+item.subject+'</td>';
       content += '<td>'+item.user_name+'</td>';
       content += '<td>'+item.bHit+'</td>';
       content += '</tr>';
    });
    $('#list').empty();
    $('#list').append(content);
 }




</script>
</html>





