package com.prj.edu.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.service.PhotoService;

@Controller
public class PhotoController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PhotoService service;
	
	//파일업로드
		@RequestMapping(value = "/upload")
		public String photo(Model model, MultipartFile[] photos) {			
			logger.info("사진 저장 요청: " + photos);			
			return service.upload(photos);			
		}
}
