<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

   h1 {
   text-align: center;
   margin-bottom: 55px;
   margin-top: 30px;
   }

   table{
   width:100%;
   }
   
   table,th,td{
   padding: 5px;
   border: 1px solid black;
   border-collapse: collapse;
   }
   
   th {
   text-align: center;
   }

</style>
   <jsp:include page="./commons/loginBox.jsp"/>
   <jsp:include page="./commons/smnav.jsp"/>
</head>
<body>
	<!-- GDJ 3조 정현민 -->
	<h1>모집공고 상세보기<h1>

	<form action="/recruit/update.go?idx=${recruit.recruit_idx}" class="recruit">
		<table>
			<tr>
                <th rowspan="4">${recruit.edu_name}</th>
                <th>과정명</th>
                <td colspan="2">${recruit.recruit_title}</td>
                <td colspan="2">모집기간 : ${recruit.recruit_start} ~ ${recruit.recruit_end}</td>
            </tr>    
			<tr>
                <th>교육기관 위치</th>
                <td colspan="2">${recruit.mb_basic_addr}</td>
                <td colspan="2">훈련기간 : ${recruit.recruit_period_sta} ~ ${recruit.recruit_period_end}</td>
            </tr>
            <tr>
                <th>담당자 연락처</th>
                <td>${recruit.mb_tel}</td>
                <th>담당자 ID</th>
                <td>${recruit.mb_id}</td>
            </tr>
            <tr>
                <th>학원 홈페이지</th>
                <td><a href="${recruit.recruit_link}" target="_blank" id="link">${recruit.recruit_link}</a></td>
                <th>교육분야</th>
                <td>${recruit.recruit_field}</td>
                <!-- 상담신청 연결해야 하는 부분 -->
               	<td><input id="cst_button" type="button" value="상담신청"/></td>
            </tr>    				
            <tr>
                <td colspan="6">${recruit.recruit_content}</td>
            </tr>	
            
            
            
			<tr>
				<th>사진</th>
				<td>
				<c:forEach items="${list}" var="photos">
					</c:forEach>
				</td>
			</tr>			
            
            
            
		</table>
        	<input id="update" type="submit" value="수정하기" hidden="true"/>
        	<input id="delete" type="button" value="삭제하기" hidden="true"/>
        	<!-- 되돌아가기 클릭 후 리스트로 넘어갔을 때, '전체보기'가 선택된 상태여야 하기 때문에 field=all 을 담고 이동 -->
   			<input type="button" value="되돌아가기" onclick="location.href='/recruitList.go?field=all'"/>
	</form>
</body>
<script>
	var cateName = "${category}";
	var id = "${sessionScope.loginId}";
	
	// 매니저 회원, 관리자는 모든 글에 대해 수정하기, 삭제하기를 할 수 있게끔 하는 기능
    if(cateName == "매니저 회원" || cateName == "관리자") {
    	$("#update").show();
    	$("#delete").show();
    }
    
    // 본인이 작성한 글에 대해서만 수정하기, 삭제하기 버튼을 보이게하는 기능
    if(id == "${recruit.mb_id}") {
    	$("#update").show();
    	$("#delete").show();
    }
    
 	// 비로그인 회원이 상담신청 버튼을 눌렀을때 경고창과 함께 로그인 창으로 보내는 코드
 	// 회원가입을 유도하기 위해 disabled 또는 hide 를 적용하지 않았음
    $("#cst_button").on("click",function(){ 
    	if(id == "") {
    		alert("로그인이 필요한 서비스입니다.");
    		location.href = "/login.go";
    	} else {
    		location.href="/recruit/...?idx=${recruit.recruit_idx}";
    	}
    });
    
 	// 공고글 마감 or 본인이 작성한 공고글에 대해 상담신청을 하지 못하게 막는 기능
    if("${recruit.recruit_close}" == "false" || id == "${recruit.mb_id}") {
    	$("#cst_button").attr("disabled", true); 
    }
 	
 	// 삭제요청을 한번 더 묻는 기능
 	$("#delete").on("click",function(){
	 	var result = confirm('정말 삭제하시겠습니까?');
	 	
	 	if(result) {
	 		location.replace('/recruit/delete.do?idx=${recruit.recruit_idx}');
	 	}
 	});
    
   	//visibility : hidden 
   	//display : none 이 hidden 역할을 한다
   	//둘의 차이는 visibility 는 해당 영역의 크기를 유지하며 숨기고,
   	//display none 은 해당 영역의 자리를 차지하지 않고 숨긴다.
</script>
</html>