<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
   margin-top: 18px;
   text-align: center;
   background-color: #f2f2f2;
}

td, th {
   font-size: 15 px;
}

td, th {
   padding: 5px 10px;
}

table {
   width: 450px;
   margin: 0 auto;
}




</style>
</head>
<body>
   <h3>일반 회원가입</h3>
      <div style="padding:50px; background: #e8ecf4">
         <table>
            <tr>
               <th><input type="radio" name="member" value="일반"
                  checked="checked">일반회원</th>
               <td style="font-weight: bold;"><input type="radio"
                  name="member" value="교육기관"
                  onclick="window.location.href='edujoin.go';">교육기관회원</td>
            </tr>
            <tr>
               <th>아이디</th>
               <td><input type="text" name="mb_id" maxlength="15" value="6~15자로 입력하세요."/></td>
               <td><input type="button" value="중복체크" onclick="overlay()" /></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="mb_pass" maxlength="15" /></td>
            </tr>
            <tr>
               <th>비밀번호 확인</th>
               <td><input type="password" name="pw" /></td>
               <td><input type="button" value="중복체크" onclick="pw()" maxlength="15"/></td>
            </tr>
            <tr>
               <th>이름</th>
               <td><input type="text" name="mb_name" /></td>
            </tr>
            <tr>
               <th>생년월일</th>
               <td><input type="date" name="mb_birth"></td>
            </tr>
            <tr>
               <th>이메일</th>
               <td><input type="email" name="mb_email" value="30자 이내로 입력하세요." required="required"/></td>
            </tr>
            <tr>
               <th>성별</th>
               <td><input type="radio" name="mb_gender" value="남자">남성
                  <input type="radio" name="mb_gender" value="여자">여성</td>
            </tr>
            <tr>
               <th>연락처</th>
               <td><input type="text" name="mb_tel" /></td>
            </tr>
            <tr>
               <th>우편번호</th>
               <td><input type="text" name="mb_postcode" /></td>
            </tr>
            <tr>
               <th>기본주소</th>
               <td><input type="text" name="mb_basic_addr" /></td>
            </tr>
            <tr>
               <th>상세주소</th>
               <td><input type="text" name="mb_detail_addr" /></td>
            </tr>
            <tr>
               <th>최종학력</th>
               <td><input type="text" name="mb_edu" id="changeInput" readonly value="대학교 졸업"/></td>
               <td><select name="mb_edu" id="changeTest"
                  onchange="selectBoxChange(this.value);">
                     <option value="고등학교 졸업">고등학교 졸업</option>
                     <option value="전문대 졸업">전문대 졸업</option>
                     <option value="대학교 졸업" selected>대학교 졸업</option>
                     <option value="대학원 졸업">대학원 졸업</option>
               </select></td>
            </tr>
            <tr>
               <th>전공유무</th>
               <td><input type="radio" name="mb_major" value="전공">전공
                  <input type="radio" name="mb_major" value="비전공">비전공</td>
            </tr>
            <tr>
               <th colspan="2" style="text-align: right; padding-right: 30px;">
                  <input type="button" value="회원가입" onclick="join()"
                     style="background-color: #9fc5e8;"/>
               </th>
            </tr>
         </table>
      </div>
</body>
<script>

$("input[name='mb_id']").on('click', function(){ 
	$("input[name='mb_id']").val($(this).text());
	($(this).val(remove));

});
$("input[name='mb_email']").on('click', function(){ 
	$("input[name='mb_email']").val($(this).text());
	($(this).val(remove));

});


var msg = "${msg}";

if(msg != ""){
   alert(msg);
}

var selectBoxChange = function(value){
   console.log("값변경테스트 : "+ value);
   $("#changeInput").val(value);
}

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

function join() {
   console.log("회원가입");
   var id = $("input[name='mb_id']").val();
   var pw = $("input[name='mb_pass']").val();
   var name = $("input[name='mb_name']").val();
   var birth = $("input[name='mb_birth']").val();
   var email = $("input[name='mb_email']").val();
   var gender = $("input[name='mb_gender']").val();
   var tel = $("input[name='mb_tel']").val();
   var postcode = $("input[name='mb_postcode']").val();
   var basic_addr = $("input[name='mb_basic_addr']").val();
   var detail_addr = $("input[name='mb_detail_addr']").val();
   var edu = $("input[name='mb_edu']").val();
   var major = $("input[name='mb_major']").val();
   var status = 0;
   var stopcnt = 0;
   var category_idx = 1;
   
   if(checkId&&checkPw!=false){
	   $.ajax({
		  type:'post',
		  url:'join.ajax',
		  data:{
			  mb_id:id,
			  mb_pass:pw,
			  mb_name:name,
			  mb_birth:birth,
			  mb_email:email,
			  mb_gender:gender,
			  mb_tel:tel,
			  mb_postcode:postcode,
			  mb_basic_addr:basic_addr,
			  mb_detail_addr:detail_addr,
			  mb_edu:edu,
			  mb_major:major,
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
				  alert("해당 칸을 입력해주세요.");
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