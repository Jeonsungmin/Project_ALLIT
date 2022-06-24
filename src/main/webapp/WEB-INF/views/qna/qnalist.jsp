<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script> <!-- 페이징 처리 -->
<style>
   
   table,th,td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px;
      margin: auto;
   }
   
   h1{
   width:100px;
    text-align: center;
    font-weight: bold;
    position : relative;
    margin-top:200px;
    margin-left:50%;
    margin-right:50%;
   }
   
   
   p{
   text-align: center;
   position : relative;
   }
   
   h3{
   margin-left: 40%;
   }

	#pagePerNum {margin-left: 10%;}

	button{margin-right: 10%;}
   
</style>
</head>
<body>
	<h1>Q&A</h1>
	<p>서비스 이용에 대하여 궁금한 점이나 문의사항을 등록해 주시면 빠른 시간 내에 답변해 드리겠습니다.</p>
	<h3>검색<input type="text" name="search"><button onclick="location.href='searching.do'">검색</button></h3>
   <select id="pagePerNum">
      <option value="5">5개씩 보기</option>
      <option value="10">10개씩 보기</option>
      <option value="15">15개씩 보기</option>
      <option value="20">20개씩 보기</option>
   </select>
   <button onclick="location.href='qnaWrite.go'">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자ID</th>
				<th>답변여부</th>
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
    	var date = new Date(item.qna_date); 
       console.log(item);
       content += '<tr>';
       content += '<td>'+item.qna_idx+'</td>';
       content += '<td><a href="detail.go?qna_idx='+item.qna_idx+'">'+item.qna_title+'</a></td>';
       content += '<td>'+date.toLocaleDateString("ko-KR")+'</td>';
       content += '<td>'+item.mb_id+'</td>';
       if(item.qna_answer_chk == false ){
    	   content += '<td>'+"미답변"+'</td>';	   
       }else {content += '<td>'+"답변완료"+'</td>';	
       }
       //content += '<td>'+item.qna_answer_chk+'</td>';
       content += '</tr>';
    });
    $('#list').empty();
    $('#list').append(content);
 }


</script>
</html>