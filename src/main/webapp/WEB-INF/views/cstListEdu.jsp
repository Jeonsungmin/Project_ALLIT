<%@page import="org.springframework.web.context.annotation.SessionScope"%>
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
		<link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
		
		<style>
			table{
				width: 80%;
				margin: auto;
				border: 1px solid black;
				border-collapse: collapse;
			}
			th{
				background: #DEECFC;
			}
			
			td{
				font-size: 15px;
			}
			
			h3{
				text-align: center;
				padding: 20px 20px;
				font-size: 25px;
				font-weight: bold;
			}

			input[type="button"],button{
				width:80px;
				margin-left: 78%;
				padding:2px;
				font-size: 13px;
			}
			select{
				margin-left: 15%;
				margin-bottom: 10px;
			}	
						
		</style>
		<jsp:include page="./commons/loginBox.jsp"/>
	   <jsp:include page="./commons/smnav.jsp"/>
	</head>
	<body>
            <h3>상담신청 내역 리스트</h3>
            <br/>
<!--            	<button onclick="location.href='/cstWrite.go'">글쓰기</button> -->
            <h5>미열람 갯수 :  ${sessionScope.eduCnt}개</h5>
            <input type="button" value="삭제하기" onclick="cstDel()"/>
      		<br/>
          <select id="pagePerNum">
                <option value="5"> 5개씩 </option>
                <option value="10"> 10개씩 </option>
                <option value="15"> 15개씩 </option>
                <option value="20"> 20개씩 </option>
          </select>
          
<!-- <button onclick="cstHidden()">삭제하기</button> -->

	   <table>
	      <thead>
	         <tr>
				<th width="5%"><input type="checkbox" id ="all"/></th>
				<th width="10%">번호</th>
	            <th width="50%">교육과정명</th>
	            <th width="10%">신청자 ID</th>
	            <th width="15%">신청일</th>
	            <th width="10%">열람여부</th>
	         </tr>
	      </thead>
	
	      <tbody id="eduList">

	      </tbody>
	      
	        <tr>
	         <td colspan="6" id="paging">
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
		
		eduListCall(currPage);
		//페이징 처리
		$('#pagePerNum').on('change',function(){
			console.log("currPage: " + currPage);
		  //페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
		  //페이지당 보여줄 수 변경시 기존 페이지 요소를 없애고 다시 만들어 준다.
		  $("#pagination").twbsPagination('destroy');   
		  eduListCall(currPage);
		});
	
		function eduListCall(page){
			
		   var pagePerNum = $('#pagePerNum').val();
		   console.log("param page : " +page);
		   $.ajax({
		      type:'GET',
		      url:'cstListEdu.ajax',
		      data:{
		         cnt : pagePerNum,
		         page : page
     			},
		      dataType:'JSON',
		      success:function(data){
		         console.log(data);
		         drawList(data.eduList);
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
		               	eduListCall(page);
		            }
		         });		         
		      },
		      error:function(e){
		         console.log(e);
		      }
		   });
		}
	
	function drawList(eduList){
		
	    var content = '';
	   
	    eduList.forEach(function(item){
	    	if(item.cons_delete_edu == false){
	    	
	        var date = new Date(item.cons_date);
	        var open = item.cons_open;
	        
	        if(item.cons_open == false){
	            open = "미열람";

	        }else{
	            open = "열람";
	        	}

	   		console.log(item);    
	        
			content += '<tr>';
			content += '<td><input type="checkbox" value="'+item.cons_idx+'"/></td>';
			content += '<td>'+item.cons_idx+'</td>';
			content += '<td><a href="cstDetail.do?cons_idx='+item.cons_idx+'">'+item.recruit_title+'</a></td>';
			content += '<td>'+item.mb_id+'</td>';
			content += '<td>'+date.toLocaleDateString("ko-KR").replace(/\.$/, '')+'</td>';
			content += '<td>'+open+'</td>';
			content += '</tr>';
	    	}
	    });
	    $('#eduList').empty();
	    $('#eduList').append(content);
	 }

	
	//아이디가 all인 요소를 클릭하면 체크박스가 모두 체크 되도록
	$('#all').click(function(){
		
		var $chk = $('input[type="checkbox"]'); //checkbox 모두 가져옴
		console.log($chk);
	
		//prop과 attr의 차이
		//prop: 동적인 요소의 속성 -> 애초에 html로 있었던 요소가 아니라 나중에 js를 통해 그려진 요소
		//attr: 정적 요소릐 속성 -> 애초에 html로 있었던 요소
		if($(this).is(":checked")){
			$chk.prop("checked",true);
		}else{
			$chk.prop("checked",false);
		}
	});
	
	function cstDel(){
		var chkArr =[];
		//check된 체크박스의 박스를 가져온다.
		$('#eduList input[type="checkbox"]:checked').each(function(cons_idx,item){
			chkArr.push($(this).val());
		});
		console.log(chkArr);
		
		$.ajax({
			type:'get',
			url:'eduDel.ajax',
			data:{delList:chkArr},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				alert(data.msg);
				eduListCall(currPage);
			},
			error:function(e){
				console.log(e);
			}
		});
	}

	
	
	</script>
</html>