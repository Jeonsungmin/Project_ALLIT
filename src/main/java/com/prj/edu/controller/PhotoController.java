package com.prj.edu.controller;

import java.util.ArrayList;
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
	
	
	//글쓰기+사진 업로드
	@RequestMapping(value = "/write.do")
	public String write(Model model, MultipartFile[] photos,
			@RequestParam HashMap<String, String> params) {
			
		logger.info("글쓰기 요청: " + params);
			
		return service.write(photos, params);
			
			
		}
	
	
	

}
