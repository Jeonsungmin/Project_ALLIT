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





@Service
public class PhotoService {
	
	@Autowired PhotoDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String write(MultipartFile[] photos, HashMap<String, String> params) {
		
		BoardDTO dto = new BoardDTO();
		
		
		//글번호 가져오기
		//int recruit_idx = dto.getRecruit_idx;
		//int photo_pr_num = recruit_idx;
		fileSave(photos , photo_pr_num);
		
		
		return null;
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
				String photo_category = "모집공고 사진";
				
				logger.info(photo_original + photo_copy + photo_category);				
				
				dao.fileWrite(photo_original, photo_copy, photo_pr_num, photo_category);
				//3-4 파일 받아서 저장하기
//				try {
//					byte[] arr =photo.getBytes();
//					Path path = Paths.get("C:/upload/" + photo_copy);
//					Files.write(path, arr);
//					logger.info(photo_copy + "save ok");
//					//4. 업로드 후 photo테이블에 데이터 입력
//					dao.fileWrite(photo_original, photo_copy, photo_pr_num);
//					
//				} catch (IOException e) {
//		
//					e.printStackTrace();
//				}
			}
		}		

	}
}
