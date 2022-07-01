<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	h3{
		margin-top:18px;
		text-align:center;
		background-color:#f2f2f2;
	}
	td,th{
		font-size: 15 px;
   }
   td,th{
      padding: 5px 10px;
   }
   table{
      width: 450px;
      margin:0 auto;
   }
   
</style>
</head>
<body>
	<h3>교육기관 회원가입</h3>
	<div style="padding:30px; background:#e8ecf4">
		<table>
			<tr>
				<th>
					<input type="radio" name="member" onclick="window.location.href='/joinForm.go';" value="일반">일반회원
				</th>
				<td style="font-weight:bold;">  
					<input type="radio" name="member" value="교육기관" checked="checked">교육기관회원
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type ="text" name="mb_id"/></td>
				<td><input type="button" value="중복체크" onclick="overlay()"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type ="text" name="mb_pass"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type ="text" name="pw"/></td>	
				<td><input type="button" value="중복체크" onclick="pw()"/></td>
			</tr>
			<tr>
				<th>대표자 성명</th>
				<td><input type ="text" name="rep_name" required="required"/></td>
			</tr>
			<tr>
				<th>교육기관명</th>
				<td><input type ="text" name="edu_name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type ="text" name="mb_email"/></td>
			</tr>	
			<tr>
				<th>연락처</th>
				<td><input type ="text" name="mb_tel"/></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type ="text" name="mb_postcode"/></td>
			</tr>
			<tr>
				<th>기본주소</th>
				<td><input type ="text" name="mb_basic_addr"/></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type ="text" name="mb_detail_addr"/></td>
			</tr>
			<tr>
				<th>사업자등록증</th>
				<td><input type ="file" name="photo_category"/></td>
			</tr>
			
			<tr>
				<th colspan="2" style="text-align:right; padding-right: 30px;">
					<input type="button" onclick="join()" value="회원가입" style="background-color:#9fc5e8;"/>
				</th>
			</tr>
		</table>
	</div>
</body>
<script>
var checkId=false;
var checkPw=false;
function overlay(){
	var id = $("input[name='mb_id']").val();
	console.log('아이디 중복 체크 : '+id);		
	$.ajax({
		type:'get',
		url:'overlay.ajax',
		data:{chkId:id},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			if(data.msg){
				alert("이미 사용중인 아이디입니다.");
			}else{
				alert("사용 가능한 아이디입니다.");
				checkId=true;
			}
		},
		error:function(e){
			console.log(e);
		}			
	});
}
function pw() {
	   console.log("비밀번호 중복 확인");
	   var pass = $("input[name='mb_pass']").val();
	   var pw = $("input[name='pw']").val();
	   console.log('값 들어왔는지? : '+pass,pw);	
	   $.ajax({
	      type:'get',
	      url:'pwequl.ajax',
	      data:{
	    	 pass:pass,
	         pw:pw
	      },
	      dataType:'JSON',
	      success:function(data){
	         if(!data.equl){
	        	 alert("비밀번호가 일치하지 않습니다.");
	         }else{
	        	 alert("비밀번호가 일치합니다.");
	        	 checkPw=true;
	         }
	      },
	      error:function(e){
	         console.log(e);
	      }
	   });
}
function edu(){
	var name = $("input[name='rep_name']").val();
	var edu = $("input[name='edu_name']").val();
	var id = $("input[name='mb_id']").val();
	$.ajax({
		  type:'post',
		  url:'joinedu.ajax',
		  data:{
			  mb_id:id,
			  rep_name:name,
			  edu_name:edu,
		  },
		  dataType:'JSON',
		  success:function(data){
			  console.log(data);
		  },
		  error:function(e){
			  console.log(e);
		  }
	   });
}
function join() {
	   console.log("회원가입");
	   var id = $("input[name='mb_id']").val();
	   var pw = $("input[name='mb_pass']").val();
	   var name = $("input[name='rep_name']").val();
	   var edu = $("input[name='edu_name']").val();
	   var email = $("input[name='mb_email']").val();
	   var tel = $("input[name='mb_tel']").val();
	   var postcode = $("input[name='mb_postcode']").val();
	   var basic_addr = $("input[name='mb_basic_addr']").val();
	   var detail_addr = $("input[name='mb_detail_addr']").val();
	   //var photo = $("input[name='photo_category']").val();
	   var status = 0;
	   var stopcnt = 0;
	   var category_idx = 2;
	   
	   if(checkId&&checkPw!=false){
		   $.ajax({
			  type:'post',
			  url:'join.ajax',
			  data:{

				  mb_id:id,
				  mb_pass:pw,
				  rep_name:name,
				  edu_name:edu,
				  mb_email:email,
				  mb_tel:tel,
				  mb_postcode:postcode,
				  mb_basic_addr:basic_addr,
				  mb_detail_addr:detail_addr,
				  //포토 자리 추가해야됨
				  mb_status:status,
				  mb_stopcnt:stopcnt,
				  category_idx:category_idx
			  },
			  dataType:'JSON',
			  success:function(data){
				  console.log(data);
				  if(data.msg){
					  alert("회원가입에 성공하였습니다.");
					  location.href='/login.go';
				  }else{
					  alert("회원가입에 실패하였습니다.");
				  }
			  },
			  error:function(e){
				  console.log(e);
			  }
		   });
	   }else{
		   alert("아이디, 비밀번호 중복체크를 확인해주세요.");
		   $id.focus();
	   }
	}
</script>
</html>