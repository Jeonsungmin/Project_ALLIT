package com.prj.edu.service;

import java.util.HashMap;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;

=======
>>>>>>> origin/master
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.dao.PhotoDAO;
import com.prj.edu.dao.UserDAO;
import com.prj.edu.dto.EduDTO;
<<<<<<< HEAD
import com.prj.edu.dto.UserDTO;
=======
>>>>>>> origin/master

@Service
public class UserService {
	@Autowired UserDAO dao;
<<<<<<< HEAD
	@Autowired PhotoDAO photodao;
	
=======
>>>>>>> origin/master
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String mb_id, String mb_pass) {
		logger.info("로그인이 잘 들어왔나?");
		return dao.login(mb_id,mb_pass);
	}

<<<<<<< HEAD
	public int join(HashMap<String, Object> params) {
		
		return dao.join(params);
		
		
=======
	public HashMap<String, Object> join(HashMap<String, Object> params) {
		logger.info("회원가입 이동이 되나?");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.join(params);
		boolean msg = row>0?true:false;
		map.put("msg", msg);
		return map;
>>>>>>> origin/master
	}

	public String idsearch(String mb_email, String mb_tel) {
		logger.info("아이디 찾기가 잘 되는가?");
		return dao.idsearch(mb_email, mb_tel);
	}

	public String pwsearch(String mb_id, String mb_email, String mb_tel) {
		logger.info("비밀번호 찾기가 잘 되는가?");
		return dao.pwsearch(mb_id,mb_email,mb_tel);
	}

<<<<<<< HEAD
	
	
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

	public String delete(HttpSession session) {
		logger.info("탈퇴요청" + session);		
		return dao.delete(session);
	}

=======
	public int newpass(String mb_pass1) {
		logger.info("비밀번호 변경이 잘 되는가?");
		return dao.newpass(mb_pass1);
	}

	/*public int edujoin(MultipartFile[] photos, HashMap<String, Object> params) {
	    logger.info("교육기관 회원 이동이 잘되는지?");  
	    int row = dao.save(dto); 
	      
	    int photo_pr_num = dto.getEdu_idx();
	      
	    for(MultipartFile photo:photos) {
	         String photo_original = photo.getOriginalFilename();
	         logger.info("photo name: " + photo.getOriginalFilename());
	         
	         if(!photo.getOriginalFilename().equals("")) {
	            logger.info("업로드 진행");
	            String ext = photo_original.substring(photo_original.lastIndexOf(".")).toLowerCase();
	            String photo_copy = System.currentTimeMillis() + ext;
	            String photo_category = "사업자 등록증";
	            
	            logger.info(photo_original + photo_copy + photo_category);            
	                     
	            PhotoDAO.fileWrite(photo_original, photo_copy, photo_pr_num, photo_category);
	            logger.info(photo_copy + "save ok");      
	         }
	      }                
	      return dao.eduJoin(params);
	   }*/

	public HashMap<String, Object> overlay(String chkId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String ID = dao.overlay(chkId);
		boolean msg = ID==null?false:true;
		map.put("msg",msg);
		return map;
	}

	public int cnt(String mb_id) {
		logger.info("정지된 회원인지?");
		return dao.cnt(mb_id);
	}
>>>>>>> origin/master
}
