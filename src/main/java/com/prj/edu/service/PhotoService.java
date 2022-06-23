package com.prj.edu.service;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.dao.BoardDAO;
import com.prj.edu.dao.PhotoDAO;
import com.prj.edu.dto.BoardDTO;
import com.spring.photo.dto.PhotoDTO;





@Service
public class PhotoService {
	
	@Autowired PhotoDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String write(MultipartFile[] photos, HashMap<String, String> params) {
		//1. bbs에 데이터 입력글쓰기
		
		//2. bbs 입력후 방금 입력한 데이터에 대한 idx얻어오기
		//2번을 하기위한 조건1. 반드시 파라메터는 dto로 할것
		BoardDTO dto = new BoardDTO();
	
		//int row = dao.write(dto);
		//실행하고나면 파라메터에 idx가 들어있을 것이다.		
		//int idx = dto.getIdx();
		// logger.info("방금 넣은 글번호:" + idx);   //idx는 글제목 번호
		
		
		//int photo_pr_num = idx;
	
		//if(row>0) {
			//fileSave(photos, photo_pr_num);
		//}
		
		
		return "redirect:/detail?idx=" ;
	}

	
	public void fileSave(MultipartFile[] photos, int photo_pr_num) {
		// 파일 업로드
		for(MultipartFile photo:photos) {
			String photo_original = photo.getOriginalFilename(); //3-1파일명 추출
			logger.info("photo name: " + photo.getOriginalFilename());
			
			if(!photo.getOriginalFilename().equals("")) {
				logger.info("업로드 진행");
				
				//3-2 확장자 분리
				String ext = photo_original.substring(photo_original.lastIndexOf(".")).toLowerCase();
				
				//3-3 새 이름 만들기
				String photo_copy = System.currentTimeMillis() + ext;
				String photo_category = "사업자등록증"; //모집공고 게시판은 모집공고 사진으로 변경
				
				logger.info(photo_original + photo_copy + photo_category);				
				
				//db에 사진 저장
				dao.fileWrite(photo_original, photo_copy, photo_pr_num, photo_category);
				logger.info("사진 저장 성공");

			}
		}		

	}
	
	
	//업로드 불러오기
	//ArrayList<PhotoDTO>list= dao.photoList(idx);//photo 정보 가져오기
	
	//업로드 제한
	
}
