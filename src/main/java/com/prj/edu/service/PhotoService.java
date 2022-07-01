package com.prj.edu.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.dao.PhotoDAO;

@Service
public class PhotoService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PhotoDAO dao;

	public String upload(MultipartFile[] photos) {
		
		logger.info("업로드서비스 시작");
	
		for(MultipartFile photo:photos) {
			String photo_original = photo.getOriginalFilename(); //3-1파일명 추출
			logger.info("photo name: " + photo.getOriginalFilename());
			
			if(!photo.getOriginalFilename().equals("")) {
				logger.info("업로드 진행");
				
				//3-2 확장자 분리
				String ext = photo_original.substring(photo_original.lastIndexOf(".")).toLowerCase();
				
				//3-3 새 이름 만들기
				String photo_copy = System.currentTimeMillis() + ext;
				String photo_category = "사업자 등록증";
				
				logger.info(photo_original + photo_copy + photo_category);				
				logger.info(photo_copy + "save ok");
				
			}
		}
				
		return "eduJoin";

	
	}
}
