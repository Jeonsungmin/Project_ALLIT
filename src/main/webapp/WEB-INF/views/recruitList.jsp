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
    font-size: 12px;
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
   
   .menu-bar {
   display: flex;
   justify-content: space-around;
   align-items: center;
   height: 80px;
   margin-top: 100px;
   background-color: #6ea3e8;
   }
   
   .menu-bar a {
   font-size: 24px;
   text-decoration: none;
   color: #fff;
   }

   h1 {
   text-align: center;
   margin-bottom: 55px;
   margin-top: 30px;
   }
   
   .hot-edu {
   font-size: 18px;
   color:#ff0000;
   margin-bottom: 11px;
   text-align: center;
   font-weight: bold;
   }
   
   table{
   width:100%;
   }
   
   table,th,td{
   border: 1px solid black;
   border-collapse: collapse;
   padding: 5px;
   text-align: center;
   }
   
   .search {
   height: 46px;
   }
   
   .animated-text {
   color: #fff;
   position: relative;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   background: #2980b9;
   padding: 0 40px;
   height: 60px;
   overflow: hidden;
   top: 20px;
   }
   
   .line {
   text-transform: uppercase;
   text-align: center;
   font-size: 20px;
   line-height: 60px;
   text-decoration: none;
   }
   
   .line:first-child {
   animation: anim 30s infinite;
   }
   
   .line a {
   color: #fff;
   }
   
   @keyframes anim {
   0% {
   margin-top: 0;
   }
   16% {
   margin-top: -60px;
   }
   33% {
   margin-top: -120px;
   }
   50% {
   margin-top: -180px;
   }
   66% {
   margin-top: -120px;
   }
   82% {
   margin-top: -60px;
   }
   100% {
   margin-top: 0;
   }
   }
   
</style>
   <jsp:include page="./commons/loginBox.jsp"/>
   <jsp:include page="./commons/smnav.jsp"/>
</head>
	<body>
		<!-- GDJ 3조 정현민 -->
	    <h1>국비 훈련과정 모집</h1>
	    <div class="search">
	        <input type="text" placeholder="과정명 입력">
	        <button>검색</button>
	    </div>
	    
	    <div class="hot-edu">HOT 훈련과정</div>
	    
	    <!-- foreach ORDER BY recruit_hits(조회수) 기준 상위 4개 튜플 끌고오기-->
	    <div class="animated-text">
	    	<c:forEach items="${hotList}" var="list">
		    	<div class="line">
			    	${list.edu_name}
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<a href="/recruit/detail.do?idx=${list.recruit_idx}">
			    		${list.recruit_title}
			    	</a>
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<a href="/recruit/detail.do?idx=${list.recruit_idx}">
			    		훈련기간 : ${list.recruit_period_sta} ~ ${list.recruit_period_end}
			    	</a>
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<!-- list.dday < 0 -->
			    	<c:if test="${list.dday le '0'}">
			    	오늘마감
			    	</c:if>
			    	<!-- list.dday >= 0 -->
					<c:if test="${list.dday gt '0'}">
			    	마감 ${list.dday}일 전
			    	</c:if>
		    	</div>
		    </c:forEach>
	    </div>
	    
		<button id="write" onclick="location.href='/recruit/Write.go'">글쓰기</button>
	   	<!--
   		data 속성은 body 내 사용할 수 있는 대부분의 HTML Element(요소)에 값을 줄 수 있다.
   		jQuery 에서 해당 요소의 속성을 이용해 값을 가져오기 편하고,
   		Ajax로 통신할 때 DB에 WHERE 을 추가하여 board_category 컬럼(필드)와 비교하여 해당 카테고리 내 게시물만 가져오기 위한 선행 작업인 것이다.
	   	-->
	    <div class="nav1">
	  	   <ul>
		       <li data="all" class="on"><a href="#">전체보기</a></li>
		       <li data="웹개발 (Front-end)"><a href="#">웹개발 (Front-end)</a></li>
		       <li data="웹개발 (Back-end)"><a href="#">웹개발 (Back-end)</a></li>
		       <li data="앱개발 (Kotlin)"><a href="#">앱개발 (Kotlin)</a></li>
		       <li data="앱개발 (Swift)"><a href="#">앱개발 (Swift)</a></li>
	       </ul>
	    </div>
		
	   <select id="pagePerNum">
	      <option value="5">5개씩</option>
	      <option value="10">10개씩</option>
	      <option value="15">15개씩</option>
	      <option value="20">20개씩</option>
	   </select>
	   
	   <table>
	      <thead>
	         <tr>
	            <th>번호</th>
				<th>훈련기관명</th>
				<th>과정명</th>
				<th>모집기간</th>
				<th>훈련기간</th>
				<th>훈련기관 위치</th>
				<th>모집여부</th>
				<th>조회수</th>
				<th>찜</th>
	         </tr>
	      </thead>
	      <tbody id="list">
	
	      </tbody>
	   </table>
	   <div class="container">
	      <nav arial-label="Page navigation" style="text-align:center">
	         <ul class="pagination" id="pagination"></ul>
	      </nav>
	   </div>
	</body>
