package com.prj.edu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.edu.dao.UserDAO;
import com.prj.edu.dto.UserDTO;

@Service
public class UserService {
	@Autowired UserDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String mb_id, String mb_pass) {
		logger.info("로그인이 잘 들어왔나?");
		return dao.login(mb_id,mb_pass);
	}

	public HashMap<String, Object> join(HashMap<String, Object> params) {
		logger.info("회원가입 이동이 되나?");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.join(params);
		boolean msg = row>0?true:false;
		map.put("msg", msg);
		return map;
	}

	public String idsearch(String mb_email, String mb_tel) {
		logger.info("아이디 찾기가 잘 되는가?");
		return dao.idsearch(mb_email, mb_tel);
	}

	public String pwsearch(String mb_id, String mb_email, String mb_tel) {
		logger.info("비밀번호 찾기가 잘 되는가?");
		return dao.pwsearch(mb_id,mb_email,mb_tel);
	}

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

	public HashMap<String, Object> list(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("ok");
	      int cnt = Integer.parseInt(params.get("cnt"));
	      int page = Integer.parseInt(params.get("page"));
	      logger.info("보여줄 페이지 : " + page);
	      int allCnt = dao.allCount();
	      logger.info("allCnt:" + allCnt);
	      int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
	      //총갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
	      //464            5                        = 93pages (마지막페이지 cnt=4)
	      //464/5=92.8나옴.   
	      
	      logger.info("pages : " + pages);
	      //currPage = pages
	      //currPage가 pages보다 크면 currPage를 pages로 맞춰준다?
	      if(page > pages) {
	         page = pages;
	      }
	      
	      map.put("pages", pages);      //만들 수 있는 최대 페이지 수
	      map.put("currPage", page); //현재 페이지
	   
	      
	      int offset = (page-1) * cnt;
	      logger.info("offset : " + offset);
	      // page  :  (cnt)     =    offset
	      // 1         0~4            0      
	      // 2         5~9            5
	      // 3         10~14         10
	      // 4         15~19         15
	      // 5         20   ~24         20 
	      // 6          25   ~29         25
	      //1씩 증가하면 5씩 증가?
	      
	         
	      ArrayList<UserDTO> list = dao.list(cnt, offset);
	      map.put("list", list);
	      
	      return map;
	   }

	public UserDTO userDetail(String mb_id) {
			UserDTO dto = null;
			logger.info(mb_id + "일반회원 상세보기 서비스 요청");
			dto = dao.userDetail(mb_id);
			
		return dto;
	}

	public UserDTO eduDetail(String mb_id) {
		UserDTO dto = null;
		logger.info(mb_id + "교육기관회원 상세보기 서비스 요청");
		dto = dao.eduDetail(mb_id);
		
	return dto;
	}
	
}
