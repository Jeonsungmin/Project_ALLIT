<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src= "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>

<div class="container">
  <h2>파일업로드</h2>
  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>첨부 파일</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div>
  	<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
  </form>
</div>


<script>

$(document).ready(function(){
		// input file 파일 첨부시 fileCheck 함수 실행		
			$("#input_file").on("change", fileCheck);
		});

/**
 * 첨부파일로직
 */
$(function() {
    $('#btn-upload').click(function(e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 5;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fileCheck(e) {
    var files = e.target.files;
    
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }
  
 
 // 확장자 체크
function imgCheck(img){    
	 alert(img);        
	 frm.preview.src = "";     
	 frm.preview.src = img;       
	 
	 var preview = document.getElementById('preview');     
	 var width = preview.clientWidth;    
	 var height = preview.clientHeight;     
	 alert("width : " + width + " | height : " + height);    
	 /* 이미지 파일 형식 처리 */    
	 var imgHeader = img.lastIndexOf("\\");    
	 var imgMiddle = img.lastIndexOf(".");         
	 var imgName = img.substring(imgHeader+1, imgMiddle);     
	 var filepoint = img.substring(imgMiddle+1,img.length);    
	 
	 var imgtype = filepoint.toLowerCase();    
	 alert(imgHeader +"/"+ imgMiddle +"/"+ imgName + "/" + imgtype);        
	 
	 if ( imgtype != "jpg" ){        
		 frm.preview.src = "";        
		 alert("사진은 jpg 파일만 업로드할 수 있습니다.");         
		 return;    
		 
	 }}
출처: https://shxrecord.tistory.com/76 [첫 발:티스토리]


function filecheck(){
	var filePath = document.fileUpform.fileName.value;
	var extension = (filePath.substr(idx, filePath.length)).toLowerCase();
	
	if(extension =='jpg' || extension =='jpeg' || extension =='png'){
		 //다른 조건문
		
	}
}



</script>
</body>
</html>