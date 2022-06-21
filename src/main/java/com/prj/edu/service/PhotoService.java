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

import com.prj.edu.dto.BoardDTO;
import com.prj.edu.dto.PhotoDTO;



@Service
public class PhotoService {
	
	@Autowired PhotoDTO dto;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String write(MultipartFile[] photos, HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
