package com.prj.edu.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.dao.PhotoDAO;
import com.prj.edu.dao.UserDAO;
import com.prj.edu.dto.EduDTO;
import com.prj.edu.dto.UserDTO;

@Service
public class UserService {
	@Autowired UserDAO dao;
	@Autowired PhotoDAO photodao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String mb_id, String mb_pass) {
		logger.info("로그인이 잘 들어왔나?");
		return dao.login(mb_id,mb_pass);
	}

	public int join(HashMap<String, Object> params) {
		
		return dao.join(params);
		
		
	}

	public String idsearch(String mb_email, String mb_tel) {
		logger.info("아이디 찾기가 잘 되는가?");
		return dao.idsearch(mb_email, mb_tel);
	}

	public String pwsearch(String mb_id, String mb_email, String mb_tel) {
		logger.info("비밀번호 찾기가 잘 되는가?");
		return dao.pwsearch(mb_id,mb_email,mb_tel);
	}

	
	
	public int edujoin(MultipartFile[] photos, HashMap<String, Object> params) {
		
		logger.info("교육회원 가입");
		
		EduDTO dto = new EduDTO();
		UserDTO udto = new UserDTO();
		
		
		//dto.setEdu_idx(params.get("edu_idx"));		
				
		int photo_pr_num = dto.getEdu_idx();
		
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
							
				photodao.fileWrite(photo_original, photo_copy, photo_pr_num, photo_category);
				logger.info(photo_copy + "save ok");		
			
			}
		}	
		
		return dao.eduJoin(params);
		
	
	}

	public void delete(String mb_id) {
		logger.info("탈퇴요청" + mb_id);
		dao.delete(mb_id);
		
		
	}

	

	
}