<script>
  var cateName = "${category}";
  
  // '교육기관 회원'이 아니면 '글쓰기' 버튼을 숨김
  // '매니저 회원', '관리자'는 '글쓰기'에 접근할 필요가 없기 때문에 권한 X
  if(cateName != "교육기관 회원") {
	$("#write").attr('hidden',true);
  }

 var currPage = 1;
 
 listCall(currPage);
 
 $('#pagePerNum').on('change',function(){
	console.log("currPage: " + currPage);
   //페이지당 보여줄 수를 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
   //페이지당 보여줄 수를 변경시 기존 페이지 요소를 없애고 다시 만들어 준다.
   $("#pagination").twbsPagination('destroy');   
   listCall(currPage);    
 });
 
 // 1. 만약 param에 교육분야(백,프론트,안드로이드,스위프트..) 값이 있다면 removeClass로 on을 제거한다.
 // 2. 가져온 param 값과 li > data의 값이 일치하면 해당 li 에 addClass('on') 를 부여한다.
 
 // 1. each 로 뽑아온 data 값과 field의 값이 일치하면
 // 2. 클래스 'on'을 추가해준다.
 
 // 1. 모집공고를 클릭했을 때 field 값에 'all' 이 넘어간다.
 // 2. field 값과 전체보기의 data 가 일치하면 클래스on 부여

 if("${field}" != null) {
	$('.nav1 > ul > li').removeClass('on');
 }
 
 $('.nav1 > ul > li').each(function(){
	if("${field}" == $(this).attr('data')) {
		$(this).addClass('on');	
	} 
 });
 
 //내비게이션 요소(공지사항, 질문하기, tip, 잡담)를 클릭하면 발생할 이벤트
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
       url:'recruitList.ajax',
       data:{
          cnt : pagePerNum,
          page : page,
          recruit_category : $('.nav1 > ul > li.on').attr('data'), // 현재 활성화 되어 있는 내비게이션의 data 속성을 가져온다.(즉, 내가 선택한 카테고리)
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
          console.log(e);
       },
       beforeSend: function(xhr) {
    	 	// before : 전
     		// send : 전송
     		// ajax 를 전송하기 전에 실행할 함수
     		// xhr.setRequestHeader : 요청헤더를 설정한다. AJAX를 true로!

	   xhr.setRequestHeader("AJAX", true); //session 유지 도움 코드
   	   }
    });

 }
 
 function drawList(list){
    var content = '';
    list.forEach(function(item){
       
       var dateStart1 = new Date(item.recruit_start);
       var dateEnd1 = new Date(item.recruit_end);
       var dateStart2 = new Date(item.recruit_period_sta);
       var dateEnd2 = new Date(item.recruit_period_end);
       
       
       // 1. 마감여부(recruit_close)가 0(false)이면 "마감"이라는 표시가 나타난다. (1 = "모집중")
       // 2. 공고글을 작성 시, 마감여부(recruit_close)는 1(true / "모집중")이 기본값으로 들어간다.
       // 3. 모집공고 리스트를 보여줄 때, 모집마감일(recruit_end)이 시스템의 '오늘날짜(recruit_curdate)'보다 이전이라면 마감여부(recruit_close)는 0(false)로 변경된다(update).
       var closeYn = item.recruit_close;
       
       if(closeYn == 1) {
    	   closeYn = "모집중";
       } else
    	   closeYn = "마감";
       
       
       console.log(item);
       content += '<tr>';
       content += '<td>'+item.recruit_idx+'</td>';
       content += '<td>'+item.edu_name+'</td>';
       content += '<td><a href="recruit/detail.do?idx='+item.recruit_idx+'">'+item.recruit_title+'</a></td>';
       content += '<td>'+dateStart1.toLocaleDateString("ko-KR").replace(/\.$/, '')+' ~ '+dateEnd1.toLocaleDateString("ko-KR").replace(/\.$/, '')+'</td>';
       content += '<td>'+dateStart2.toLocaleDateString("ko-KR").replace(/\.$/, '')+' ~ '+dateEnd2.toLocaleDateString("ko-KR").replace(/\.$/, '')+'</td>';
       content += '<td>'+item.mb_basic_addr+'</td>';
       content += '<td>'+closeYn+'</td>';
       content += '<td>'+item.recruit_hits+'</td>';
       content += '<td><a href="/addcart?recruit_idx='+item.recruit_idx+'" id="cart">♡</a></td>';
 
       content += '</tr>';
    });
    $('#list').empty();
    $('#list').append(content);
 }


</script>
</html>





